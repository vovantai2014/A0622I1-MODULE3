import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DangNhapServlet",urlPatterns = "/input")
public class DangNhapServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username  = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter writer = response.getWriter();
        if ("admin".equals(username) && "admin".equals(password)) {
            request.setAttribute("username",username);
            request.setAttribute("password",password);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("dangnhap.jsp");
            requestDispatcher.forward(request,response);
        } else {
            writer.println("<h1>Login Error</h1>");
        }
    }
}
