package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yg.dto.BoardDTO;
import com.yg.dto.BoardDetailDTO;

public class MemberDAO {
	// getConnection() : DB연결 후 Connection객체의 참조값을 리턴.
	private Connection getConnection() {
		Connection conn = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "test1017";
		String dbPw = "1234";
		
		try {
			Class.forName(driver);
			System.out.println("JDBC 드라이버 로딩 성공");
			conn = DriverManager.getConnection(url, dbId, dbPw);
			System.out.println("접속성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("오라클 접속 실패");
		}
		return conn;
	}

	public boolean loginCheck(String id, int pw) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT count(*) FROM simple_member WHERE id=? AND pw=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setNString(1, id);
		pstmt.setInt(2, pw);
		ResultSet rs = pstmt.executeQuery();
		int cnt=0;
		if(rs.next()) {
			cnt= rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		if(cnt==1) {
			return true;
		}
		return false;
	}
	
	
}











