package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/deleteAppoint")
public class deleteAppoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
             
	    
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
		{
			int id = Integer.parseInt(req.getParameter("id"));
			
			AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.deleteAppointment(id)) {
				session.setAttribute("succMsg", "Doctor Delete Sucessfully..");
				resp.sendRedirect("admin/patient.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("admin/patient.jsp");
			}

	}

	

}
