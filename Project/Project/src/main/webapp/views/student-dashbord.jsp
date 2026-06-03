<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dee.entity.UserEntity"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Student Dashboard</title>
<link
	href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap"
	rel="stylesheet" />
	<link
	href="st_dashboard.css"
	rel="stylesheet" />
<style>

</style>
</head><%
UserEntity loggedInUser = (UserEntity) session.getAttribute("loggedInUser");
if (null != loggedInUser) {
%>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/campus",
        "root",
        "root"
    );

    String query = "SELECT * FROM job_drives";

    ps = con.prepareStatement(query);

    rs = ps.executeQuery();

} catch(Exception e) {

    out.println(e);

}
%>
<%
int totalJobs = 0;
int openJobs = 0;
int soonJobs = 0;
int closedJobs = 0;

try {

    String totalQuery =
        "SELECT COUNT(*) FROM job_drives";

    PreparedStatement totalPs =
        con.prepareStatement(totalQuery);

    ResultSet totalRs =
        totalPs.executeQuery();

    if(totalRs.next()) {
        totalJobs = totalRs.getInt(1);
    }

    String openQuery =
        "SELECT COUNT(*) FROM job_drives WHERE status='Open'";

    PreparedStatement openPs =
        con.prepareStatement(openQuery);

    ResultSet openRs =
        openPs.executeQuery();

    if(openRs.next()) {
        openJobs = openRs.getInt(1);
    }
    String soonQuery =
    		"SELECT COUNT(*) FROM job_drives " +
    		"WHERE last_date BETWEEN CURDATE() " +
    		"AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)";

    		PreparedStatement soonPs =
    		con.prepareStatement(soonQuery);

    		ResultSet soonRs =
    		soonPs.executeQuery();

    		if(soonRs.next()) {
    		    soonJobs = soonRs.getInt(1);
    		}

    String closedQuery =
        "SELECT COUNT(*) FROM job_drives WHERE status='Closed'";

    PreparedStatement closedPs =
        con.prepareStatement(closedQuery);

    ResultSet closedRs =
        closedPs.executeQuery();

    if(closedRs.next()) {
        closedJobs = closedRs.getInt(1);
    }

} catch(Exception e) {

    out.println(e);

} %>
<body>
	<!-- SIDEBAR -->
	<aside class="sidebar">
		<div class="logo">
			<div class="logo-icon"></div>
			<div class="logo-text">
				Campus<span>Place</span>
			</div>
		</div>
		<div class="nav-section">Main</div>
  <a class="nav-item active" href="student-dashbord.jsp">Dashboard</a>
  <a class="nav-item" href="jobs"> Job Listings</a>
  <a class="nav-item" href="#"> My Applications</a>
  <a class="nav-item" href="#"> Interviews</a>
  <a class="nav-item" href="#">Offer Letters</a>
  <div class="nav-section">Profile</div>
  <a class="nav-item" href="#"> My Profile</a>
  <a class="nav-item" href="#"> Resume</a>
  <a class="nav-item" href="#">Notifications</a>
  <div class="nav-section">Settings</div>
  <a class="nav-item" href="login.jsp">Logout</a>

		<div class="sidebar-footer">
			<div class="user-chip">
				<div class="avatar"></div>
				<div class="user-info">
					<div class="name"></div>
					<div class="role"></div>
				</div>
			</div>
		</div>
	</aside>

	<!-- MAIN -->
	<main class="main">
		<div class="topbar">
			<div>
				<h1>
					Welcome,
					<%=loggedInUser.getName()%>
					
				</h1>
				<p>You have 3 new job drives open for your profile</p>
			</div>
			<div class="topbar-right">
				<div class="notif-btn">
					<div class="notif-dot"></div>
				</div>
			</div>
		</div>

		<!-- STATS -->
		<div class="stats-row">
			<div class="stat-card teal">
				<div class="stat-top">
					<div class="stat-icon"></div>
					<div class="stat-badge up">total</div>
				</div>
				<div class="stat-num"><%= totalJobs %></div>
				<div class="stat-label">Jobs Available</div>
			</div>
			<div class="stat-card blue">
				<div class="stat-top">
					<div class="stat-ico"></div>
					<div class="stat-badge up">open</div>
				</div>
				<div class="stat-num"><%= openJobs %></div>
				<div class="stat-label">Applications Sent</div>
			</div>
			<div class="stat-card gold">
				<div class="stat-top">
					<div class="stat-icon"></div>
					<div class="stat-badge warn">soon</div>
				</div>
				<div class="stat-num"><%= soonJobs %></div>
				<div class="stat-label">Interviews Scheduled</div>
			</div>
			<div class="stat-card red">
				<div class="stat-top">
					<div class="stat-icon"></div>
					<div class="stat-badge up">offer</div>
				</div>
				<div class="stat-num"><%= closedJobs %></div>
				<div class="stat-label">Offer Received</div>
			</div>
		</div>

		<!-- ROW 1 -->
		<div class="grid2">
			<div class="widget">
				<div class="widget-title">
					Recent Job Drives <a href="jobListings.jsp">View All </a>
				</div>
				<%
                while(rs.next()) {
                %>	
				<div class="job-item">
					<div class="job-logo"></div>
					<div class="job-info">
						<div class="job-name">
					  <%= rs.getString("job_role") %></div>	
						<div class="job-company">
						<%= rs.getString("company_name") %></div>
					</div>
					<div class="job-right">
						<div class="job-pkg">
						   <%= rs.getString("package_lpa") %>LPA</div>
						<div class="job-date">
						 LAST DATE <%= rs.getString("last_date") %></div>
					</div>
					<div>
						<span class="job-tag tag-closed">
						  <%= rs.getString("status") %></span>
					</div>
				</div>
			<%
            }
           %>
			</div>

			<div class="widget">
				<div class="widget-title">Notices</div>
				<div class="notice-item">
					<div class="notice-head">
						<div class="notice-title">
							<span class="notice-dot"></span>Pre-Placement Talk
						</div>
						<div class="notice-time">Today</div>
					</div>
					<div class="notice-body">Amazon PPT scheduled for 3 PM in
						Seminar Hall A. All eligible students must attend.</div>
				</div>
				<div class="notice-item">
					<div class="notice-head">
						<div class="notice-title">
							<span class="notice-dot"></span>Resume Deadline
						</div>
						<div class="notice-time">Tomorrow</div>
					</div>
					<div class="notice-body">Submit updated resumes to the
						placement portal by May 17, 11:59 PM.</div>
				</div>
				<div class="notice-item">
					<div class="notice-head">
						<div class="notice-title">Mock Interview Drive</div>
						<div class="notice-time">May 20</div>
					</div>
					<div class="notice-body">Register for mock interviews with
						alumni mentors. Slots filling fast!</div>
				</div>
			</div>
		</div>

		<!-- ROW 2 -->
		<div class="grid2">
			<div class="widget">
				<div class="widget-title">Upcoming Timeline</div>
				<div class="timeline-item">
					<div class="tl-left">
						<div class="tl-dot"></div>
						<div class="tl-line"></div>
					</div>
					<div class="tl-content">
						<div class="tl-title">Amazon Aptitude Test</div>
						<div class="tl-sub">May 18, 10:00 AM  Online</div>
					</div>
				</div>
				<div class="timeline-item">
					<div class="tl-left">
						<div class="tl-dot" style="background: var(--gold)"></div>
						<div class="tl-line"></div>
					</div>
					<div class="tl-content">
						<div class="tl-title">Microsoft Technical Round</div>
						<div class="tl-sub">May 21, 2:00 PM  Video Call</div>
					</div>
				</div>
				<div class="timeline-item">
					<div class="tl-left">
						<div class="tl-dot" style="background: var(--blue)"></div>
					</div>
					<div class="tl-content">
						<div class="tl-title">Resume Submission Deadline</div>
						<div class="tl-sub">May 17, 11:59 PM</div>
					</div>
				</div>
			</div>

			<div class="widget">
				<div class="widget-title">Profile Completion</div>
				<div class="profile-bar">
					<span>72% complete</span><span style="color: var(--teal)">72%</span>
				</div>
				<div class="bar-track">
					<div class="bar-fill"></div>
				</div>
				<div class="todo-item">
					<span class="todo-icon"></span><span class="todo-done">Basic
						Info</span>
				</div>
				<div class="todo-item">
					<span class="todo-icon"></span><span class="todo-done">Academic
						Details</span>
				</div>
				<div class="todo-item">
					<span class="todo-icon"> </span><span class="todo-pending">Upload
						Resume</span>
				</div>
				<div class="todo-item">
					<span class="todo-icon"></span><span class="todo-pending">Add
						Skills</span>
				</div>
				<div class="todo-item">
					<span class="todo-icon"></span><span class="todo-pending">Add
						Projects</span>
				</div>
			</div>
		</div>
	</main>
</body>

<%
try {

    if(rs != null)
        rs.close();

    if(ps != null)
        ps.close();

    if(con != null)
        con.close();

} catch(Exception e) {

    out.println(e);

}
%>

<%
}else {
RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
rd.forward(request, response);
}
%>

</html>