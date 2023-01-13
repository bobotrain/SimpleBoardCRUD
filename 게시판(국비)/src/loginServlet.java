

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

import com.yg.dao.MemberDAO;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("pw"));
		
		//System.out.println(id);
		//System.out.println(pw);
		boolean check = false;
		
		MemberDAO mDao = new MemberDAO();
		
		try {
			check = mDao.loginCheck(id, pw);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		
		obj.put("login", check);
		
		out.println(obj);// 응답을 보낸다.
		
		
	}
}

















