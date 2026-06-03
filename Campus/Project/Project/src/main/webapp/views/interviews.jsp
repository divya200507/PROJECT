<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Interviews – CampusPlace</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
<style>
  :root{--navy:#0b1120;--navy2:#131c30;--sidebar:#0e1628;--teal:#00d9a3;--teal-dark:#00b386;--gold:#f5c842;--red:#ff5c5c;--blue:#4d9fff;--purple:#a78bfa;--white:#f0f4ff;--muted:#7a8aaa;--card:rgba(255,255,255,0.04);--border:rgba(255,255,255,0.07);}
  *{margin:0;padding:0;box-sizing:border-box;}
  body{font-family:'DM Sans',sans-serif;background:var(--navy);color:var(--white);display:flex;min-height:100vh;}

  .sidebar{width:240px;background:var(--sidebar);border-right:1px solid var(--border);display:flex;flex-direction:column;padding:24px 0;position:fixed;top:0;left:0;height:100vh;z-index:10;}
  .logo{display:flex;align-items:center;gap:10px;padding:0 22px 28px;}
  .logo-icon{width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));display:flex;align-items:center;justify-content:center;font-size:16px;}
  .logo-text{font-family:'Syne',sans-serif;font-size:18px;font-weight:800;}
  .logo-text span{color:var(--teal);}
  .nav-section{font-size:10px;color:var(--muted);text-transform:uppercase;letter-spacing:1.5px;padding:0 22px;margin:8px 0 6px;}
  .nav-item{display:flex;align-items:center;gap:12px;padding:12px 22px;color:var(--muted);font-size:14px;cursor:pointer;border-left:3px solid transparent;transition:all 0.2s;text-decoration:none;}
  .nav-item:hover{color:var(--white);background:rgba(255,255,255,0.03);}
  .nav-item.active{color:var(--teal);border-left-color:var(--teal);background:rgba(0,217,163,0.07);}
  .nav-icon{font-size:16px;width:20px;text-align:center;}
  .sidebar-footer{margin-top:auto;padding:20px 22px;border-top:1px solid var(--border);}
  .user-chip{display:flex;align-items:center;gap:10px;}
  .avatar{width:36px;height:36px;border-radius:50%;background:linear-gradient(135deg,var(--teal),var(--blue));display:flex;align-items:center;justify-content:center;font-weight:700;font-size:14px;color:var(--navy);}
  .user-info .name{font-size:14px;font-weight:500;}
  .user-info .role{font-size:11px;color:var(--muted);}

  .main{margin-left:240px;flex:1;padding:32px 36px;}
  .topbar{display:flex;align-items:center;justify-content:space-between;margin-bottom:28px;}
  .topbar h1{font-family:'Syne',sans-serif;font-size:24px;font-weight:800;}
  .topbar p{color:var(--muted);font-size:14px;margin-top:3px;}

  /* STATS */
  .stats-row{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:26px;}
  .stat-card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px;opacity:0;animation:fadeUp 0.5s ease forwards;}
  .stat-card:nth-child(1){animation-delay:0.1s}.stat-card:nth-child(2){animation-delay:0.18s}
  .stat-card:nth-child(3){animation-delay:0.26s}.stat-card:nth-child(4){animation-delay:0.34s}
  .stat-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;}
  .stat-icon-box{width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:18px;}
  .stat-num{font-family:'Syne',sans-serif;font-size:28px;font-weight:800;}
  .stat-lbl{font-size:12px;color:var(--muted);margin-top:2px;}

  /* LAYOUT */
  .grid-layout{display:grid;grid-template-columns:1.4fr 1fr;gap:22px;}

  /* SECTION CARD */
  .section-card{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:22px 24px;opacity:0;animation:fadeUp 0.5s ease forwards;margin-bottom:20px;}
  .section-card:nth-child(1){animation-delay:0.2s}.section-card:nth-child(2){animation-delay:0.28s}
  .sec-title{font-family:'Syne',sans-serif;font-size:15px;font-weight:800;margin-bottom:18px;display:flex;justify-content:space-between;align-items:center;}
  .sec-link{font-size:12px;color:var(--teal);text-decoration:none;font-family:'DM Sans',sans-serif;font-weight:400;}

  /* INTERVIEW CARD */
  .interview-card{border:1px solid var(--border);border-radius:14px;padding:18px;margin-bottom:12px;transition:all 0.2s;cursor:pointer;position:relative;overflow:hidden;}
  .interview-card:hover{border-color:rgba(0,217,163,0.3);background:rgba(0,217,163,0.02);}
  .interview-card.upcoming{border-left:3px solid var(--gold);}
  .interview-card.today{border-left:3px solid var(--teal);background:rgba(0,217,163,0.03);}
  .interview-card.completed{border-left:3px solid var(--muted);opacity:0.7;}
  .interview-card.cancelled{border-left:3px solid var(--red);opacity:0.6;}

  .ic-top{display:flex;align-items:flex-start;justify-content:space-between;margin-bottom:10px;}
  .ic-co{display:flex;align-items:center;gap:10px;}
  .ic-logo{width:38px;height:38px;border-radius:10px;background:linear-gradient(135deg,#1a2540,#243060);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0;}
  .ic-co-name{font-size:14px;font-weight:600;}
  .ic-role{font-size:12px;color:var(--muted);margin-top:1px;}
  .ic-badge{font-size:11px;padding:4px 10px;border-radius:20px;font-weight:500;white-space:nowrap;}
  .ib-today{background:rgba(0,217,163,0.12);color:var(--teal);}
  .ib-upcoming{background:rgba(245,200,66,0.12);color:var(--gold);}
  .ib-done{background:rgba(255,255,255,0.06);color:var(--muted);}
  .ib-cancelled{background:rgba(255,92,92,0.1);color:var(--red);}

  .ic-details{display:flex;gap:20px;flex-wrap:wrap;}
  .ic-detail{display:flex;align-items:center;gap:6px;font-size:12px;color:var(--muted);}
  .ic-detail strong{color:var(--white);}

  .ic-actions{display:flex;gap:8px;margin-top:12px;}
  .ic-btn{padding:7px 16px;border-radius:8px;font-size:12px;font-weight:500;cursor:pointer;transition:all 0.2s;font-family:'DM Sans',sans-serif;}
  .ic-btn-pri{background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);border:none;font-weight:700;}
  .ic-btn-sec{background:transparent;border:1px solid var(--border);color:var(--muted);}
  .ic-btn-sec:hover{border-color:var(--teal);color:var(--teal);}

  /* COUNTDOWN */
  .countdown{display:inline-flex;align-items:center;gap:6px;font-size:11px;padding:4px 10px;border-radius:8px;background:rgba(245,200,66,0.1);color:var(--gold);margin-top:8px;}

  /* CALENDAR MINI */
  .calendar-mini{background:rgba(255,255,255,0.02);border:1px solid var(--border);border-radius:12px;overflow:hidden;}
  .cal-header{padding:12px 16px;border-bottom:1px solid var(--border);display:flex;justify-content:space-between;align-items:center;}
  .cal-month{font-family:'Syne',sans-serif;font-size:13px;font-weight:700;}
  .cal-nav{width:26px;height:26px;border-radius:7px;border:1px solid var(--border);background:transparent;color:var(--muted);cursor:pointer;display:flex;align-items:center;justify-content:center;font-size:12px;transition:all 0.2s;}
  .cal-nav:hover{border-color:var(--teal);color:var(--teal);}
  .cal-grid{display:grid;grid-template-columns:repeat(7,1fr);gap:0;padding:10px;}
  .cal-day-name{text-align:center;font-size:10px;color:var(--muted);padding:4px 0;text-transform:uppercase;letter-spacing:0.5px;}
  .cal-day{text-align:center;font-size:12px;padding:6px 4px;border-radius:7px;cursor:pointer;transition:all 0.15s;position:relative;}
  .cal-day:hover{background:rgba(255,255,255,0.05);}
  .cal-day.today{background:rgba(0,217,163,0.15);color:var(--teal);font-weight:700;}
  .cal-day.has-interview::after{content:'';position:absolute;bottom:2px;left:50%;transform:translateX(-50%);width:4px;height:4px;border-radius:50%;background:var(--gold);}
  .cal-day.empty{color:transparent;cursor:default;}
  .cal-day.selected{background:var(--teal);color:var(--navy);font-weight:700;}

  /* TIP CARD */
  .tip-card{background:linear-gradient(120deg,rgba(0,217,163,0.08),rgba(77,159,255,0.05));border:1px solid rgba(0,217,163,0.15);border-radius:14px;padding:16px;margin-bottom:12px;}
  .tip-title{font-family:'Syne',sans-serif;font-size:13px;font-weight:700;margin-bottom:8px;color:var(--teal);}
  .tip-list{list-style:none;display:flex;flex-direction:column;gap:6px;}
  .tip-list li{font-size:12px;color:var(--muted);display:flex;gap:8px;}
  .tip-list li::before{content:'→';color:var(--teal);flex-shrink:0;}

  @keyframes fadeUp{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:none}}
</style>
</head>
<body>
<aside class="sidebar">
  <div class="logo"><div class="logo-icon">🎓</div><div class="logo-text">Campus<span>Place</span></div></div>
  <div class="nav-section">Main</div>
  <a class="nav-item " href="student-dashbord.jsp">Dashboard</a>
  <a class="nav-item " href="jobListing.jsp"> Job Listings</a>
  <a class="nav-item " href="applications.jsp"> My Applications</a>
  <a class="nav-item active" href="interviews.jsp"> Interviews</a>
  <a class="nav-item" href="#">Offer Letters</a>
  <div class="nav-section">Profile</div>
  <a class="nav-item" href="#"> My Profile</a>
  <a class="nav-item" href="#"> Resume</a>
  <a class="nav-item" href="#">Notifications</a>
  <div class="nav-section">Settings</div>
  <a class="nav-item" href="login.jsp">Logout</a>

  <div class="sidebar-footer">
    <div class="user-chip"><div class="avatar">RK</div><div class="user-info"><div class="name">Rajesh Kumar</div><div class="role">CSE – 2026</div></div></div>
  </div>
</aside>

<main class="main">
  <div class="topbar">
    <div><h1>Interviews 📅</h1><p>Your scheduled and upcoming interview rounds</p></div>
  </div>

  <div class="stats-row">
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(0,217,163,0.12)">📅</div></div><div class="stat-num">4</div><div class="stat-lbl">Total Scheduled</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(245,200,66,0.12)">⏰</div></div><div class="stat-num">2</div><div class="stat-lbl">Upcoming</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(167,139,250,0.12)">✅</div></div><div class="stat-num">1</div><div class="stat-lbl">Completed</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(255,92,92,0.12)">❌</div></div><div class="stat-num">1</div><div class="stat-lbl">Cancelled</div></div>
  </div>

  <div class="grid-layout">
    <!-- LEFT -->
    <div>
      <div class="section-card">
        <div class="sec-title">📍 Today's Interview</div>
        <div class="interview-card today">
          <div class="ic-top">
            <div class="ic-co"><div class="ic-logo">🅰</div><div><div class="ic-co-name">Amazon India</div><div class="ic-role">SDE – I · Technical Round II</div></div></div>
            <span class="ic-badge ib-today">● Today</span>
          </div>
          <div class="ic-details">
            <div class="ic-detail">🕑 <strong>2:00 PM – 3:00 PM</strong></div>
            <div class="ic-detail">🖥️ <strong>Video Call</strong></div>
            <div class="ic-detail">👤 <strong>Interviewer: Ravi S.</strong></div>
          </div>
          <div class="countdown">⏳ Starts in 3 hrs 20 mins</div>
          <div class="ic-actions">
            <button class="ic-btn ic-btn-pri">🔗 Join Meeting</button>
            <button class="ic-btn ic-btn-sec">📋 View JD</button>
            <button class="ic-btn ic-btn-sec">📞 Contact HR</button>
          </div>
        </div>
      </div>

      <div class="section-card" style="animation-delay:0.3s">
        <div class="sec-title">📆 Upcoming Interviews</div>

        <div class="interview-card upcoming">
          <div class="ic-top">
            <div class="ic-co"><div class="ic-logo">🔵</div><div><div class="ic-co-name">Microsoft</div><div class="ic-role">Data Analyst · Technical Round</div></div></div>
            <span class="ic-badge ib-upcoming">May 21</span>
          </div>
          <div class="ic-details">
            <div class="ic-detail">🕑 <strong>2:00 PM – 3:00 PM</strong></div>
            <div class="ic-detail">🖥️ <strong>Video Call</strong></div>
            <div class="ic-detail">📍 <strong>Microsoft Teams</strong></div>
          </div>
          <div class="ic-actions">
            <button class="ic-btn ic-btn-sec">📋 Prepare Notes</button>
            <button class="ic-btn ic-btn-sec">🔗 Get Link</button>
          </div>
        </div>

        <div class="interview-card upcoming">
          <div class="ic-top">
            <div class="ic-co"><div class="ic-logo">🟡</div><div><div class="ic-co-name">Flipkart</div><div class="ic-role">ML Intern · Aptitude Test</div></div></div>
            <span class="ic-badge ib-upcoming">May 20</span>
          </div>
          <div class="ic-details">
            <div class="ic-detail">🕙 <strong>10:00 AM – 11:30 AM</strong></div>
            <div class="ic-detail">💻 <strong>Online (HackerRank)</strong></div>
            <div class="ic-detail">⏱️ <strong>90 Minutes</strong></div>
          </div>
          <div class="ic-actions">
            <button class="ic-btn ic-btn-sec">📖 Practice DSA</button>
            <button class="ic-btn ic-btn-sec">🔗 Test Link</button>
          </div>
        </div>
      </div>

      <div class="section-card" style="animation-delay:0.4s">
        <div class="sec-title">🕐 Past Interviews</div>
        <div class="interview-card completed">
          <div class="ic-top">
            <div class="ic-co"><div class="ic-logo">🅰</div><div><div class="ic-co-name">Amazon India</div><div class="ic-role">SDE – I · Technical Round I</div></div></div>
            <span class="ic-badge ib-done">Completed</span>
          </div>
          <div class="ic-details">
            <div class="ic-detail">📅 <strong>May 15, 2025</strong></div>
            <div class="ic-detail">⏱️ <strong>60 mins</strong></div>
            <div class="ic-detail">🎯 <strong>Result: Passed ✅</strong></div>
          </div>
        </div>
        <div class="interview-card cancelled">
          <div class="ic-top">
            <div class="ic-co"><div class="ic-logo">🔴</div><div><div class="ic-co-name">TCS</div><div class="ic-role">Systems Engineer · HR Round</div></div></div>
            <span class="ic-badge ib-cancelled">Cancelled</span>
          </div>
          <div class="ic-details">
            <div class="ic-detail">📅 <strong>May 7, 2025</strong></div>
            <div class="ic-detail">❌ <strong>Not shortlisted</strong></div>
          </div>
        </div>
      </div>
    </div>

    <!-- RIGHT -->
    <div>
      <div class="section-card">
        <div class="sec-title">📆 May 2025</div>
        <div class="calendar-mini">
          <div class="cal-header">
            <button class="cal-nav">‹</button>
            <div class="cal-month">May 2025</div>
            <button class="cal-nav">›</button>
          </div>
          <div class="cal-grid">
            <div class="cal-day-name">Su</div><div class="cal-day-name">Mo</div><div class="cal-day-name">Tu</div>
            <div class="cal-day-name">We</div><div class="cal-day-name">Th</div><div class="cal-day-name">Fr</div><div class="cal-day-name">Sa</div>
            <div class="cal-day empty"></div><div class="cal-day empty"></div><div class="cal-day empty"></div>
            <div class="cal-day">1</div><div class="cal-day">2</div><div class="cal-day">3</div><div class="cal-day">4</div>
            <div class="cal-day">5</div><div class="cal-day">6</div><div class="cal-day">7</div>
            <div class="cal-day">8</div><div class="cal-day">9</div><div class="cal-day">10</div><div class="cal-day">11</div>
            <div class="cal-day">12</div><div class="cal-day">13</div><div class="cal-day">14</div>
            <div class="cal-day">15</div><div class="cal-day">16</div><div class="cal-day">17</div>
            <div class="cal-day">18</div><div class="cal-day has-interview today selected">19</div><div class="cal-day has-interview">20</div><div class="cal-day has-interview">21</div>
            <div class="cal-day">22</div><div class="cal-day">23</div><div class="cal-day">24</div>
            <div class="cal-day">25</div><div class="cal-day">26</div><div class="cal-day">27</div>
            <div class="cal-day">28</div><div class="cal-day">29</div><div class="cal-day">30</div><div class="cal-day">31</div>
          </div>
        </div>
      </div>

      <div class="section-card" style="animation-delay:0.35s">
        <div class="sec-title">💡 Interview Tips</div>
        <div class="tip-card">
          <div class="tip-title">For Today – Amazon Technical</div>
          <ul class="tip-list">
            <li>Review Trees, Graphs, and Dynamic Programming</li>
            <li>Practice explaining your thought process aloud</li>
            <li>Have your resume and portfolio ready to share</li>
            <li>Test your mic, camera, and internet connection</li>
            <li>Join 5 minutes early</li>
          </ul>
        </div>
        <div class="tip-card" style="background:rgba(77,159,255,0.06);border-color:rgba(77,159,255,0.15);">
          <div class="tip-title" style="color:var(--blue)">General DSA Tips</div>
          <ul class="tip-list">
            <li>Read the problem fully before coding</li>
            <li>Start with brute force, then optimize</li>
            <li>Discuss time and space complexity</li>
            <li>Write clean, readable code</li>
          </ul>
        </div>
      </div>

      <div class="section-card" style="animation-delay:0.45s">
        <div class="sec-title">📊 Interview Summary</div>
        <div style="display:flex;flex-direction:column;gap:10px;">
          <div style="display:flex;justify-content:space-between;font-size:13px;padding:8px 0;border-bottom:1px solid var(--border)"><span style="color:var(--muted)">Rounds cleared</span><span style="font-family:'Syne',sans-serif;font-weight:700;color:var(--teal)">3 / 4</span></div>
          <div style="display:flex;justify-content:space-between;font-size:13px;padding:8px 0;border-bottom:1px solid var(--border)"><span style="color:var(--muted)">Avg. duration</span><span style="font-weight:500">58 mins</span></div>
          <div style="display:flex;justify-content:space-between;font-size:13px;padding:8px 0;border-bottom:1px solid var(--border)"><span style="color:var(--muted)">Success rate</span><span style="font-family:'Syne',sans-serif;font-weight:700;color:var(--gold)">75%</span></div>
          <div style="display:flex;justify-content:space-between;font-size:13px;padding:8px 0"><span style="color:var(--muted)">Next interview</span><span style="font-weight:500;color:var(--gold)">Tomorrow</span></div>
        </div>
        <a href="offer-letters.html" style="display:flex;align-items:center;justify-content:center;gap:8px;margin-top:16px;padding:12px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);font-family:'Syne',sans-serif;font-size:13px;font-weight:700;border-radius:10px;text-decoration:none;">🏆 View Offer Letters →</a>
      </div>
    </div>
  </div>
</main>
</body>
</html>