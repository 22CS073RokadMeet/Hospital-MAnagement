package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/appAppointment")
public class AppointmentServlet extends HttpServlet {

	
	

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		int userId = Integer.parseInt(req.getParameter("userid"));
//		String fullname = req.getParameter("fullname");
//		String gender = req.getParameter("gender");
//		String age = req.getParameter("age");
//		String appoint_date = req.getParameter("appoint_date");
//		String email = req.getParameter("email");
//		String phno = req.getParameter("phno");
//		String diseases = req.getParameter("diseases");
//		int doctor_id = Integer.parseInt(req.getParameter("doct"));
//		String address = req.getParameter("address");
//
//		Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id,
//				address, "Pending");
//
//		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
//		HttpSession session = req.getSession();
//
//		if (dao.addAppointment(ap)) {
//			session.setAttribute("succMsg", "Appointment Sucessfully");
//			resp.sendRedirect("user_appointment.jsp");
//		} else {
//			session.setAttribute("errorMsg", "Something wrong on server");
//			resp.sendRedirect("user_appointment.jsp");
//	}
//
//	}

	
	   @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        int userId = Integer.parseInt(req.getParameter("userid"));
	        String fullname = req.getParameter("fullname");
	        String gender = req.getParameter("gender");
	        String age = req.getParameter("age");
	        String appointDate = req.getParameter("appoint_date");
	        String appointTime = req.getParameter("appoint_time"); // New time parameter
	        String email = req.getParameter("email");
	        String phno = req.getParameter("phno");
	        String diseases = req.getParameter("diseases");
	        int doctorId = Integer.parseInt(req.getParameter("doctor_id"));
	        String address = req.getParameter("address");

	        // Setting status as pending initially
	        String status = "Pending";

	        // Create appointment object
	        Appointment ap = new Appointment(userId, fullname, gender, age, appointDate, appointTime, email, phno, diseases, doctorId, address, status);

	        // Call DAO to save the appointment
	        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
	        boolean success = dao.addAppointment(ap);

	        if (success) {
	            resp.sendRedirect("user_appointment.jsp?msg=Appointment booked successfully");
	        } else {
	            resp.sendRedirect("user_appointment.jsp?error=Error while booking appointment");
	        }
	    }
}
