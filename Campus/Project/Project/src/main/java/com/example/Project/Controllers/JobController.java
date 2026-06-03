package com.example.Project.Controllers;

import java.io.IOException;
import java.util.List;

import com.dee.dao.JobDao;
import com.dee.entity.JobEntity;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/jobs")
public class JobController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        JobDao dao = new JobDao();

        List<JobEntity> jobs =
                dao.getAllJobs();

        request.setAttribute("jobs", jobs);

        request.getRequestDispatcher("job-listings.jsp")
               .forward(request, response);
    }
}