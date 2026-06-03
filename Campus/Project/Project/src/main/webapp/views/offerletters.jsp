<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Offer Letters – CampusPlace</title>
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

  /* HERO CELEBRATION */
  .hero-offer{
    background:linear-gradient(120deg,rgba(0,217,163,0.12),rgba(77,159,255,0.07),rgba(245,200,66,0.05));
    border:1px solid rgba(0,217,163,0.2);border-radius:20px;padding:28px 32px;
    margin-bottom:26px;display:flex;align-items:center;justify-content:space-between;
    opacity:0;animation:fadeUp 0.5s 0.05s ease forwards;position:relative;overflow:hidden;
  }
  .hero-offer::before{content:'🎉';position:absolute;font-size:120px;right:30px;top:-10px;opacity:0.08;}
  .hero-left .hero-tag{font-size:12px;color:var(--teal);font-weight:600;letter-spacing:1px;text-transform:uppercase;margin-bottom:8px;}
  .hero-left h2{font-family:'Syne',sans-serif;font-size:22px;font-weight:800;margin-bottom:6px;}
  .hero-left p{color:var(--muted);font-size:13px;}
  .hero-pkg{font-family:'Syne',sans-serif;font-size:40px;font-weight:800;color:var(--teal);text-align:right;}
  .hero-pkg-label{font-size:12px;color:var(--muted);text-align:right;margin-top:2px;}

  /* STATS */
  .stats-row{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:26px;}
  .stat-card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px;opacity:0;animation:fadeUp 0.5s ease forwards;}
  .stat-card:nth-child(1){animation-delay:0.1s}.stat-card:nth-child(2){animation-delay:0.18s}
  .stat-card:nth-child(3){animation-delay:0.26s}.stat-card:nth-child(4){animation-delay:0.34s}
  .stat-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;}
  .stat-icon-box{width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:18px;}
  .stat-num{font-family:'Syne',sans-serif;font-size:28px;font-weight:800;}
  .stat-lbl{font-size:12px;color:var(--muted);margin-top:2px;}

  /* GRID */
  .grid-layout{display:grid;grid-template-columns:1.3fr 1fr;gap:22px;}
  .section-card{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:22px 24px;opacity:0;animation:fadeUp 0.5s ease forwards;margin-bottom:20px;}
  .section-card:nth-child(1){animation-delay:0.2s}
  .section-card:nth-child(2){animation-delay:0.3s}
  .sec-title{font-family:'Syne',sans-serif;font-size:15px;font-weight:800;margin-bottom:18px;display:flex;justify-content:space-between;align-items:center;}

  /* OFFER CARD – MAIN */
  .offer-main-card{
    border:1px solid rgba(0,217,163,0.25);border-radius:18px;
    background:linear-gradient(135deg,rgba(0,217,163,0.05),rgba(77,159,255,0.03));
    padding:24px;margin-bottom:16px;position:relative;overflow:hidden;
    cursor:pointer;transition:all 0.25s;
  }
  .offer-main-card:hover{transform:translateY(-2px);box-shadow:0 12px 32px rgba(0,0,0,0.3);border-color:rgba(0,217,163,0.4);}
  .offer-ribbon{position:absolute;top:0;right:0;background:var(--teal);color:var(--navy);font-size:10px;font-weight:800;padding:5px 14px 5px 20px;font-family:'Syne',sans-serif;clip-path:polygon(16px 0,100% 0,100% 100%,0 100%);}
  .omc-top{display:flex;align-items:center;gap:14px;margin-bottom:16px;}
  .omc-logo{width:52px;height:52px;border-radius:14px;background:linear-gradient(135deg,#1a2540,#243060);display:flex;align-items:center;justify-content:center;font-size:24px;}
  .omc-company{font-family:'Syne',sans-serif;font-size:18px;font-weight:800;}
  .omc-role{font-size:13px;color:var(--muted);margin-top:2px;}
  .omc-details{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:16px;}
  .omc-detail{background:rgba(255,255,255,0.03);border:1px solid var(--border);border-radius:10px;padding:12px 14px;}
  .omc-detail-label{font-size:10px;color:var(--muted);text-transform:uppercase;letter-spacing:0.8px;margin-bottom:4px;}
  .omc-detail-val{font-family:'Syne',sans-serif;font-size:16px;font-weight:700;}
  .omc-detail-val.highlight{color:var(--teal);}
  .omc-actions{display:flex;gap:10px;}
  .btn-accept{flex:1;padding:12px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);font-family:'Syne',sans-serif;font-size:13px;font-weight:700;border:none;border-radius:10px;cursor:pointer;transition:transform 0.15s;}
  .btn-accept:hover{transform:translateY(-1px);}
  .btn-download{flex:1;padding:12px;background:transparent;border:1px solid var(--border);color:var(--muted);font-family:'DM Sans',sans-serif;font-size:13px;border-radius:10px;cursor:pointer;transition:all 0.2s;}
  .btn-download:hover{border-color:var(--teal);color:var(--teal);}

  /* OFFER CARD – MINI (other offers) */
  .offer-mini{display:flex;align-items:center;gap:12px;padding:14px;background:rgba(255,255,255,0.02);border:1px solid var(--border);border-radius:12px;margin-bottom:10px;transition:all 0.2s;cursor:pointer;}
  .offer-mini:hover{border-color:rgba(255,255,255,0.15);}
  .om-logo{width:38px;height:38px;border-radius:10px;background:linear-gradient(135deg,#1a2540,#243060);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0;}
  .om-info{flex:1;}
  .om-company{font-size:13px;font-weight:600;}
  .om-role{font-size:11px;color:var(--muted);margin-top:1px;}
  .om-pkg{font-family:'Syne',sans-serif;font-size:14px;font-weight:700;}
  .om-status{font-size:11px;padding:4px 9px;border-radius:8px;font-weight:500;margin-top:4px;display:inline-block;}
  .os-accepted{background:rgba(0,217,163,0.12);color:var(--teal);}
  .os-pending{background:rgba(245,200,66,0.12);color:var(--gold);}
  .os-declined{background:rgba(255,92,92,0.1);color:var(--red);}

  /* DEADLINE BANNER */
  .deadline-banner{background:rgba(245,200,66,0.08);border:1px solid rgba(245,200,66,0.2);border-radius:12px;padding:14px 18px;display:flex;align-items:center;gap:12px;margin-bottom:16px;}
  .db-icon{font-size:20px;}
  .db-text{flex:1;font-size:13px;color:var(--muted);}
  .db-text strong{color:var(--white);}
  .db-days{font-family:'Syne',sans-serif;font-size:20px;font-weight:800;color:var(--gold);flex-shrink:0;}

  /* COMPENSATION BREAKDOWN */
  .comp-row{display:flex;justify-content:space-between;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px;}
  .comp-row:last-child{border-bottom:none;}
  .comp-label{color:var(--muted);}
  .comp-val{font-weight:600;}
  .comp-total{font-family:'Syne',sans-serif;font-size:16px;font-weight:800;color:var(--teal);}

  /* CONFETTI */
  .confetti-wrap{text-align:center;padding:20px 0;}
  .confetti-icon{font-size:52px;animation:bounce 1.5s ease-in-out infinite;}
  @keyframes bounce{0%,100%{transform:translateY(0)}50%{transform:translateY(-10px)}}
  .confetti-text{font-family:'Syne',sans-serif;font-size:18px;font-weight:800;margin:10px 0 6px;color:var(--teal);}
  .confetti-sub{font-size:13px;color:var(--muted);}

  /* TOAST */
  .toast{position:fixed;bottom:28px;right:28px;background:var(--navy2);border:1px solid var(--teal);border-radius:12px;padding:14px 20px;font-size:13px;color:var(--white);transform:translateY(80px);opacity:0;transition:all 0.35s cubic-bezier(.34,1.56,.64,1);z-index:200;}
  .toast.show{transform:none;opacity:1;}

  /* MODAL */
  .modal-bg{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);z-index:100;align-items:center;justify-content:center;backdrop-filter:blur(8px);}
  .modal-bg.open{display:flex;}
  .modal{background:#131c30;border:1px solid rgba(0,217,163,0.25);border-radius:22px;padding:34px;width:520px;max-width:95vw;animation:fadeUp 0.3s ease;text-align:center;}
  .modal-celebrate{font-size:56px;margin-bottom:12px;animation:bounce 1.5s ease-in-out infinite;}
  .modal-title{font-family:'Syne',sans-serif;font-size:22px;font-weight:800;margin-bottom:6px;}
  .modal-sub{color:var(--muted);font-size:14px;line-height:1.6;margin-bottom:22px;}
  .modal-pkg{font-family:'Syne',sans-serif;font-size:36px;font-weight:800;color:var(--teal);margin:16px 0;}
  .modal-actions{display:flex;gap:12px;margin-top:10px;}
  .modal-btn-sec{flex:1;padding:13px;background:transparent;border:1px solid var(--border);border-radius:10px;color:var(--muted);font-family:'DM Sans',sans-serif;font-size:14px;cursor:pointer;transition:all 0.2s;}
  .modal-btn-sec:hover{color:var(--white);border-color:var(--white);}
  .modal-btn-pri{flex:1;padding:13px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);font-family:'Syne',sans-serif;font-size:14px;font-weight:700;border:none;border-radius:10px;cursor:pointer;}

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
  <a class="nav-item" href="#"> Interviews</a>
  <a class="nav-item active" href="#">Offer Letters</a>
  <div class="nav-section">Profile</div>
  <a class="nav-item" href="#"> My Profile</a>
  <a class="nav-item" href="#"> Resume</a>
  <a class="nav-item" href="#">Notifications</a>
  <div class="nav-section">Settings</div>
  <a class="nav-item" href="login.jsp">Logout</a>

  <div class="sidebar-footer">
    <div class="user-chip"><div class="avatar">RK</div><div class="user-info"><div class="name"></div><div class="role"></div></div></div>
  </div>
</aside>

<main class="main">
  <div class="topbar">
    <div><h1>Offer Letters 🏆</h1><p>Your placement results and compensation details</p></div>
  </div>

  <!-- HERO -->
  <div class="hero-offer">
    <div class="hero-left">
      <div class="hero-tag">🎉 Congratulations!</div>
      <h2>You've been placed at Amazon India</h2>
      <p>Software Development Engineer – I &nbsp;·&nbsp; Bengaluru, Karnataka &nbsp;·&nbsp; Joining July 15, 2025</p>
    </div>
    <div>
      <div class="hero-pkg">₹24 LPA</div>
      <div class="hero-pkg-label">Total CTC</div>
    </div>
  </div>

  <!-- STATS -->
  <div class="stats-row">
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(0,217,163,0.12)">🏆</div></div><div class="stat-num">2</div><div class="stat-lbl">Offers Received</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(245,200,66,0.12)">⏳</div></div><div class="stat-num">1</div><div class="stat-lbl">Pending Response</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(77,159,255,0.12)">💰</div></div><div class="stat-num" style="font-size:22px">₹24L</div><div class="stat-lbl">Highest Offer</div></div>
    <div class="stat-card"><div class="stat-top"><div class="stat-icon-box" style="background:rgba(167,139,250,0.12)">📅</div></div><div class="stat-num" style="font-size:18px">Jul 15</div><div class="stat-lbl">Joining Date</div></div>
  </div>

  <div class="grid-layout">
    <!-- LEFT -->
    <div>
      <!-- DEADLINE BANNER -->
      <div class="deadline-banner">
        <div class="db-icon">⏰</div>
        <div class="db-text">Accept or decline the <strong>Infosys offer</strong> before the deadline</div>
        <div class="db-days">3 days left</div>
      </div>

      <!-- MAIN OFFER -->
      <div class="section-card">
        <div class="sec-title">🌟 Primary Offer – Amazon India</div>
        <div class="offer-main-card" onclick="openModal()">
          <div class="offer-ribbon">ACCEPTED</div>
          <div class="omc-top">
            <div class="omc-logo">🅰</div>
            <div><div class="omc-company">Amazon India Pvt. Ltd.</div><div class="omc-role">Software Development Engineer – I</div></div>
          </div>
          <div class="omc-details">
            <div class="omc-detail"><div class="omc-detail-label">Total CTC</div><div class="omc-detail-val highlight">₹24 LPA</div></div>
            <div class="omc-detail"><div class="omc-detail-label">Base Salary</div><div class="omc-detail-val">₹18 LPA</div></div>
            <div class="omc-detail"><div class="omc-detail-label">Location</div><div class="omc-detail-val">Bengaluru</div></div>
            <div class="omc-detail"><div class="omc-detail-label">Joining Date</div><div class="omc-detail-val">July 15, 2025</div></div>
          </div>
          <div class="omc-actions">
            <button class="btn-accept" onclick="event.stopPropagation();showToast('✅ Offer already accepted!')">✅ Accepted</button>
            <button class="btn-download" onclick="event.stopPropagation();showToast('📄 Downloading offer letter...')">⬇ Download PDF</button>
          </div>
        </div>
      </div>

      <!-- OTHER OFFERS -->
      <div class="section-card" style="animation-delay:0.3s">
        <div class="sec-title">📄 Other Offers</div>
        <div class="offer-mini" onclick="showToast('📄 Opening Infosys offer...')">
          <div class="om-logo">🟢</div>
          <div class="om-info">
            <div class="om-company">Infosys Limited</div>
            <div class="om-role">Frontend Developer · Pune</div>
            <span class="om-status os-pending">⏳ Response Pending</span>
          </div>
          <div style="text-align:right">
            <div class="om-pkg" style="color:var(--gold)">₹8 LPA</div>
            <div style="font-size:11px;color:var(--muted);margin-top:3px">Deadline: May 22</div>
          </div>
        </div>
        <div style="display:flex;gap:10px;margin-top:4px;">
          <button onclick="showToast('✅ Infosys offer accepted!')" style="flex:1;padding:10px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);font-family:'Syne',sans-serif;font-size:12px;font-weight:700;border:none;border-radius:9px;cursor:pointer;">Accept</button>
          <button onclick="showToast('❌ Infosys offer declined.')" style="flex:1;padding:10px;background:transparent;border:1px solid var(--border);color:var(--muted);font-family:'DM Sans',sans-serif;font-size:12px;border-radius:9px;cursor:pointer;">Decline</button>
          <button onclick="showToast('⬇ Downloading...')" style="flex:1;padding:10px;background:transparent;border:1px solid var(--border);color:var(--muted);font-family:'DM Sans',sans-serif;font-size:12px;border-radius:9px;cursor:pointer;">Download</button>
        </div>
      </div>
    </div>

    <!-- RIGHT -->
    <div>
      <!-- CELEBRATION -->
      <div class="section-card">
        <div class="confetti-wrap">
          <div class="confetti-icon">🎓</div>
          <div class="confetti-text">You're Placed!</div>
          <div class="confetti-sub">Congratulations on your placement at Amazon India. Your hard work paid off!</div>
        </div>
      </div>

      <!-- COMPENSATION BREAKDOWN -->
      <div class="section-card" style="animation-delay:0.3s">
        <div class="sec-title">💰 Compensation Breakdown</div>
        <div class="comp-row"><span class="comp-label">Base Salary</span><span class="comp-val">₹18,00,000</span></div>
        <div class="comp-row"><span class="comp-label">Stock (RSU)</span><span class="comp-val">₹4,00,000</span></div>
        <div class="comp-row"><span class="comp-label">Joining Bonus</span><span class="comp-val">₹1,50,000</span></div>
        <div class="comp-row"><span class="comp-label">Performance Bonus</span><span class="comp-val">₹50,000</span></div>
        <div class="comp-row"><span class="comp-label">Total CTC</span><span class="comp-val comp-total">₹24,00,000</span></div>
        <div class="comp-row"><span class="comp-label">Take-home (est.)</span><span class="comp-val" style="color:var(--gold)">~₹1,28,000/mo</span></div>
      </div>

      <!-- NEXT STEPS -->
      <div class="section-card" style="animation-delay:0.4s">
        <div class="sec-title">📋 Next Steps</div>
        <div style="display:flex;flex-direction:column;gap:10px;">
          <div style="display:flex;align-items:center;gap:10px;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px;"><span>✅</span><span style="color:var(--muted);text-decoration:line-through;">Accept the offer letter</span></div>
          <div style="display:flex;align-items:center;gap:10px;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px;"><span>✅</span><span style="color:var(--muted);text-decoration:line-through;">Download & sign PDF</span></div>
          <div style="display:flex;align-items:center;gap:10px;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px;"><span>⚠️</span><span>Submit background check documents</span></div>
          <div style="display:flex;align-items:center;gap:10px;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px;"><span>⚠️</span><span>Complete pre-joining formalities</span></div>
          <div style="display:flex;align-items:center;gap:10px;padding:10px 0;font-size:13px;"><span>📅</span><span>Report on July 15, 2025 at 9:00 AM</span></div>
        </div>
        <a href="student-dashboard.html" style="display:flex;align-items:center;justify-content:center;gap:8px;margin-top:16px;padding:12px;background:linear-gradient(135deg,var(--teal),var(--teal-dark));color:var(--navy);font-family:'Syne',sans-serif;font-size:13px;font-weight:700;border-radius:10px;text-decoration:none;">🏠 Back to Dashboard →</a>
      </div>
    </div>
  </div>
</main>

<!-- MODAL: Offer Detail -->
<div class="modal-bg" id="offerModal">
  <div class="modal" onclick="event.stopPropagation()">
    <div class="modal-celebrate">🎉</div>
    <div class="modal-title">Offer from Amazon India</div>
    <div class="modal-sub">You have been selected for the <strong style="color:var(--white)">Software Development Engineer – I</strong> role at Amazon India Pvt. Ltd., Bengaluru.</div>
    <div class="modal-pkg">₹24 LPA</div>
    <div style="background:rgba(0,217,163,0.07);border:1px solid rgba(0,217,163,0.15);border-radius:12px;padding:14px;text-align:left;font-size:13px;color:var(--muted);line-height:1.8;margin-bottom:6px;">
      📍 Location: Bengaluru, Karnataka<br/>
      📅 Joining: July 15, 2025<br/>
      💰 Base: ₹18 LPA + RSU ₹4L + Bonus ₹2L<br/>
      🏢 Department: Engineering – AWS
    </div>
    <div class="modal-actions">
      <button class="modal-btn-sec" onclick="document.getElementById('offerModal').classList.remove('open')">Close</button>
      <button class="modal-btn-pri" onclick="showToast('⬇ Downloading offer letter PDF...');document.getElementById('offerModal').classList.remove('open')">⬇ Download PDF</button>
    </div>
  </div>
</div>

<!-- TOAST -->
<div class="toast" id="toast"></div>

<script>
function openModal(){document.getElementById('offerModal').classList.add('open');}
document.getElementById('offerModal').addEventListener('click',function(e){if(e.target==this)this.classList.remove('open');});
function showToast(msg){
  const t=document.getElementById('toast');
  t.textContent=msg;t.classList.add('show');
  setTimeout(()=>t.classList.remove('show'),3000);
}
</script>
</body>
</html>