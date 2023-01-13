

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/Ex15Servlet")
public class Ex15Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	private boolean updateBoard(int bno) throws Exception {  // true리턴: 성공, false리턴: 실패.
		Connection conn = getConnection();
		
		String sql = "UPDATE simple_board SET title = title || '!' WHERE bno=?";
		int result = 0;   // update문 실행결과(1:성공, 0:실패)
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		//executeUpdate() 여기서 업데이트되면 1이 출력 / 아니면 0이 출력.
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		//boolean 방식이고  result가 1이면  true가 나오고 아니면 ( 0 ) false가 리턴될것.
		return result==1;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt( request.getParameter("bno") );
		boolean res = false;  // true:업데이트문 실행 성공 / false:업데이트문 실행 실패
		try {
			res = updateBoard(bno);
		} catch(Exception e) { e.printStackTrace(); }
		
		// 응답 만듦:
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		// json객체) result--->TRUE 또는 FAIL
		JSONObject obj = new JSONObject();
		
		//res가 true일때 if문 진입
		if(res) {
			obj.put("result", "TRUE");
		} else {
			//res가 false일 때 여기로 옴.
			obj.put("result", "FAIL");
		}
		
		out.println(obj);
	}
}

















