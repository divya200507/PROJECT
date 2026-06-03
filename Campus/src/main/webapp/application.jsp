<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>My Applications – CampusPlace</title>
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

  /* FILTER */
  .filter-area{display:flex;gap:12px;align-items:center;margin-bottom:20px;flex-wrap:wrap;}
  .search-wrap{flex:1;min-width:220px;display:flex;align-items:center;gap:10px;background:var(--card);border:1px solid var(--border);border-radius:12px;padding:0 14px;}
  .search-wrap input{flex:1;background:none;border:none;color:var(--white);font-family:'DM Sans',sans-serif;font-size:14px;padding:12px 0;outline:none;}
  .search-wrap input::placeholder{color:var(--muted);}
  .filter-tabs{display:flex;gap:8px;flex-wrap:wrap;}
  .ftab{padding:10px 18px;border-radius:10px;border:1px solid var(--border);background:transparent;color:var(--muted);font-family:'DM Sans',sans-serif;font-size:13px;cursor:pointer;transition:all 0.2s;}
  .ftab:hover{border-color:var(--muted);color:var(--white);}
  .ftab.active{background:rgba(0,217,163,0.12);border-color:var(--teal);color:var(--teal);}

  /* CARDS GRID */
  .apps-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(320px,1fr));gap:18px;}
  .app-card{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:22px;opacity:0;animation:fadeUp 0.45s ease forwards;transition:all 0.25s;cursor:pointer;position:relative;overflow:hidden;}
  .app-card:hover{transform:translateY(-3px);border-color:rgba(0,217,163,0.25);box-shadow:0 12px 32px rgba(0,0,0,0.3);}
  .app-card:nth-child(1){animation-delay:0.2s}.app-card:nth-child(2){animation-delay:0.26s}
  .app-card:nth-child(3){animation-delay:0.32s}.app-card:nth-child(4){animation-delay:0.38s}
  .app-card:nth-child(5){animation-delay:0.44s}.app-card:nth-child(6){animation-delay:0.50s}

  .card-top{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:14px;}
  .co-logo{width:46px;height:46px;border-radius:12px;background:linear-gradient(135deg,#1a2540,#243060);display:flex;align-items:center;justify-content:center;font-size:22px;flex-shrink:0;}
  .badge{display:inline-flex;align-items:center;gap:5px;font-size:11px;padding:5px 10px;border-radius:20px;font-weight:500;}
  .b-applied{background:rgba(77,159,255,0.12);color:var(--blue);}
  .b-shortlist{background:rgba(167,139,250,0.12);color:var(--purple);}
  .b-interview{background:rgba(245,200,66,0.12);color:var(--gold);}
  .b-selected{background:rgba(0,217,163,0.12);color:var(--teal);}
  .b-rejected{background:rgba(255,92,92,0.12);color:var(--red);}
  .b-dot{width:6px;height:6px;border-radius:50%;background:currentColor;}

  .role-title{font-family:'Syne',sans-serif;font-size:16px;font-weight:700;margin-bottom:3px;}
  .co-name{font-size:13px;color:var(--muted);margin-bottom:14px;}

  /* PIPELINE MINI */
  .pipeline-mini{display:flex;align-items:center;gap:0;margin-bottom:14px;}
  .pip-dot{width:18px;height:18px;border-radius:50%;border:2px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:8px;transition:all 0.3s;flex-shrink:0;}
  .pip-dot.done{background:var(--teal);border-color:var(--teal);color:var(--navy);}
  .pip-dot.cur{background:rgba(245,200,66,0.2);border-color:var(--gold);}
  .pip-dot.fail{background:rgba(255,92,92,0.15);border-color:var(--red);}
  .pip-line{flex:1;height:2px;background:var(--border);}
  .pip-line.done{background:var(--teal);}

  .card-footer{display:flex;justify-content:space-between;align-items:center;padding-top:14px;border-top:1px solid var(--border);}
  .pkg{font-family:'Syne',sans-serif;font-size:15px;font-weight:800;color:var(--teal);}
  .applied-date{font-size:12px;color:var(--muted);}
  .view-btn{font-size:12px;padding:6px 14px;border-radius:8px;border:1px solid var(--border);background:transparent;color:var(--muted);cursor:pointer;transition:all 0.2s;}
  .view-btn:hover{border-color:var(--teal);color:var(--teal);}

  /* EMPTY */
  .empty{text-align:center;padding:60px;display:none;}
  .empty-icon{font-size:48px;margin-bottom:16px;}
  .empty h3{font-family:'Syne',sans-serif;font-size:20px;margin-bottom:8px;}
  .empty p{color:var(--muted);font-size:14px;}

  /* MODAL */
  .modal-bg{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.75);z-index:100;align-items:center;justify-content:center;backdrop-filter:blur(6px);}
  .modal-bg.open{display:flex;}
  .modal{background:#131c30;border:1px solid var(--border);border-radius:20px;padding:30px;width:500px;max-width:95vw;animation:fadeUp 0.3s ease;}
  .modal-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;}
  .modal-title{font-family:'Syne',sans-serif;font-size:18px;font-weight:800;}
  .close-btn{width:30px;height:30px;border-radius:8px;border:1px solid var(--border);background:transparent;color:var(--muted);cursor:pointer;font-size:16px;}
  .pipeline-full{display:flex;align-items:center;margin:20px 0;gap:0;}
  .pf-step{display:flex;flex-direction:column;align-items:center;gap:6px;flex:1;}
  .pf-circle{width:34px;height:34px;border-radius:50%;border:2px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:14px;}
  .pf-circle.done{background:var(--teal);border-color:var(--teal);}
  .pf-circle.cur{background:rgba(245,200,66,0.15);border-color:var(--gold);animation:glow 2s ease-in-out infinite;}
  .pf-circle.fail{background:rgba(255,92,92,0.15);border-color:var(--red);}
  @keyframes glow{0%,100%{box-shadow:none}50%{box-shadow:0 0 14px rgba(245,200,66,0.4)}}
  .pf-label{font-size:10px;color:var(--muted);text-align:center;}
  .pf-label.done{color:var(--teal);}
  .pf-label.cur{color:var(--gold);}
  .pf-line{flex:1;height:2px;background:var(--border);margin-bottom:20px;}
  .pf-line.done{background:var(--teal);}
  .detail-row{display:flex;justify-content:space-between;padding:9px 0;border-bottom:1px solid var(--border);font-size:14px;}
  .detail-row:last-child{border-bottom:none;}
  .dl{color:var(--muted);}
  .dv{font-weight:500;}
  .modal-actions{display:flex;gap:10px;margin-top:20px;}
  .btn-modal-sec{flex:1;padding:11px;background:transparent;border:1px solid var(--border);border-radius:10px;color:var(--muted);font-family:'DM Sans',sans-serif;font-size:13px;cursor:pointer;transition:all 0.2s;}
  .btn-modal-sec:hover{color:var(--white);border-color:var(--white);}
  .btn-modal-pri{flex:1;padding:11px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);font-family:'Syne',sans-serif;font-size:13px;font-weight:700;border:none;border-radius:10px;cursor:pointer;}

  @keyframes fadeUp{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:none}}
</style>
</head>
<body>
<aside class="sidebar">
  <div class="logo"><div class="logo-icon">🎓</div><div class="logo-text">Campus<span>Place</span></div></div>
  <div class="nav-section">Main</div>
  <a class="nav-item " href="student-dashbord.jsp">Dashboard</a>
  <a class="nav-item" href="jobListing.jsp"> Job Listings</a>
  <a class="nav-item active" href="application.jsp"> My Applications</a>
  <a class="nav-item" href="#"> Interviews</a>
  <a class="nav-item" href="#">Offer Letters</a>
  <div class="nav-section">Profile</div>
  <a class="nav-item" href="#"> My Profile</a>
  <a class="nav-item" href="#"> Resume</a>
  <a class="nav-item" href="#">Notifications</a>
  <div class="nav-section">Settings</div>
  <a class="nav-item" href="login.jsp">Logout</a>

  <div class="sidebar-footer">
    <div class="user-chip"><div class="avatar"></div><div class="user-info"><div class="name"></div><div class="role"></div></div></div>
  </div>
</aside>

<main class="main">
  <div class="topbar">
    <div><h1>My Applications 📋</h1><p>Track every application across all placement drives</p></div>
  </div>

  <div class="stats-row">
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(77,159,255,0.12)">📤</div></div><div class="stat-num">6</div><div class="stat-lbl">Total Applied</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(167,139,250,0.12)">📌</div></div><div class="stat-num">2</div><div class="stat-lbl">Shortlisted</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(245,200,66,0.12)">🎙️</div></div><div class="stat-num">2</div><div class="stat-lbl">In Interview</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(0,217,163,0.12)">🏆</div></div><div class="stat-num">1</div><div class="stat-lbl">Offers</div></div>
  </div>

  <div class="filter-area">
    <div class="search-wrap"><span style="color:var(--muted)">🔍</span><input type="text" placeholder="Search company or role..." oninput="filterApps(this.value)"/></div>
    <div class="filter-tabs">
      <button class="ftab active" onclick="setFilter(this,'all')">All</button>
      <button class="ftab" onclick="setFilter(this,'applied')">Applied</button>
      <button class="ftab" onclick="setFilter(this,'shortlisted')">Shortlisted</button>
      <button class="ftab" onclick="setFilter(this,'interview')">Interview</button>
      <button class="ftab" onclick="setFilter(this,'selected')">Selected</button>
      <button class="ftab" onclick="setFilter(this,'rejected')">Rejected</button>
    </div>
  </div>

  <div class="apps-grid" id="appsGrid">

    <!-- Amazon – Selected -->
    <div class="app-card" data-status="selected" onclick="openModal('Amazon','SDE – I','₹24 LPA','May 10','selected')">
      <div class="card-top"><div class="co-logo">🅰</div><span class="badge b-selected"><span class="b-dot"></span>Selected</span></div>
      <div class="role-title">Software Development Engineer – I</div>
      <div class="co-name">Amazon India Pvt. Ltd.</div>
      <div class="pipeline-mini">
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot done">✓</div>
      </div>
      <div class="card-footer"><div class="pkg">₹24 LPA</div><div class="applied-date">Applied May 10</div><button class="view-btn">Details →</button></div>
    </div>

    <!-- Microsoft – Interview -->
    <div class="app-card" data-status="interview" onclick="openModal('Microsoft','Data Analyst','₹18 LPA','May 12','interview')">
      <div class="card-top"><div class="co-logo">🔵</div><span class="badge b-interview"><span class="b-dot"></span>Interview</span></div>
      <div class="role-title">Data Analyst</div>
      <div class="co-name">Microsoft Corporation</div>
      <div class="pipeline-mini">
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot cur"></div><div class="pip-line"></div>
        <div class="pip-dot"></div>
      </div>
      <div class="card-footer"><div class="pkg">₹18 LPA</div><div class="applied-date">Applied May 12</div><button class="view-btn">Details →</button></div>
    </div>

    <!-- Flipkart – Shortlisted -->
    <div class="app-card" data-status="shortlisted" onclick="openModal('Flipkart','ML Engineer Intern','₹60k/mo','May 8','shortlisted')">
      <div class="card-top"><div class="co-logo">🟡</div><span class="badge b-shortlist"><span class="b-dot"></span>Shortlisted</span></div>
      <div class="role-title">ML Engineer Intern</div>
      <div class="co-name">Flipkart Pvt. Ltd.</div>
      <div class="pipeline-mini">
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot cur"></div><div class="pip-line"></div>
        <div class="pip-dot"></div><div class="pip-line"></div>
        <div class="pip-dot"></div>
      </div>
      <div class="card-footer"><div class="pkg">₹60k/mo</div><div class="applied-date">Applied May 8</div><button class="view-btn">Details →</button></div>
    </div>

    <!-- TCS – Rejected -->
    <div class="app-card" data-status="rejected" onclick="openModal('TCS','Systems Engineer','₹7 LPA','May 5','rejected')">
      <div class="card-top"><div class="co-logo">🔴</div><span class="badge b-rejected"><span class="b-dot"></span>Rejected</span></div>
      <div class="role-title">Systems Engineer</div>
      <div class="co-name">Tata Consultancy Services</div>
      <div class="pipeline-mini">
        <div class="pip-dot done">✓</div><div class="pip-line done"></div>
        <div class="pip-dot fail">✕</div><div class="pip-line"></div>
        <div class="pip-dot"></div><div class="pip-line"></div>
        <div class="pip-dot"></div>
      </div>
      <div class="card-footer"><div class="pkg">₹7 LPA</div><div class="applied-date">Applied May 5</div><button class="view-btn">Details →</button></div>
    </div>

    <!-- Infosys – Applied -->
    <div class="app-card" data-status="applied" onclick="openModal('Infosys','Frontend Developer','₹8 LPA','May 14','applied')">
      <div class="card-top"><div class="co-logo">🟢</div><span class="badge b-applied"><span class="b-dot"></span>Applied</span></div>
      <div class="role-title">Frontend Developer</div>
      <div class="co-name">Infosys Limited</div>
      <div class="pipeline-mini">
        <div class="pip-dot cur"></div><div class="pip-line"></div>
        <div class="pip-dot"></div><div class="pip-line"></div>
        <div class="pip-dot"></div><div class="pip-line"></div>
        <div class="pip-dot"></div>
      </div>
      <div class="card-footer"><div class="pkg">₹8 LPA</div><div class="applied-date">Applied May 14</div><button class="view-btn">Details →</button></div>
    </div>

    <!-- Wipro – Applied -->
    <div class="app-card" data-status="applied" onclick="openModal('Wipro','Cloud Engineer','₹6.5 LPA','May 15','applied')">
      <div class="card-top"><div class="co-logo">💜</div><span class="badge b-applied"><span class="b-dot"></span>Applied</span></div>
      <div class="role-title">Cloud Engineer</div>
      <div class="co-name">Wipro Technologies</div>
      <div class="pipeline-mini">
        <div class="pip-dot cur"></div><div class="pip-line"></div>
        <div class="pip-dot"></div><div class="pip-line"></div>
        <div class="pip-dot"></div><div class="pip-line"></div>
        <div class="pip-dot"></div>
      </div>
      <div class="card-footer"><div class="pkg">₹6.5 LPA</div><div class="applied-date">Applied May 15</div><button class="view-btn">Details →</button></div>
    </div>

  </div>
  <div class="empty" id="emptyState"><div class="empty-icon">📭</div><h3>No applications found</h3><p>Try a different filter.</p></div>
</main>

<!-- MODAL -->
<div class="modal-bg" id="modalBg">
  <div class="modal" onclick="event.stopPropagation()">
    <div class="modal-top"><div class="modal-title" id="mTitle">Application Details</div><button class="close-btn" onclick="closeModal()">✕</button></div>
    <div class="pipeline-full" id="mPipeline"></div>
    <div class="detail-row"><span class="dl">Company</span><span class="dv" id="mCo">—</span></div>
    <div class="detail-row"><span class="dl">Role</span><span class="dv" id="mRole">—</span></div>
    <div class="detail-row"><span class="dl">Package</span><span class="dv" id="mPkg" style="color:var(--teal)">—</span></div>
    <div class="detail-row"><span class="dl">Applied On</span><span class="dv" id="mDate">—</span></div>
    <div class="detail-row"><span class="dl">Status</span><span class="dv" id="mStatus">—</span></div>
    <div class="modal-actions">
      <button class="btn-modal-sec" onclick="closeModal()">Close</button>
      <button class="btn-modal-pri" onclick="window.location.href='interviews.html'">📅 View Interviews →</button>
    </div>
  </div>
</div>

<script>
const pipelines={
  selected:[{l:'Applied',s:'done'},{l:'Aptitude',s:'done'},{l:'Technical',s:'done'},{l:'Selected',s:'done'}],
  interview:[{l:'Applied',s:'done'},{l:'Aptitude',s:'done'},{l:'Technical',s:'cur'},{l:'HR Round',s:''}],
  shortlisted:[{l:'Applied',s:'done'},{l:'Shortlist',s:'cur'},{l:'Technical',s:''},{l:'Selected',s:''}],
  rejected:[{l:'Applied',s:'done'},{l:'Aptitude',s:'fail'},{l:'Technical',s:''},{l:'Selected',s:''}],
  applied:[{l:'Applied',s:'cur'},{l:'Aptitude',s:''},{l:'Technical',s:''},{l:'Selected',s:''}],
};
const statusLabels={selected:'Selected ✅',interview:'Interview Scheduled 🎙️',shortlisted:'Shortlisted 📌',rejected:'Not Selected ❌',applied:'Under Review ⏳'};

function openModal(co,role,pkg,date,status){
  document.getElementById('mTitle').textContent=co+' – '+role;
  document.getElementById('mCo').textContent=co;
  document.getElementById('mRole').textContent=role;
  document.getElementById('mPkg').textContent=pkg;
  document.getElementById('mDate').textContent=date+', 2025';
  document.getElementById('mStatus').textContent=statusLabels[status]||status;
  const steps=pipelines[status]||pipelines.applied;
  let html='';
  steps.forEach((s,i)=>{
    const icon=s.s=='done'?'✓':s.s=='fail'?'✕':s.s=='cur'?'→':(i+1);
    html+=`<div class="pf-step"><div class="pf-circle ${s.s}">${icon}</div><div class="pf-label ${s.s}">${s.l}</div></div>`;
    if(i<steps.length-1)html+=`<div class="pf-line ${s.s=='done'?'done':''}"></div>`;
  });
  document.getElementById('mPipeline').innerHTML=html;
  document.getElementById('modalBg').classList.add('open');
}
function closeModal(){document.getElementById('modalBg').classList.remove('open');}
document.getElementById('modalBg').addEventListener('click',closeModal);

let currentFilter='all';
function setFilter(el,val){
  document.querySelectorAll('.ftab').forEach(t=>t.classList.remove('active'));
  el.classList.add('active');currentFilter=val;apply();
}
function filterApps(q){apply(q);}
function apply(q=''){
  const query=(q||document.querySelector('.search-wrap input').value).toLowerCase();
  let any=false;
  document.querySelectorAll('.app-card').forEach(c=>{
    const show=(currentFilter=='all'||c.dataset.status==currentFilter)&&(query==''||c.innerText.toLowerCase().includes(query));
    c.style.display=show?'':'none';
    if(show)any=true;
  });
  document.getElementById('emptyState').style.display=any?'none':'block';
}
</script>
</body>
</html>