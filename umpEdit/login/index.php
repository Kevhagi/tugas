<!DOCTYPE html>
<html lang="en">
<head>
    <link rel = "stylesheet" href = "css/style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Juan Comps</title>
</head>
<body>
<div class="bg">

  <div class="header">
      <div class="JS-logo">
          <img src = "css/logo_js.png">
        <div class="JS-title">
            <h1 id = "JuanComps">JuanComps</h1>
            <h4 id = "tagline">Best service for best people</h4>
        </div>
      </div>
  </div>

  <div class="content">
    <section class="stark-login">
    <form method="POST">
      <div id="fade-box">
        <input type="text" name="username" id="username" placeholder="Masukan Username" required>
        <input type="password" name="password" placeholder="Masukan Password" required>
        <button name="login">Log In</button>
      </div>
    </form>
    </section>
  </div>

  <div class = "footer">
    Copyright &copy; 2021 - Pachiko Software House
  </div>

</div>
</body>
</html>
<?php
include "../class/class.php";
  if (isset($_POST['login'])) {
    $cek = $admin->login_admin($_POST['username'],$_POST['password']);
    if ($cek == true) {
      echo "<script>window.location='../index.php';</script>";
    }//jika salah atau tidak benar maka login ulang
    else{
      echo "<script>alert('Login Gagal, Password / Username Salah!');</script>";
    }
  }
?>
