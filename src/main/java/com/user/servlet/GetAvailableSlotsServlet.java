package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/getAvailableSlot")
public class GetAvailableSlotsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int doctorId = Integer.parseInt(req.getParameter("doctor_id"));
        String appointDate = req.getParameter("appoint_date");

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

        List<String> availableSlots = dao.getAvailableTimeSlots(doctorId, appointDate);
        PrintWriter out = resp.getWriter();

        for (String slot : availableSlots) {
            out.println("<option value='" + slot + "'>" + slot + "</option>");
        }
    }
}
