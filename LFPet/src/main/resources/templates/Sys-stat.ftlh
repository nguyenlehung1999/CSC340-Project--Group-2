
<html class="">

<head>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="/css/styles.css">
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
          <span class="text-2xl">${totalUsers!0}</span>
          <span class="text-sm text-neutral-500">Total Accounts</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-user text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">${activeMembers!0}</span>
          <span class="text-sm text-neutral-500">Active Members</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-store text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">${activeOwners!0}</span>
          <span class="text-sm text-neutral-500">Active Owners</span>
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg shadow-sm">
        <div class="flex flex-col items-center">
          <i class="fa-solid fa-handshake text-neutral-600 text-2xl mb-2"></i>
          <span class="text-2xl">${successfulReunions!0}</span>
          <span class="text-sm text-neutral-500">Reunions</span>
        </div>
      </div>
    </section>

    <section id="graph-section" class="px-4 py-2">
      <div class="bg-white p-4 rounded-lg shadow-sm mb-4">
        <h2 class="text-lg mb-4 font-semibold">Pet Report Breakdown</h2>

        <#-- Assign model attributes safely -->
        <#assign found = totalFoundPets!0>
        <#assign lost = totalLostPets!0>
        <#assign total = found + lost>

        <#if total != 0>
        <#assign foundPercent = (found * 100 / total)?round>
        <#assign lostPercent = 100 - foundPercent>
        <#else>
        <#assign foundPercent = 0>
        <#assign lostPercent = 0>
      </#if>

      <div class="flex flex-col items-center">
        <div class="relative w-32 h-32 rounded-full bg-[conic-gradient(#10b981_0%_${foundPercent}%,#ef4444_${foundPercent}%_100%)]">
          <div class="absolute inset-2 bg-white rounded-full"></div>
        </div>

        <div class="mt-4 text-sm text-center space-y-1">
          <p>
            <span class="inline-block w-3 h-3 bg-[#10b981] rounded-full mr-2"></span>
            Found Pets (${foundPercent}%)
          </p>
          <p>
            <span class="inline-block w-3 h-3 bg-[#ef4444] rounded-full mr-2"></span>
            Lost Pets (${lostPercent}%)
          </p>
        </div>
      </div>
</div>
</section>

<section id="bar-section" class="px-4 py-2">
  <div class="bg-white p-4 rounded-lg shadow-sm mb-4">
  <h2 class="text-lg font-semibold mb-4">User Account Status</h2>

  <div class="mb-4">
    <p class="text-sm mb-1">Owners</p>
    <div class="w-full bg-gray-200 rounded-full h-4 flex overflow-hidden">
      <div class="bg-blue-500 h-4" style="width: ${(activeOwners * 100) / (activeOwners + bannedOwners)}%"></div>
      <div class="bg-red-500 h-4" style="width: ${(bannedOwners * 100) / (activeOwners + bannedOwners)}%"></div>
    </div>
    <div class="flex justify-between text-xs text-gray-600 mt-1">
      <span>Active: ${activeOwners}</span>
      <span>Banned: ${bannedOwners}</span>
    </div>
  </div>

  <div>
    <p class="text-sm mb-1">Members</p>
    <div class="w-full bg-gray-200 rounded-full h-4 flex overflow-hidden">
      <div class="bg-green-500 h-4" style="width: ${(activeMembers * 100) / (activeMembers + bannedMembers)}%"></div>
      <div class="bg-red-500 h-4" style="width: ${(bannedMembers * 100) / (activeMembers + bannedMembers)}%"></div>
    </div>
    <div class="flex justify-between text-xs text-gray-600 mt-1">
      <span>Active: ${activeMembers}</span>
      <span>Banned: ${bannedMembers}</span>
    </div>
  </div>
  </div>
</section>
  </main>
  <nav id="bottom-nav" class="fixed bottom-0 w-full bg-white border-t border-gray-100">
    <div class="flex justify-around items-center h-16">
      <a href="/admin/statistics" class="text-blue-600">
        <i class="fa-solid fa-chart-line text-xl"></i>
      </a>
      <a href="/admin/dashboard" class="text-gray-600">
        <i class="fa-solid fa-map-location-dot text-xl"></i>
      </a>
      <a href="/admin/reviews/all" class="text-gray-600">
        <i class="fa-regular fa-star text-xl"></i>
      </a>
      <a href="/admin/allusers" class="text-gray-600">
        <i class="fa-solid fa-users text-xl"></i>
      </a>
    </div>
  </nav>
</div>
</body>
</html>
          