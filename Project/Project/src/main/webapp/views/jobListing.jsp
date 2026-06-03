<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Job Listings – CampusPlace</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
<style>
  :root {
    --navy: #0b1120; --navy2: #131c30; --sidebar: #0e1628;
    --teal: #00d9a3; --teal-dark: #00b386; --gold: #f5c842;
    --red: #ff5c5c; --blue: #4d9fff; --white: #f0f4ff;
    --muted: #7a8aaa; --card: rgba(255,255,255,0.04);
    --border: rgba(255,255,255,0.07);
  }
  * { margin:0; padding:0; box-sizing:border-box; }
  body { font-family:'DM Sans',sans-serif; background:var(--navy); color:var(--white); display:flex; min-height:100vh; }
  .sidebar { width:240px; background:var(--sidebar); border-right:1px solid var(--border); display:flex; flex-direction:column; padding:24px 0; position:fixed; top:0; left:0; height:100vh; }
  .logo { display:flex; align-items:center; gap:10px; padding:0 22px 28px; }
  .logo-icon { width:36px; height:36px; border-radius:10px; background:linear-gradient(135deg,var(--teal),var(--teal-dark)); display:flex; align-items:center; justify-content:center; font-size:16px; }
  .logo-text { font-family:'Syne',sans-serif; font-size:18px; font-weight:800; }
  .logo-text span { color:var(--teal); }
  .nav-section { font-size:10px; color:var(--muted); text-transform:uppercase; letter-spacing:1.5px; padding:0 22px; margin:8px 0 6px; }
  .nav-item { display:flex; align-items:center; gap:12px; padding:12px 22px; color:var(--muted); font-size:14px; cursor:pointer; border-left:3px solid transparent; transition:all 0.2s; text-decoration:none; }
  .nav-item:hover { color:var(--white); background:rgba(255,255,255,0.03); }
  .nav-item.active { color:var(--teal); border-left-color:var(--teal); background:rgba(0,217,163,0.07); }
  .nav-icon { font-size:16px; width:20px; text-align:center; }
  .sidebar-footer { margin-top:auto; padding:20px 22px; border-top:1px solid var(--border); }
  .user-chip { display:flex; align-items:center; gap:10px; }
  .avatar { width:36px; height:36px; border-radius:50%; background:linear-gradient(135deg,var(--teal),var(--blue)); display:flex; align-items:center; justify-content:center; font-weight:700; font-size:14px; color:var(--navy); }
  .user-info .name { font-size:14px; font-weight:500; }
  .user-info .role { font-size:11px; color:var(--muted); }
  .main { margin-left:240px; flex:1; padding:32px 36px; }
  .topbar { display:flex; align-items:center; justify-content:space-between; margin-bottom:28px; }
  .topbar h1 { font-family:'Syne',sans-serif; font-size:24px; font-weight:800; }
  .topbar p { color:var(--muted); font-size:14px; margin-top:2px; }

  /* FILTERS */
  .filter-row {
    display:flex; gap:12px; flex-wrap:wrap; margin-bottom:24px;
  }
  .search-box {
    flex:1; min-width:240px;
    display:flex; align-items:center; gap:10px;
    background:var(--card); border:1px solid var(--border);
    border-radius:12px; padding:0 16px;
  }
  .search-box input {
    flex:1; background:none; border:none; color:var(--white);
    font-family:'DM Sans',sans-serif; font-size:14px;
    padding:13px 0; outline:none;
  }
  .search-box input::placeholder { color:var(--muted); }
  .search-icon { color:var(--muted); font-size:16px; }

  .filter-select {
    background:var(--card); border:1px solid var(--border);
    border-radius:12px; padding:13px 16px;
    color:var(--white); font-family:'DM Sans',sans-serif;
    font-size:14px; cursor:pointer; outline:none;
    appearance:none; min-width:140px;
  }
  .filter-select option { background:var(--navy2); }

  .filter-chips { display:flex; gap:8px; flex-wrap:wrap; margin-bottom:20px; }
  .chip {
    padding:7px 16px; border-radius:20px; border:1px solid var(--border);
    color:var(--muted); font-size:12px; cursor:pointer; transition:all 0.2s;
  }
  .chip:hover { border-color:var(--teal); color:var(--teal); }
  .chip.active { background:rgba(0,217,163,0.12); border-color:var(--teal); color:var(--teal); }
  /* GRID */
  .jobs-grid { display:grid; grid-template-columns:repeat(auto-fill, minmax(320px, 1fr)); gap:18px; }
  .job-card {
    background:var(--card); border:1px solid var(--border);
    border-radius:18px; padding:22px;
    cursor:pointer; transition:all 0.25s;
    animation:fadeUp 0.4s ease forwards; opacity:0;
    position:relative; overflow:hidden;
  }
  .job-card:hover { border-color:rgba(0,217,163,0.35); transform:translateY(-3px); box-shadow:0 12px 32px rgba(0,0,0,0.3); }
  .job-card:nth-child(1){animation-delay:0.1s}
  .job-card:nth-child(2){animation-delay:0.15s}
  .job-card:nth-child(3){animation-delay:0.2s}
  .job-card:nth-child(4){animation-delay:0.25s}
  .job-card:nth-child(5){animation-delay:0.3s}
  .job-card:nth-child(6){animation-delay:0.35s}
  @keyframes fadeUp { to{opacity:1;transform:none} from{opacity:0;transform:translateY(14px)} }

  .card-top { display:flex; align-items:flex-start; justify-content:space-between; margin-bottom:16px; }
  .company-logo {
    width:48px; height:48px; border-radius:12px;
    background:linear-gradient(135deg,#1a2540,#243060);
    display:flex; align-items:center; justify-content:center; font-size:22px;
  }
  .status-badge { font-size:11px; padding:4px 10px; border-radius:20px; font-weight:500; }
  .status-open { background:rgba(0,217,163,0.12); color:var(--teal); }
  .status-closed { background:rgba(255,92,92,0.12); color:var(--red); }
  .status-applied { background:rgba(77,159,255,0.12); color:var(--blue); }
  .job-role { font-family:'Syne',sans-serif; font-size:17px; font-weight:700; margin-bottom:3px; }
  .job-company-name { font-size:13px; color:var(--muted); margin-bottom:14px; }
  .tags-row { display:flex; gap:8px; flex-wrap:wrap; margin-bottom:16px; }
  .tag {
    font-size:11px; padding:4px 10px; border-radius:8px;
    background:rgba(255,255,255,0.06); color:var(--muted);
  }
  .tag.highlight { background:rgba(0,217,163,0.08); color:var(--teal); }
  .meta-row { display:flex; justify-content:space-between; align-items:center; padding-top:14px; border-top:1px solid var(--border); }
  .pkg { font-family:'Syne',sans-serif; font-size:16px; font-weight:800; color:var(--teal); }
  .pkg-label { font-size:10px; color:var(--muted); }
  .deadline { font-size:12px; color:var(--muted); }
  .apply-btn {
    width:100%; margin-top:14px; padding:12px;
    background:linear-gradient(135deg,var(--teal),var(--teal-dark));
    color:var(--navy); font-family:'Syne',sans-serif;
    font-size:13px; font-weight:700;
    border:none; border-radius:10px; cursor:pointer;
    transition:transform 0.15s, box-shadow 0.15s; display:none;
  }
  .job-card:hover .apply-btn { display:block; animation:fadeUp 0.2s forwards; }
  .apply-btn:hover { box-shadow:0 6px 18px rgba(0,217,163,0.3); }

  .eligibility { font-size:12px; color:var(--muted); margin-top:12px; }
  .eligibility span { color:var(--white); }
</style>
</head>
<body>
<aside class="sidebar">
  <div class="logo">
    <div class="logo-icon">🎓</div>
    <div class="logo-text">Campus<span>Place</span></div>
  </div>
 <a class="nav-item" href="student-dashbord.jsp">Dashboard</a>
  <a class="nav-item active" href="jobs"> Job Listings</a>
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
      <div class="user-info"><div class="name"></div><div class="role"></div></div>
    </div>
  </div>
</aside>
<main class="main">
  <div class="topbar">
    <div><h1>Job Listings 💼</h1><p>12 drives open matching your profile</p></div>
  </div>
  <div class="filter-row">
    <div class="search-box">
      <span class="search-icon">🔍</span>
      <input type="text" placeholder="Search companies, roles, skills..."/>
    </div>
    <select class="filter-select"><option>All Departments</option>
                                  <option>CSE</option>
                                  <option>ECE</option>
                                  <option>IT</option>
                                  <option>MECH</option>
                                  </select>
    <select class="filter-select"><option>Sort:Newest</option>
                                  <option>Package:High</option>
                                  <option>Deadline Soon</option>
                                  </select>
  </div>
  <div class="filter-chips">
    <div class="chip active">All</div>
    <div class="chip">Open</div>
    <div class="chip">Applied</div>
    <div class="chip">Full Time</div>
    <div class="chip">Internship</div>
    <div class="chip">Dream Company</div>
  </div>
  <div class="jobs-grid">
    <!-- CARD 1 -->
    <div class="job-card">
      <div class="card-top">
        <div class="status-badge status-open">● Open</div>
      </div>
      <div class="job-role">Software Development Engineer</div>
      <div class="job-company-name">Amazon India Pvt. Ltd.</div>
      <div class="tags-row">
        <div class="tag highlight">Full Time</div>
        <div class="tag">Bengaluru</div>
        <div class="tag">DSA</div>
        <div class="tag">Java</div>
      </div>
      <div class="eligibility">CGPA ≥ <span>7.0</span> · No Backlogs · <span>CSE / IT / ECE</span></div>
      <div class="meta-row">
        <div><div class="pkg">₹24 LPA</div><div class="pkg-label">CTC</div></div>
        <div class="deadline">📅 Closes May 25</div>
      </div>
      <button class="apply-btn">Apply Now →</button>
    </div>
    <!-- CARD 2 -->
    <div class="job-card">
      <div class="card-top">
        <div class="status-badge status-applied">✓ Applied</div>
      </div>
      <div class="job-role">Data Analyst</div>
      <div class="job-company-name">Microsoft Corporation</div>
      <div class="tags-row">
        <div class="tag highlight">Full Time</div>
        <div class="tag">Hyderabad</div>
        <div class="tag">Python</div>
        <div class="tag">SQL</div>
      </div>
      <div class="eligibility">CGPA ≥ <span>7.5</span> · No Backlogs · <span>All Branches</span></div>
      <div class="meta-row">
        <div><div class="pkg">₹18 LPA</div><div class="pkg-label">CTC</div></div>
        <div class="deadline">📅 May 30</div>
      </div>
      <button class="apply-btn" style="background:rgba(77,159,255,0.2);color:var(--blue);">View Status →</button>
    </div>
    <!-- CARD 3 -->
    <div class="job-card">
      <div class="card-top">
        <div class="status-badge status-open">● Open</div>
      </div>
      <div class="job-role">Frontend Developer</div>
      <div class="job-company-name">Infosys Limited</div>
      <div class="tags-row">
        <div class="tag highlight">Full Time</div>
        <div class="tag">Pune</div>
        <div class="tag">React</div>
        <div class="tag">JavaScript</div>
      </div>
      <div class="eligibility">CGPA ≥ <span>6.5</span> · <span>CSE / IT</span></div>
      <div class="meta-row">
        <div><div class="pkg">₹8 LPA</div><div class="pkg-label">CTC</div></div>
        <div class="deadline">📅 June 5</div>
      </div>
      <button class="apply-btn">Apply Now →</button>
    </div>
    <!-- CARD 4 -->
    <div class="job-card">
      <div class="card-top">
        <div class="status-badge status-open">● Open</div>
      </div>
      <div class="job-role">Cloud Engineer</div>
      <div class="job-company-name">Wipro Technologies</div>
      <div class="tags-row">
        <div class="tag highlight">Full Time</div>
        <div class="tag">Chennai</div>
        <div class="tag">AWS</div>
        <div class="tag">Linux</div>
      </div>
      <div class="eligibility">CGPA ≥ <span>6.0</span> · <span>All Branches</span></div>
      <div class="meta-row">
        <div><div class="pkg">₹6.5 LPA</div><div class="pkg-label">CTC</div></div>
        <div class="deadline">📅 June 10</div>
      </div>
      <button class="apply-btn">Apply Now →</button>
    </div>
    <!-- CARD 5 -->
    <div class="job-card">
      <div class="card-top">
        <div class="status-badge status-closed">✕ Closed</div>
      </div>
      <div class="job-role">Systems Engineer</div>
      <div class="job-company-name">TCS</div>
      <div class="tags-row">
        <div class="tag highlight">Full Time</div>
        <div class="tag">Mumbai</div>
        <div class="tag">Java</div>
      </div>
      <div class="eligibility">CGPA ≥ <span>6.0</span> · <span>All Branches</span></div>
      <div class="meta-row">
        <div><div class="pkg">₹7 LPA</div><div class="pkg-label">CTC</div></div>
        <div class="deadline">📅 Ended</div>
      </div>
    </div>
    <!-- CARD 6 -->
    <div class="job-card">
      <div class="card-top">
        <div class="status-badge status-open">● Open</div>
      </div>
      <div class="job-role">ML Engineer Intern</div>
      <div class="job-company-name">Flipkart</div>
      <div class="tags-row">
        <div class="tag highlight">Internship</div>
        <div class="tag">Bengaluru</div>
        <div class="tag">Python</div>
        <div class="tag">TensorFlow</div>
      </div>
      <div class="eligibility">CGPA ≥ <span>8.0</span> · <span>CSE / DS / AI</span></div>
      <div class="meta-row">
        <div><div class="pkg">₹60k/mo</div><div class="pkg-label">Stipend</div></div>
        <div class="deadline">📅 June 2</div>
      </div>
      <button class="apply-btn">Apply Now →</button>
    </div>
  </div>
</main>
<script>
document.querySelectorAll('.chip').forEach(c=>{
  c.addEventListener('click',()=>{
    document.querySelectorAll('.chip').forEach(x=>x.classList.remove('active'));
    c.classList.add('active');
  });
});
</script>
</body>
</html>