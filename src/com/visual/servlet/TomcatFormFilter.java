package com.visual.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class TomcatFormFilter implements Filter{

	/**
	* Request.java
	* 对 HttpServletRequestWrapper 进行扩充, 不影响原来的功能并能提供所
	有的HttpServletRequest
	* 接口中的功能. 它可以统一的对 Tomcat 默认设置下的中文问题进行解决而只
	需要用新的Request 对象替换页面中的
	* request 对象即可.
	*/
	
	class Request extends HttpServletRequestWrapper{

		public Request(HttpServletRequest request) {
			super(request);
			// TODO Auto-generated constructor stub
		}
		
		/**
		* 转换由表单读取的数据的内码.
		* 从 ISO 字符转到 UTF-8.
		*/
		public String toChi(String input) {
		try {
		byte[] bytes = input.getBytes("ISO8859-1");
//		return new String(bytes, "GBK");
		return new String(bytes, "UTF-8");
		}
		catch (Exception ex) {
		}
		return null;
		}
		/**
		* Return the HttpServletRequest holded by this object.
		*/
		private HttpServletRequest getHttpServletRequest()
		{
		return (HttpServletRequest)super.getRequest();
		}
		/**
		* 读取参数 -- 修正了中文问题.
		*/
		public String getParameter(String name)
		{
		return
		toChi(getHttpServletRequest().getParameter(name));
		}
		/**
		* 读取参数列表- 修正了中文问题.
		*/
		public String[] getParameterValues(String name)
		{
		String values[] =
		getHttpServletRequest().getParameterValues(name);
		if (values != null) {
		for (int i = 0; i < values.length; i++) {
		values[i] = toChi(values[i]);
		}
		}
		return values;
		}
	}
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpreq = (HttpServletRequest) request;  

		if(httpreq.getMethod().equals("POST")) {
	//		request.setCharacterEncoding("GBK");
			request.setCharacterEncoding("UTF-8");
		} else {
			request = new Request(httpreq);
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
