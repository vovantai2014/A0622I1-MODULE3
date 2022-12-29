package servlet;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List <Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội"));
        customerList.add(new Customer("Nguyễn Văn Nam","1981-07-13","TP HCM"));
        customerList.add(new Customer("Lại Văn Sâm","1965-08-20","Đà Nẵng"));
        customerList.add(new Customer("Mai Văn Hoàn","1999-08-20","Hà Nội"));
        customerList.add(new Customer("Nguyễn Hồng Anh","2000-01-13","Quảng Nam"));
        customerList.add(new Customer("Trần Lê Quỳnh","2002-04-30","Cần Thơ"));
        customerList.add(new Customer("Nguyễn Văn Quyết","1997-11-16","Thừa Thiên Huế"));


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }
}
