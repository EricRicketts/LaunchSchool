<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Exercise One</title>
  <link rel="stylesheet" href="../stylesheets/exercise_one.css">
</head>
<body>
  <div class="form-container">
    <h1>Sign Up Form</h1>
    <form action="#" method="POST" novalidate >
      <p id="form_errors"></p>
      <fieldset>
        <dl>
          <dt><label for="first_name">First Name</label></dt>
          <dd>
            <input type="text" id="first_name" name="first_name" required>
            <span class="show_error"></span>
          </dd>
          <dt><label for="last_name">Last Name</label></dt>
          <dd>
            <input type="text" id="last_name" name="last_name" required>
            <span class="show_error"></span>
          </dd>
          <dt><label for="email">Email</label></dt>
          <dd>
            <input type="email" id="email" name="email" placeholder="someone@example.com" pattern=".+@.+" required>
            <span class="show_error"></span>
          </dd>
          <dt><label for="password">Password</label></dt>
          <dd>
            <input type="password" id="password" name="password" minlength="10" required>
            <span class="show_error"></span>
          </dd>
          <dt><label for="phone">Phone Number</label></dt>
          <dd>
            <input type="tel" id="phone" name="phone" placeholder="111-222-3333" pattern="\d{3}-\d{3}-\d{4}">
            <span class="show_error"></span>
          </dd>
        </dl>
      </fieldset>
      <button type="submit">Sign Up</button>
    </form>
  </div>
  <script type="module" src="../public/javascripts/exercise_one.js"></script>
</body>
</html>