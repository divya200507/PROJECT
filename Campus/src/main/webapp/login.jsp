<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Login CampusPlace</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
<style>
  :root {
    --navy: #0b1120;
    --navy2: #131c30;
    --teal: #00d9a3;
    --teal-dark: #00b386;
    --gold: #f5c842;
    --white: #f0f4ff;
    --muted: #7a8aaa;
    --card: rgba(255,255,255,0.04);
    --border: rgba(255,255,255,0.08);
  }
  * { margin:0; padding:0; box-sizing:border-box; }
  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--navy);
    color: var(--white);
    min-height: 100vh;
    display: flex;
    overflow: hidden;
  }

  /* LEFT PANEL */
  .left {
    width: 55%;
    position: relative;
    background: var(--navy2);
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 60px;
    overflow: hidden;
  }
  .left::before {
    content:'';
    position:absolute;
    width:500px; height:500px;
    border-radius:50%;
    background: radial-gradient(circle, rgba(0,217,163,0.15) 0%, transparent 70%);
    top:-100px; left:-100px;
    animation: pulse 6s ease-in-out infinite;
  }
  .left::after {
    content:'';
    position:absolute;
    width:300px; height:300px;
    border-radius:50%;
    background: radial-gradient(circle, rgba(245,200,66,0.1) 0%, transparent 70%);
    bottom:50px; right:-50px;
    animation: pulse 8s ease-in-out infinite reverse;
  }
  @keyframes pulse { 0%,100%{transform:scale(1);opacity:0.7} 50%{transform:scale(1.1);opacity:1} }

  .logo { display:flex; align-items:center; gap:12px; margin-bottom:60px; position:relative; z-index:2; }
  .logo-icon {
    width:44px; height:44px; border-radius:12px;
    background: linear-gradient(135deg, var(--teal), var(--teal-dark));
    display:flex; align-items:center; justify-content:center; font-size:20px;
  }
  .logo-text { font-family:'Syne',sans-serif; font-size:22px; font-weight:800; }
  .logo-text span { color:var(--teal); }

  .hero-tag {
    display:inline-block;
    background: rgba(0,217,163,0.1);
    border:1px solid rgba(0,217,163,0.3);
    color:var(--teal);
    font-size:12px; font-weight:500;
    padding:6px 14px; border-radius:20px;
    letter-spacing:1px; text-transform:uppercase;
    margin-bottom:24px; position:relative; z-index:2;
  }
  .hero-title {
    font-family:'Syne',sans-serif;
    font-size:42px; font-weight:800;
    line-height:1.15; margin-bottom:20px;
    position:relative; z-index:2;
  }
  .hero-title span { color:var(--teal); }
  .hero-desc { color:var(--muted); font-size:16px; line-height:1.7; max-width:400px; position:relative; z-index:2; margin-bottom:48px; }

  .stats { display:flex; gap:40px; position:relative; z-index:2; }
  .stat-item { }
  .stat-num { font-family:'Syne',sans-serif; font-size:28px; font-weight:800; color:var(--white); }
  .stat-num span { color:var(--teal); }
  .stat-label { font-size:12px; color:var(--muted); margin-top:2px; }

  .grid-bg {
    position:absolute; inset:0; z-index:0;
    background-image:
      linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
    background-size: 40px 40px;
  }

  /* RIGHT PANEL */
  .right {
    width:45%;
    display:flex; flex-direction:column; justify-content:center; align-items:center;
    padding:60px 50px;
    background: var(--navy);
    position:relative;
  }

  .form-box { width:100%; max-width:380px; }
  .form-title { font-family:'Syne',sans-serif; font-size:28px; font-weight:800; margin-bottom:6px; }
  .form-sub { color:var(--muted); font-size:14px; margin-bottom:36px; }

  .role-tabs {
    display:flex; gap:8px; margin-bottom:32px;
    background: var(--card);
    border:1px solid var(--border);
    border-radius:12px; padding:5px;
  }
  .role-tab {
    flex:1; padding:10px; border-radius:9px; border:none;
    background:transparent; color:var(--muted);
    font-family:'DM Sans',sans-serif; font-size:13px; font-weight:500;
    cursor:pointer; transition:all 0.2s;
  }
  .role-tab.active {
    background: linear-gradient(135deg, var(--teal), var(--teal-dark));
    color: var(--navy); font-weight:700;
  }

  .field { margin-bottom:20px; }
  .field label { display:block; font-size:13px; color:var(--muted); margin-bottom:8px; font-weight:500; }
  .field input {
    width:100%; padding:14px 16px;
    background: var(--card);
    border:1px solid var(--border);
    border-radius:12px; color:var(--white);
    font-family:'DM Sans',sans-serif; font-size:14px;
    outline:none; transition:border-color 0.2s;
  }
  .field input:focus { border-color:var(--teal); }
  .field input::placeholder { color:var(--muted); }

  .forgot { text-align:right; margin-bottom:24px; }
  .forgot a { color:var(--teal); font-size:13px; text-decoration:none; }

  .btn-login {
    width:100%; padding:15px;
    background: linear-gradient(135deg, var(--teal), var(--teal-dark));
    color:var(--navy); font-family:'Syne',sans-serif;
    font-size:15px; font-weight:700;
    border:none; border-radius:12px; cursor:pointer;
    transition:transform 0.15s, box-shadow 0.15s;
    letter-spacing:0.5px;
  }
  .btn-login:hover { transform:translateY(-2px); box-shadow:0 8px 24px rgba(0,217,163,0.35); }

  .divider { display:flex; align-items:center; gap:12px; margin:24px 0; }
  .divider::before, .divider::after { content:''; flex:1; height:1px; background:var(--border); }
  .divider span { color:var(--muted); font-size:12px; }

  .signup-link { text-align:center; font-size:14px; color:var(--muted); }
  .signup-link a { color:var(--teal); text-decoration:none; font-weight:500; }

  /* ANIMATION */
  .form-box > * { opacity:0; transform:translateY(16px); animation:fadeUp 0.5s forwards; }
  .form-box > *:nth-child(1){animation-delay:0.1s}
  .form-box > *:nth-child(2){animation-delay:0.2s}
  .form-box > *:nth-child(3){animation-delay:0.3s}
  .form-box > *:nth-child(4){animation-delay:0.35s}
  .form-box > *:nth-child(5){animation-delay:0.4s}
  .form-box > *:nth-child(6){animation-delay:0.45s}
  .form-box > *:nth-child(7){animation-delay:0.5s}
  .form-box > *:nth-child(8){animation-delay:0.55s}
  @keyframes fadeUp { to{opacity:1;transform:none} }
</style>
</head>
<body>
<form action="login" method="post" style="display:flex; width:100%;">
<div class="left">
  <div class="grid-bg"></div>
  <div class="logo">
    <div class="logo-icon"></div>
    <div class="logo-text">Campus<span>Place</span></div>
  </div>
  <div class="hero-tag">Placement Portal</div>
  <h1 class="hero-title">Your Career<br>Starts <span>Here.</span></h1>
  <p class="hero-desc">Connect with top companies, track your applications, and land your dream job â€” all from one intelligent campus placement platform.</p>
  <div class="stats">
    <div class="stat-item">
      <div class="stat-num">500<span>+</span></div>
      <div class="stat-label">Companies</div>
    </div>
    <div class="stat-item">
      <div class="stat-num">12<span>k</span></div>
      <div class="stat-label">Students Placed</div>
    </div>
    <div class="stat-item">
      <div class="stat-num">98<span>%</span></div>
      <div class="stat-label">Placement Rate</div>
    </div>
  </div>
</div>

<div class="right">
  <div class="form-box">
    <h2 class="form-title">Welcome Back</h2>
    <p class="form-sub">Sign in to your account to continue</p>

    <div class="role-tabs">
      <button class="role-tab active" onclick="setRole(this)">Student</button>
      <button class="role-tab" onclick="setRole(this)">PO</button>
      <button class="role-tab" onclick="setRole(this)">Admin</button>
    </div>

    <div class="field">
      <label>Email Address</label>
      <input type="email"  name= "email" placeholder="you@college.edu"/>
    </div>
    <div class="field">
      <label>Password</label>
      <input type="password" name="password" placeholder="Enter your password"/>
    </div>

    <div class="forgot"><a href="#">Forgot password?</a></div>

    <button class="btn-login" type="submit">Sign In †’</button>

    <div class="divider"><span>New to CampusPlace?</span></div>

    <div class="signup-link">
      Don't have an account? <a href="register.jsp">register</a>
    </div>
  </div>
</div>
</form>
<script>
function setRole(btn){
  document.querySelectorAll('.role-tab').forEach(t=>t.classList.remove('active'));
  btn.classList.add('active');
}

</script>
</body>
</html>