package com.doctor.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/RescheduleAppointment")
public class RescheduleAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RescheduleAppointment() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String newTime = request.getParameter("newTime");

		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		boolean result = dao.updateAppointmentTimeAndStatus(id, newTime, "Rescheduled");

		if (result) {
			request.getSession().setAttribute("succMsg", "Appointment rescheduled successfully.");
		} else {
			request.getSession().setAttribute("errorMsg", "Error in rescheduling appointment.");
		}
		response.sendRedirect("doctor/reschedule.jsp");
	}
}
