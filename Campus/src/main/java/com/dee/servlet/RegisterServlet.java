package com.dee.servlet;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dee.entity.UserEntity;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database Details
    String url = "jdbc:mysql://localhost:3306/campus";
    String dbUsername = "root";
    String dbPassword = "root";
    // HANDLE POST REQUEST
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       request.getRequestDispatcher("register.jsp")
              .forward(request, response);
    	// AFTER SUCCESSFUL REGISTRATION
    	
    }
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        // GET FORM DATA

        String firstname =
                request.getParameter("firstname");

        String lastname =
                request.getParameter("lastname");

        String fullname =
                firstname + " " + lastname;

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String phone =
                request.getParameter("phone");

        String gender =
                request.getParameter("gender");

        String dob =
                request.getParameter("dob");

        String college =
                request.getParameter("college");

        String department =
                request.getParameter("department");

        String graduationYear =
                request.getParameter("graduationyear");

        String cgpa =
                request.getParameter("cgpa");

        String tenth =
                request.getParameter("tenth");

        String intermediate =
                request.getParameter("intermediate");
        // CREATE USER OBJECT

        UserEntity user = new UserEntity();

        user.setName(fullname);
        user.setEmail(email);
        user.setPassword(password);
     
        // SAVE USER

        UserEntity newUser =
                createNewUser(
                        user,
                        phone,
                        gender,
                        dob,
                        college,
                        department,
                        graduationYear,
                        cgpa,
                        tenth,
                        intermediate
                );

        // FORWARD TO DASHBOARD

      //  RequestDispatcher rd =
        //      request.getRequestDispatcher(
          //      "/Login.jsp");

        //rd.forward(request, response);
        response.sendRedirect("login.jsp");
    }
    // INSERT USER + STUDENT
   

    public UserEntity createNewUser(
            UserEntity user,
            String phone,
            String gender,
            String dob,
            String college,
            String department,
            String graduationYear,
            String cgpa,
            String tenth,
            String intermediate) {

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create Connection
            Connection conn =
                    DriverManager.getConnection(
                            url,
                            dbUsername,
                            dbPassword);

            // INSERT INTO USERS
            String userSql =
            		"INSERT INTO user(full_name,email,password,role)"
            		+ " VALUES(?,?,?,?)";
           

            PreparedStatement userPs =
                    conn.prepareStatement(
                            userSql,
                            PreparedStatement.RETURN_GENERATED_KEYS);

            userPs.setString(1, user.getName());
            userPs.setString(2, user.getEmail());
            userPs.setString(3, user.getPassword());
            userPs.setString(4, "STUDENT");
            int rowsAffected =
                    userPs.executeUpdate();

            if (rowsAffected > 0) {

                System.out.println(
                        "User inserted successfully");

                // GET GENERATED USER ID

                ResultSet rs =
                        userPs.getGeneratedKeys();

                long userId = 0;

                if (rs.next()) {

                    userId = rs.getLong(1);
                }

                // INSERT INTO STUDENTS

                String studentSql =
                        "INSERT INTO students "
                        + "(user_id,college_name,"
                        + "department,graduation_year,"
                        + "cgpa,tenth_percentage,"
                        + "twelfth_percentage,"
                        + "phone,gender,date_of_birth)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?)";

                PreparedStatement studentPs =
                        conn.prepareStatement(studentSql);

                studentPs.setLong(1, userId);

                studentPs.setString(2, college);

                studentPs.setString(3, department);

                studentPs.setInt(4,
                        Integer.parseInt(graduationYear));

                studentPs.setDouble(5,
                        Double.parseDouble(cgpa));

                studentPs.setDouble(6,
                        Double.parseDouble(tenth));

                studentPs.setDouble(7,
                        Double.parseDouble(intermediate));

                studentPs.setString(8, phone);

                studentPs.setString(9, gender);

                studentPs.setString(10, dob);

                studentPs.executeUpdate();

                System.out.println(
                        "Student inserted successfully");
            }

            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }
}