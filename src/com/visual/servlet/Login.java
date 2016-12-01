package com.visual.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.visual.dao.IUserDao;
import com.visual.dao.impl.UserDaoImpl;
import com.visual.domain.User;
@WebServlet("/LoginServlet")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verifyc  = request.getParameter("verifycode");
		
		//<span style="font-family: Arial, Helvetica, sans-serif;">//�õ������������</span>
		String svc =(String) request.getSession().getAttribute("sessionverify");
		
		
		boolean psw =new UserDaoImpl().getAdminUserName(username);
		
		
		String pass_psw = new UserDaoImpl().getAdminPassword(username);


		if(username==null||username==""){
			request.setAttribute("msg", "�û�������Ϊ�գ�");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(!psw){
			request.setAttribute("msg", "û������û���");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(psw&&!pass_psw.equals(password)){
			request.setAttribute("msg", "����������������룡");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}

		if(pass_psw.equals(password)){
			request.setAttribute("msg", "�û���"+username+",��ӭ����");
			request.getRequestDispatcher("/edit.jsp").forward(request, response);
			response.setHeader("Refresh","1;url=edit.jsp");
			return;
		}
		
	}

}
