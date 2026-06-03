<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Register – CampusPlace</title>
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
    font-family:'DM Sans',sans-serif;
    background:var(--navy);
    color:var(--white);
    min-height:100vh;
  }

  header {
    padding:20px 48px;
    display:flex; align-items:center; justify-content:space-between;
    border-bottom:1px solid var(--border);
  }
  .logo { display:flex; align-items:center; gap:10px; }
  .logo-icon { width:36px; height:36px; border-radius:10px; background:linear-gradient(135deg,var(--teal),var(--teal-dark)); display:flex; align-items:center; justify-content:center; font-size:16px; }
  .logo-text { font-family:'Syne',sans-serif; font-size:18px; font-weight:800; }
  .logo-text span { color:var(--teal); }
  .login-link { color:var(--muted); font-size:14px; }
  .login-link a { color:var(--teal); text-decoration:none; font-weight:500; }

  .page-wrap {
    max-width:760px; margin:0 auto; padding:48px 24px;
  }
  .page-head { text-align:center; margin-bottom:40px; }
  .page-head h1 { font-family:'Syne',sans-serif; font-size:32px; font-weight:800; margin-bottom:8px; }
  .page-head p { color:var(--muted); font-size:15px; }

  .progress-bar {
    display:flex; align-items:center; justify-content:center;
    gap:0; margin-bottom:44px;
  }
  .step {
    display:flex; flex-direction:column; align-items:center; gap:6px;
  }
  .step-circle {
    width:36px; height:36px; border-radius:50%;
    display:flex; align-items:center; justify-content:center;
    font-family:'Syne',sans-serif; font-weight:700; font-size:14px;
    border:2px solid var(--border); color:var(--muted);
    transition:all 0.3s;
  }
  .step.active .step-circle { border-color:var(--teal); background:rgba(0,217,163,0.15); color:var(--teal); }
  .step.done .step-circle { border-color:var(--teal); background:var(--teal); color:var(--navy); }
  .step-label { font-size:11px; color:var(--muted); white-space:nowrap; }
  .step.active .step-label { color:var(--teal); }
  .step-line { width:60px; height:2px; background:var(--border); margin:0 4px; margin-bottom:22px; transition:background 0.3s; }
  .step-line.done { background:var(--teal); }

  .card {
    background:var(--card);
    border:1px solid var(--border);
    border-radius:20px;
    padding:36px;
    margin-bottom:20px;
  }
  .card-title {
    font-family:'Syne',sans-serif; font-size:18px; font-weight:700;
    margin-bottom:24px; display:flex; align-items:center; gap:10px;
  }
  .card-title .icon { font-size:22px; }

  .form-row { display:grid; grid-template-columns:1fr 1fr; gap:18px; margin-bottom:18px; }
  .form-row.single { grid-template-columns:1fr; }
  .form-row.three { grid-template-columns:1fr 1fr 1fr; }
  .field { }
  .field label { display:block; font-size:13px; color:var(--muted); margin-bottom:8px; font-weight:500; }
  .field input, .field select {
    width:100%; padding:13px 15px;
    background:rgba(255,255,255,0.04);
    border:1px solid var(--border);
    border-radius:10px; color:var(--white);
    font-family:'DM Sans',sans-serif; font-size:14px;
    outline:none; transition:border-color 0.2s;
    appearance:none;
  }
  .field input:focus, .field select:focus { border-color:var(--teal); }
  .field input::placeholder { color:var(--muted); }
  .field select option { background:var(--navy2); }

  .btn-row { display:flex; justify-content:flex-end; gap:12px; margin-top:8px; }
  .btn-back {
    padding:13px 28px; background:transparent;
    border:1px solid var(--border); border-radius:10px;
    color:var(--muted); font-family:'DM Sans',sans-serif; font-size:14px;
    cursor:pointer; transition:all 0.2s;
  }
  .btn-back:hover { border-color:var(--muted); color:var(--white); }
  .btn-next {
    padding:13px 32px;
    background:linear-gradient(135deg,var(--teal),var(--teal-dark));
    color:var(--navy); font-family:'Syne',sans-serif;
    font-size:14px; font-weight:700;
    border:none; border-radius:10px; cursor:pointer;
    transition:transform 0.15s, box-shadow 0.15s;
  }
  .btn-next:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(0,217,163,0.3); }

  .section { display:none; }
  .section.active { display:block; animation:fadeUp 0.35s ease; }
  @keyframes fadeUp { from{opacity:0;transform:translateY(12px)} to{opacity:1;transform:none} }

  .terms { font-size:13px; color:var(--muted); margin-top:16px; text-align:center; }
  .terms a { color:var(--teal); text-decoration:none; }

  .success-box {
    text-align:center; padding:40px;
  }
  .success-icon { font-size:56px; margin-bottom:16px; }
  .success-box h2 { font-family:'Syne',sans-serif; font-size:26px; font-weight:800; margin-bottom:10px; }
  .success-box p { color:var(--muted); margin-bottom:28px; }
  .btn-dash {
    display:inline-block; padding:14px 36px;
    background:linear-gradient(135deg,var(--teal),var(--teal-dark));
    color:var(--navy); font-family:'Syne',sans-serif;
    font-size:15px; font-weight:700;
    border-radius:12px; text-decoration:none;
    transition:transform 0.15s;
  }
  .btn-dash:hover { transform:translateY(-2px); }
</style>
</head>
<body>
<form action="register" method="post">
<header>
  <div class="logo">
    <div class="logo-icon">🎓</div>
    <div class="logo-text">Campus<span>Place</span></div>
  </div>
  <div class="login-link">Already registered? <a href="login.jsp">Sign In</a></div>
</header>

<div class="page-wrap">
  <div class="page-head">
    <h1>Create Your Account</h1>
    <p>Join thousands of students getting placed at top companies</p>
  </div>
  <!-- Progress -->
  <div class="progress-bar">
    <div class="step active" id="s1">
      <div class="step-circle">1</div>
      <div class="step-label">Personal</div>
    </div>
    <div class="step-line" id="l1"></div>
    <div class="step" id="s2">
      <div class="step-circle">2</div>
      <div class="step-label">Academic</div>
    </div>
    <div class="step-line" id="l2"></div>
    <div class="step" id="s3">
      <div class="step-circle">3</div>
      <div class="step-label">Account</div>
    </div>
  </div>
  <!-- STEP 1: Personal -->
  <div class="section active" id="sec1">
    <div class="card">
      <div class="card-title"><span class="icon">👤</span> Personal Information</div>
     <div class="form-row">
    <div class="field">
        <label>First Name</label>
        <input type="text" name="firstname" placeholder="Rajesh"/>
    </div>

    <div class="field">
        <label>Last Name</label>
        <input type="text" name="lastname" placeholder="Kumar"/>
    </div>
</div>

<div class="form-row">
    <div class="field">
        <label>Date of Birth</label>
        <input type="date" name="dob"/>
    </div>

    <div class="field">
        <label>Gender</label>
        <select name="gender">
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>
    </div>
</div>

<div class="form-row single">
    <div class="field">
        <label>Phone Number</label>
        <input type="tel" name="phone" placeholder="+91 9876543210"/>
    </div>
   
</div>   
</div>
<div class="btn-row">
  <button type="button"
          class="btn-next"
          onclick="goStep(2)">
    Next →
  </button>
</div>
    </div>
  </div>

  <!-- STEP 2: Academic -->
  <div class="section" id="sec2">
    <div class="card">
      <div class="card-title"><span class="icon">📚</span> Academic Details</div>
      <div class="form-row">
    <div class="field">
        <label>College Name</label>
        <input type="text" name="college" placeholder="VIT University"/>
    </div>

    <div class="field">
        <label>Roll Number</label>
        <input type="text" name="rollnumber" placeholder="20BCE1234"/>
    </div>
</div>

<div class="form-row three">

    <div class="field">
        <label>Department</label>

        <select name="department">
            <option>CSE</option>
            <option>ECE</option>
            <option>EEE</option>
            <option>MECH</option>
            <option>CIVIL</option>
            <option>IT</option>
        </select>
    </div>

    <div class="field">
        <label>Year</label>

        <select name="year">
            <option>1st Year</option>
            <option>2nd Year</option>
            <option>3rd Year</option>
            <option>4th Year</option>
        </select>
    </div>

    <div class="field">
        <label>Graduation Year</label>

        <select name="graduationyear">
            <option>2025</option>
            <option>2026</option>
            <option>2027</option>
            <option>2028</option>
        </select>
    </div>
</div>

<div class="form-row">

    <div class="field">
        <label>CGPA</label>

        <input type="number"
               name="cgpa"
               placeholder="8.5"/>
    </div>

    <div class="field">
        <label>10th %</label>

        <input type="number"
               name="tenth"
               placeholder="90"/>
    </div>
</div>

<div class="form-row single">

    <div class="field">
        <label>12th / Diploma %</label>

        <input type="number"
               name="intermediate"
               placeholder="88"/>
    </div>
</div>
<div class="btn-row">

  <button type="button"
          class="btn-back"
          onclick="goStep(1)">
    ← Back
  </button>

  <button type="button"
          class="btn-next"
          onclick="goStep(3)">
    Next →
  </button>

</div>
    </div>
  </div>
  
  <!-- STEP 3: Account -->
  <div class="section" id="sec3">
    <div class="card">
      <div class="card-title"><span class="icon">🔐</span> Account Setup</div>
     <div class="form-row single">

    <div class="field">
        <label>College Email</label>

        <input type="email"
               name="email"
               placeholder="rollno@college.edu"/>
    </div>
</div>

<div class="form-row">

    <div class="field">
        <label>Password</label>

        <input type="password"
               name="password"
               placeholder="Min 8 characters"/>
    </div>

    <div class="field">
        <label>Confirm Password</label>

        <input type="password"
               name="confirmpassword"
               placeholder="Repeat password"/>
    </div>
    <div class="btn-row">

  <button type="button"
          class="btn-back"
          onclick="goStep(2)">
    ← Back
  </button>

  <button type="submit"
          class="btn-next">
    Create Account ✓
  </button>

</div>
</div>
    <p class="terms">By registering you agree to our <a href="#">Terms</a> and <a href="#">Privacy Policy</a></p>
  </div>
  

  <!-- SUCCESS -->
  <div class="section" id="sec4">
    <div class="card success-box">
      <div class="success-icon">🎉</div>
      <h2>You're All Set!</h2>
      <p>Your account has been created. Start exploring placement opportunities today.</p>
      <a href="student-dashboard.html" class="btn-dash">Go to Dashboard →</a>
    </div>
  </div>

</div>
</form>
<script>
function goStep(n){
  document.querySelectorAll('.section').forEach(s=>s.classList.remove('active'));
  document.getElementById('sec'+n).classList.add('active');
  // update steps
  for(let i=1;i<=3;i++){
    const s=document.getElementById('s'+i);
    const l=document.getElementById('l'+i);
    s.classList.remove('active','done');
    if(l) l.classList.remove('done');
    if(i<n){ s.classList.add('done'); if(l) l.classList.add('done'); }
    else if(i===n && n<=3) s.classList.add('active');
  }
  window.scrollTo({top:0,behavior:'smooth'});
}
</script>
</body>
</html>