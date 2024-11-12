package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Doctor;

public class AppointmentDAO {

	private Connection conn;

	public AppointmentDAO(Connection conn) {
		super();
		this.conn = conn;
	}

//	public boolean addAppointment(Appointment ap) {
//		boolean f = false;
//
//		try {
//
//			String sql = "insert into appointment(user_id,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setInt(1, ap.getUserId());
//			ps.setString(2, ap.getFullName());
//			ps.setString(3, ap.getGender());
//			ps.setString(4, ap.getAge());
//			ps.setString(5, ap.getAppoinDate());
//			ps.setString(6, ap.getEmail());
//			ps.setString(7, ap.getPhNo());
//			ps.setString(8, ap.getDiseases());
//			ps.setInt(9, ap.getDoctorId());
//			ps.setString(10, ap.getAddress());
//			ps.setString(11, ap.getStatus());
//
//			int i = ps.executeUpdate();
//			if (i == 1) {
//				f = true;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return f;
//	}
	
	 public boolean addAppointment(Appointment ap) {
	        boolean success = false;
	        try {
	            String query = "INSERT INTO appointment(user_id, fullname, gender, age, appoint_date, appoint_time, email, phno, diseases, doctor_id, address, status) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setInt(1, ap.getUserId());
	            ps.setString(2, ap.getFullName());
	            ps.setString(3, ap.getGender());
	            ps.setString(4, ap.getAge());
	            ps.setString(5, ap.getAppoinDate());
	            ps.setString(6, ap.getAppointTime()); // Save the time slot
	            ps.setString(7, ap.getEmail());
	            ps.setString(8, ap.getPhNo());
	            ps.setString(9, ap.getDiseases());
	            ps.setInt(10, ap.getDoctorId());
	            ps.setString(11, ap.getAddress());
	            ps.setString(12, ap.getStatus());

	            ps.executeUpdate();
	            success = true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return success;
	    }
	
	 public List<String> getAvailableTimeSlots(int doctorId, String appointDate) {
	        List<String> allSlots = new ArrayList<>();
	        List<String> bookedSlots = new ArrayList<>();

	        // Assume these are predefined time slots (can be modified)
	        allSlots.add("09:00 AM - 10:00 AM");
	        allSlots.add("10:00 AM - 11:00 AM");
	        allSlots.add("11:00 AM - 12:00 PM");
	        allSlots.add("01:00 PM - 02:00 PM");
	        allSlots.add("02:00 PM - 03:00 PM");
	        allSlots.add("03:00 PM - 04:00 PM");

	        try {
	            String query = "SELECT appoint_time FROM appointment WHERE doctor_id = ? AND appoint_date = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setInt(1, doctorId);
	            ps.setString(2, appointDate);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                bookedSlots.add(rs.getString("appoint_time"));
	            }

	            allSlots.removeAll(bookedSlots); // Remove already booked slots from the list
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return allSlots;
	    }
	 
	 public boolean updateAppointmentStatus(int id, String status) {
		    boolean isUpdated = false;
		    String query = "UPDATE appointment SET status=? WHERE id=?"; // ensure the table/column names are correct

		    try {
		        PreparedStatement pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, status);
		        pstmt.setInt(2, id);

		        int rowCount = pstmt.executeUpdate();
		        if (rowCount > 0) {
		            isUpdated = true;
		        }
		    } catch (Exception e) {
		        e.printStackTrace(); // Log the error for debugging
		    }
		    return isUpdated;
		}

	 
	// Method to update both time and status if doctor reschedules
	 public boolean updateAppointmentTimeAndStatus(int appointmentId, String newTime, String status) {
	     boolean f = false;
	     try {
	         String query = "UPDATE appointment SET appoint_time=?, status=? WHERE id=?";
	         PreparedStatement pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, newTime);
	         pstmt.setString(2, status);
	         pstmt.setInt(3, appointmentId);
	         int rowCount = pstmt.executeUpdate();
	         
	         if (rowCount > 0) {
	             f = true;
	         }
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return f;
	 }

	
	

	 public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		    List<Appointment> list = new ArrayList<Appointment>();
		    Appointment ap = null;

		    try {
		        String sql = "select * from appointment where user_id=?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, userId);

		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            ap = new Appointment();
		            ap.setId(rs.getInt(1));
		            ap.setUserId(rs.getInt(2));
		            ap.setFullName(rs.getString(3));
		            ap.setGender(rs.getString(4));
		            ap.setAge(rs.getString(5));
		            ap.setAppoinDate(rs.getString(6));
		            ap.setAppointTime(rs.getString("appoint_time")); // Retrieve the appoint_time
		            ap.setEmail(rs.getString(7));
		            ap.setPhNo(rs.getString(8));
		            ap.setDiseases(rs.getString(9));
		            ap.setDoctorId(rs.getInt(10));
		            ap.setAddress(rs.getString(11));
		            ap.setStatus(rs.getString(12));
		            list.add(ap);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return list;
		}

	 public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		    List<Appointment> list = new ArrayList<Appointment>();
		    Appointment ap = null;

		    try {
		        String sql = "select * from appointment where doctor_id=?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, doctorId);

		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            ap = new Appointment();
		            ap.setId(rs.getInt(1));
		            ap.setUserId(rs.getInt(2));
		            ap.setFullName(rs.getString(3));
		            ap.setGender(rs.getString(4));
		            ap.setAge(rs.getString(5));
		            ap.setAppoinDate(rs.getString(6));
		            ap.setAppointTime(rs.getString("appoint_time")); // Retrieve the appoint_time
		            ap.setEmail(rs.getString(7));
		            ap.setPhNo(rs.getString(8));
		            ap.setDiseases(rs.getString(9));
		            ap.setDoctorId(rs.getInt(10));
		            ap.setAddress(rs.getString(11));
		            ap.setStatus(rs.getString(12));
		            list.add(ap);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return list;
		}


	public Appointment getAppointmentById(int id) {

		Appointment ap = null;

		try {

			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}

	public boolean updateCommentStatus(int id, int doctId, String comm) {
		boolean f = false;
		try {
			String sql = "update appointment set status=? where id=? and doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public boolean deleteAppointment(int id) {
		boolean f = false;
		try {
			String sql = "delete from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean editAppointment(Appointment d) {
		boolean f = false;

		try {
			String sql = "update appointment set fullname=?,gender=?,age=?,appoint_date=?,phno=?,diseases=?,address=?,status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println("update1");
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getGender());
			ps.setString(3, d.getAge());
			ps.setString(4, d.getAppoinDate());
			ps.setString(5, d.getPhNo());
			ps.setString(6, d.getDiseases());
			ps.setString(7, d.getAddress());
			ps.setString(8, d.getStatus());
			ps.setInt(9, d.getId());
			System.out.println("update2");
			System.out.println("id : "+d.getAppoinDate());
			int i = ps.executeUpdate();
			System.out.println("i : "+i);
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
