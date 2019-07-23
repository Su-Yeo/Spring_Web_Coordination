<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	div.polaroid {
		width: 275px;
		background-color: white;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		margin-bottom: 25px;
		float : left;
		margin : 20px;
	}
	img {
		align:center;
		margin:0 auto;
		width: 275px;
		height: 400px;
	}
	
	div.container {
		text-align: center;
		padding: 10px 20px;
	}
	
	a {
		color: black; 
		text-decoration: none; 
	}
	a:visited{
		color: black;
	}
</style>
<title></title>
</head>
<body style="text-align:center">
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//maxTemp = 최고온도
	//minTemp = 최저온도
	//Algorithm = 최저온도 + 최고온도 / 2
	int maxTemp = Integer.parseInt(request.getParameter("tmx"));
	int minTemp = Integer.parseInt(request.getParameter("tmn"));
	int Algorithm = (minTemp + maxTemp) / 2;
	//int Algorithm = 10;
	String[] Data = new String[4];
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/man";
		String dbId = "test";
		String dbPass = "test1234";
		
		Class.forName("com.mysql.jdbc.Driver");	
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		if(conn == null)
		{
			out.println("<script>alert('데이터베이스 연결 실패');</script>");
		}
		//DB접속 수정 금지!
		
		if(Algorithm <= 4)
		{
			//패딩, 두꺼운코트
			Data[0] = "padding";
			Data[1] = "coat";
		}
		else if(Algorithm >= 5 && Algorithm <= 8)
		{
			//코트, 가죽자켓
			Data[0] = "coat";
			Data[1] = "leather-jacket";
		}
		else if(Algorithm >= 9 && Algorithm <= 11)
		{
			//자켓, 트렌치코트
			Data[0] = "coat";
			Data[1] = "jacket";
		}
		else if(Algorithm >= 12 && Algorithm <= 16)
		{
			//자켓, 가디건
			Data[0] = "jacket";
		}
		else if(Algorithm >= 17 && Algorithm <= 19)
		{
			//자켓, 가디건, 티셔츠
			Data[0] = "jacket";
			Data[1] = "t-shirt";
		}
		else if(Algorithm >= 20 && Algorithm <= 22)
		{
			//가디건, 티셔츠
			Data[0] = "t-shirt";
		}
		else if(Algorithm >= 23 && Algorithm <= 27)
		{
			//반팔, 티셔츠, 셔츠, 반팔셔츠
			Data[0] = "t-shirt";
			Data[1] = "harf-tshirt";
			Data[2] = "shirt";
			Data[3] = "harf-shirt";			
		}
		else if(Algorithm >= 28)
		{
			//반팔, 민소매
			Data[0] = "harf-tshirt";
			Data[1] = "harf-shirt";
		}
		
		//알고리즘에 맞는 상의 불러오기
		if(Data[1] == null)
		{
			String sql = "Select img_name From style Where data=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Data[0]);
		}
		else if(Data[2] == null)
		{
			String sql = "Select img_name From style Where data=? OR data=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Data[0]);
			pstmt.setString(2, Data[1]);
		}
		else if(Data[3] == null)
		{
			String sql = "Select img_name From style Where data=? OR data=?"
					+ "OR data=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Data[0]);
			pstmt.setString(2, Data[1]);
			pstmt.setString(3, Data[2]);
		}
		else if(Data[4] == null)
		{
			String sql = "Select img_name From style Where data=? OR data=?"
					+ "OR data=? OR data=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Data[0]);
			pstmt.setString(2, Data[1]);
			pstmt.setString(3, Data[2]);
			pstmt.setString(4, Data[3]);
		}

		rs = pstmt.executeQuery();
%>
	<div style="clear:left">
	<p class="p2" style="font-size:24px">Today's Coordination</p>
	</div>
	
	<div style="display: table; margin: 0 auto;">
	<%
		while(rs.next())
		{
			String img = "img/" + rs.getString("img_name");
	%>
		<div class="polaroid">
			<a href="<%= img %>"><img src="<%= img %>" alt="이미지 링크">
				<div class="container">
					<p><%= img %></p>
				</div>
			</a>
		</div>
		<%
		}
	}catch(Exception e){
		//예외 처리
		out.println("<script>alert('Error!!'); history.back();</script>");
	}finally{
		if(pstmt != null)// 쿼리실행 객체 close
			try{pstmt.close();}catch(SQLException e){}
		
		if(conn != null)// Connection 객체 close
			try{conn.close();}catch(SQLException e){}
	}
	
%>
	</div>
</body>
</html>