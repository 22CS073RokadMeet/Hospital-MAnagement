package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Appointment;
import com.entity.Doctor;

@WebServlet("/EditApp")
public class EditAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String fullName = request.getParameter("fullName");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String appoint_date = request.getParameter("appoinDate");
			String phno = request.getParameter("phNo");
			String diseases = request.getParameter("diseases");
			String address = request.getParameter("address");
			String status = request.getParameter("status");
			
			System.out.println(appoint_date);
			 
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("hii meet2");

			Appointment d = new Appointment(id,fullName,gender,age,appoint_date,phno,diseases,address,status);
			System.out.println("hii meet3");

			AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
			HttpSession session = request.getSession();
			System.out.println("hii meet4");

			if (dao.editAppointment(d)) {
				System.out.println("hii meet5");
				Appointment updateDoctor = dao.getAppointmentById(id);
				session.setAttribute("succMsgd", "Appointment Update Sucessfully..");
				session.setAttribute("doctObj", updateDoctor);
				System.out.println("hii meet6");
				response.sendRedirect("admin/patient.jsp");
				System.out.println("hii meet7");
			} else {
				System.out.println("hii meet8");
				session.setAttribute("errorMsgd", "something wrong on server");
				response.sendRedirect("admin/patient.jsp");
				System.out.println("hii meet9");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
