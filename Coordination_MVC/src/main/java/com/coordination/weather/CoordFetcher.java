package com.coordination.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class CoordFetcher{
	private final String sUrlDef = "http://www.kma.go.kr/DFSROOT/POINT/DATA/";
	private final String sUrlMdlHead = "mdl.";
	private final String sUrlLeafHead = "leaf.";
	private final String sUrlTail = ".json.txt";
	private Map<String, String> mapTop;
	private Map<String, String> mapMdl;
	private Map<String, Coord> mapLeaf;

	public CoordFetcher() { }

	private String getStrUrl(String s) {
		if (s.equals("top"))
			return sUrlDef + "top" + sUrlTail;
		else
			return sUrlDef;
	}

	private String getStrUrl(String s, String code) {
		String tmp = null;
		if (s.equals("mdl"))
			tmp = sUrlMdlHead;
		else if (s.equals("leaf"))
			tmp = sUrlLeafHead;
		return sUrlDef + tmp + code + sUrlTail;
	}

	public Coord fetchCoord(String top, String mdl, String leaf) { // 인자: {시군구, 시도, 동면읍}
		JSONArray jsonArrTop = null;
		JSONArray jsonArrMdl = null;
		JSONArray jsonArrLeaf = null;

		jsonArrTop = getRemoteJSONArray(getStrUrl("top"));
		mapTop = getJsonSubMap(jsonArrTop);
		jsonArrMdl = getRemoteJSONArray(getStrUrl("mdl", mapTop.get(top)));
		mapMdl = getJsonSubMap(jsonArrMdl);
		jsonArrLeaf = getRemoteJSONArray(getStrUrl("leaf", mapMdl.get(mdl)));
		mapLeaf = getJsonLeafMap(jsonArrLeaf);
		return mapLeaf.get(leaf);
	}
	
	public Map<String, String> getMap() {
		JSONArray jsonArrTop = null;

		jsonArrTop = getRemoteJSONArray(getStrUrl("top"));
		mapTop = getJsonSubMap(jsonArrTop);
		return mapTop;
	}
	
	public JSONArray getMapMdl(String location){
		JSONArray jsonArrTop = null;
		JSONArray jsonArrMdl = null;
		
		jsonArrTop = getRemoteJSONArray(getStrUrl("top"));
		mapTop = getJsonSubMap(jsonArrTop);
		jsonArrMdl = getRemoteJSONArray(getStrUrl("mdl", mapTop.get(location)));
		//mapMdl = getJsonSubMap(jsonArrMdl);
		return jsonArrMdl;
	}
	
	public JSONArray getMapLeaf(String top, String mdl){
		JSONArray jsonArrTop = null;
		JSONArray jsonArrMdl = null;
		JSONArray jsonArrLeaf = null;

		jsonArrTop = getRemoteJSONArray(getStrUrl("top"));
		mapTop = getJsonSubMap(jsonArrTop);
		jsonArrMdl = getRemoteJSONArray(getStrUrl("mdl", mapTop.get(top)));
		mapMdl = getJsonSubMap(jsonArrMdl);
		jsonArrLeaf = getRemoteJSONArray(getStrUrl("leaf", mapMdl.get(mdl)));
		//mapLeaf = getJsonLeafMap(jsonArrLeaf);
		return jsonArrLeaf;
	}
	
	public Map<String, String> getMapTop() {
		return mapTop;
	}

	public Map<String, String> getMapMdl() {
		return mapMdl;
	}

	public Map<String, Coord> getMapLeaf() {
		return mapLeaf;
	}
	
	
	public JSONArray getRemoteJSONArray(String url) {
		StringBuffer jsonHtml = new StringBuffer();
		try {
			URL u = new URL(url);
			InputStream uis = u.openStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(uis, "UTF-8"));

			String line = null;
			while ((line = br.readLine()) != null) {
				jsonHtml.append(line + "\r\n");
			}
			br.close();
			uis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONArray jsonArr = (JSONArray) JSONValue.parse(jsonHtml.toString());
		return jsonArr;
	}
	
	public Map<String, String> getJsonSubMap(JSONArray jsonArrSource) {
		Map<String, String> jsonMap = new LinkedHashMap<String, String>();

		// 기상청 API 에서 받아오는 JSON은 code:value형식만 갖추므로
		// 이 Algorithm으로 일관되게 mapping할 수 있음
		// (leaf단에서는 x,y값이 추가로 들어가므로 다른 method사용해야함)
		for (int i = 0; i < jsonArrSource.size(); i++) {
			JSONObject jsonObjItem = (JSONObject) jsonArrSource.get(i); // JSONArray에서 JSONObject하나씩 가져옴
			String code = (String) jsonObjItem.get("code"); // JSONObject에서 key, value 가져옴
			String value = (String) jsonObjItem.get("value");
			jsonMap.put(value, code); // 지역이름으로 code를 찾길 원하므로 K,V swap mapping
		}
		return jsonMap;
	}
	
	public Map<String, Coord> getJsonLeafMap(JSONArray jsonArrSource) {
		Map<String, Coord> jsonMap = new LinkedHashMap<String, Coord>();
		for (int i = 0; i < jsonArrSource.size(); i++) {
			JSONObject jsonObjItem = (JSONObject) jsonArrSource.get(i); // JSONArray에서 JSONObject하나씩 가져옴
			String value = (String) jsonObjItem.get("value"); // JSONObject에서 key, value 가져옴
			String x = (String) jsonObjItem.get("x");
			String y = (String) jsonObjItem.get("y");
			jsonMap.put(value, new Coord(x, y));
		}
		return jsonMap;
	}
}

