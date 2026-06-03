package com.dee.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dee.entity.JobEntity;

public class JobDao {

    String url = "jdbc:mysql://localhost:3306/campus";
    String username = "root";
    String password = "root";

    public List<JobEntity> getAllJobs() {

        List<JobEntity> jobs = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn =
                    DriverManager.getConnection(
                            url,
                            username,
                            password);

            String sql = "SELECT * FROM jobs";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                JobEntity job = new JobEntity();

                job.setJobId(rs.getInt("id"));
                job.setCompanyName(rs.getString("company_name"));
                job.setRole(rs.getString("role"));
                job.setLocation(rs.getString("location"));
                job.setPackageOffered(rs.getString("package_ctc"));
                job.setSkills(rs.getString("skills"));
                job.setEligibility(rs.getString("eligibility"));
                job.setStatus(rs.getString("status"));

                jobs.add(job);
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobs;
    }
}