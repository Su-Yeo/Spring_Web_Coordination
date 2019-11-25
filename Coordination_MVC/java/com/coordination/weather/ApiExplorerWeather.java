package com.coordination.weather;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.google.gson.*;

import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorerWeather {
	String r ="";
	String baseDate="";
	public ApiExplorerWeather(Coord coord) throws IOException{
		Date today = new Date();
        SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat timeHours = new SimpleDateFormat("HH");
       
        int hours = Integer.parseInt(timeHours.format(today).toString());
        Calendar calendar = new GregorianCalendar();
        if(hours>=0 && hours<2){
        	calendar.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
        	SimpleDateFormat yesterday = new SimpleDateFormat("yyyyMMdd");
        	baseDate = yesterday.format(calendar.getTime());
        }else {
        	baseDate=date.format(today);
        }
       
		
		
        StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=SERVICE_KEY "); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("TEST_SERVICE_KEY", "UTF-8")); /*서비스 인증*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /*‘15년 12월 1일발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0200", "UTF-8")); /*02시 발표 * 기술문서 참조*/
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(coord.getSx(), "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(coord.getSy(), "UTF-8")); /*예보지점의 Y 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("75", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(기본값), json*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        r=sb.toString();
	}
	
	public JsonArray getJArray(){
        JsonObject jsonObject = new JsonParser().parse(r).getAsJsonObject();
        JsonObject jsonObject2 = (JsonObject) jsonObject.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items");
        JsonArray jsonArray = jsonObject2.getAsJsonArray("item");
		return jsonArray;
	}
   
}
