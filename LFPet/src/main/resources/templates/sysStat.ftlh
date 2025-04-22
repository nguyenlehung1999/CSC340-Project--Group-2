
<html class="">

<head>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="styles.css">
</head>

<body class="h-full text-base-content">
<div id="mobile-app" class="bg-neutral-50 min-h-screen">
  <nav id="header" class="fixed top-0 w-full bg-white border-b border-neutral-100 z-50">
    <div class="flex items-center justify-between px-4 h-14">
      <h1 class="text-xl font-semibold text-gray-800">System Statistics</h1>
    </div>
  </nav>
  <main id="main-content" class="pt-14 pb-16">
    <section id="overview-cards" class="p-4 grid grid-cols-2 gap-4">
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-users text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">2,547</span>
          <span class="text-sm text-neutral-500">Total Accounts</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-user text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">1,892</span>
          <span class="text-sm text-neutral-500">User Accounts</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-store text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">655</span>
          <span class="text-sm text-neutral-500">Provider Accounts</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-handshake text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">423</span>
          <span class="text-sm text-neutral-500">Reunions</span>
        </div>
      </div>
    </section>
    <section id="graph-section" class="px-4 py-2">
      <div class="bg-white p-4 rounded-lg shadow-sm mb-4">
        <h2 class="text-lg mb-4">Account Growth</h2>
        <div class="h-[200px] bg-neutral-100 rounded-lg flex items-center justify-center">
          <span class="text-neutral-500">Graph Placeholder</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <h2 class="text-lg mb-4">Monthly Reunions</h2>
        <div class="h-[200px] bg-neutral-100 rounded-lg flex items-center justify-center">
          <span class="text-neutral-500">Graph Placeholder</span>
        </div>
      </div>
    </section>
  </main>
  <nav id="bottom-nav" class="fixed bottom-0 w-full bg-white border-t border-gray-100">
    <div class="flex justify-around items-center h-16">
      <button class="text-blue-600">
        <i class="fa-solid fa-chart-line text-xl"></i>
      </button>
      <a href="Sysadmin-dashboard.ftlh" class="text-gray-600">
        <i class="fa-solid fa-map-location-dot text-xl"></i>
      </a>
      <a href="Sys-review.ftlh" class="text-gray-600">
        <i class="fa-regular fa-star text-xl"></i>
      </a>
    </div>
  </nav>
</div>
</body>
</html>
          