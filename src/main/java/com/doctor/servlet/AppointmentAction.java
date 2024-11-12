package com.doctor.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/AppointmentAction")
public class AppointmentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AppointmentAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		int id = Integer.parseInt(request.getParameter("id"));

		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		boolean result = false;

		if (operation.equals("approve")) {
			result = dao.updateAppointmentStatus(id, "Approved");
		} else if (operation.equals("reject")) {
			result = dao.updateAppointmentStatus(id, "Rejected");
		}

		if (result) {
			request.getSession().setAttribute("succMsg", "Appointment " + operation + "d successfully.");
		} else {
			request.getSession().setAttribute("errorMsg", "Error in updating appointment.");
		}
		response.sendRedirect("doctor/Appointment.jsp");
	}
}
