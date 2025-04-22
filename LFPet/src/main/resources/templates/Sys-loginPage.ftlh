
<html class="">

<head>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="styles.css">
</head>

<body class="h-full text-base-content">
<div id="login-pet-finder" class="bg-gray-50 min-h-screen p-4">
  <div id="header" class="flex justify-center mb-8 pt-6">
    <h1 class="text-2xl font-bold text-neutral-800">L&F Pet</h1>
  </div>
  <div id="login-form" class="bg-white rounded-xl p-6 shadow-sm mx-auto max-w-sm">
    <h2 class="text-xl font-semibold text-gray-800 mb-6">Sign In</h2>
    <form class="space-y-4">
      <div>
        <label class="block text-sm text-gray-600 mb-1">Email</label>
        <input type="email" class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none" placeholder="Enter your email">
      </div>
      <div>
        <label class="block text-sm text-gray-600 mb-1">Password</label>
        <input type="password" class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none" placeholder="Enter your password">
      </div>
      <div class="pt-2">
        <a
                href="Sysadmin-dashboard.ftlh"
                class="block w-full bg-blue-600 text-white py-3 rounded-lg font-medium hover:bg-blue-700 transition-colors text-center"
        >
          Sign In
        </a>
      </div>
    </form>
    <div class="mt-6 text-center">
      <p class="text-sm text-gray-500">
        Need an account?
        <a href = "Sys-signUpPage.ftlh" class="text-blue-600 font-medium cursor-pointer">Create Account</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
          