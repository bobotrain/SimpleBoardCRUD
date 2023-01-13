

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class ajaxtestServlet
 */
@WebServlet("/ajaxtestServlet")
public class ajaxtestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("post가 들어옴");
		int num = Integer.parseInt( request.getParameter("num") );
		System.out.println(num);
		//응답을 만듦:
		
		//제이슨 방식으로 보낼것임 ( 응답의 형식을 지정 ) 
		response.setContentType("application/json");
		//문자로 출력 가능. ( out 이라는 변수를 통해.. )
		PrintWriter out = response.getWriter();
		
		//dto의 역할.
		JSONObject obj = new JSONObject();
		
		//데이터 이름이 result / 값이 bobo
		obj.put("result", "bobo");
		out.println(obj);
	}

}
