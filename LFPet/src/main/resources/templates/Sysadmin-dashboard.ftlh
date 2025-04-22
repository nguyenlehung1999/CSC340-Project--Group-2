
<html class="">

<head>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="/css/styles.css">
</head>

<body class="h-full text-base-content">
<div id="mobile-app" class="bg-gray-50">
  <nav id="header" class="fixed top-0 w-full bg-white border-b border-gray-100 z-50">
    <div class="flex items-center justify-between px-4 h-14">
      <h1 class="text-lg font-semibold">L&F Pet</h1>
      <div class="flex items-center gap-2">
        <a href="sysStat.ftlh" class="p-2">
          <i class="fa-solid fa-chart-simple text-gray-600"></i>
        </a>
      </div>
    </div>
  </nav>
  <main id="main-content" class="pt-14 pb-16">
    <section id="pets-list" class="px-4 py-4">
      <div class="flex items-center justify-between mb-4">
        <h2 class="text-lg font-semibold">Nearby Pets</h2>
        <div class="flex gap-2">
          <span class="px-3 py-1 bg-blue-100 text-blue-600 rounded-full text-sm">Lost</span>
          <span class="px-3 py-1 bg-green-100 text-green-600 rounded-full text-sm">Found</span>
        </div>
      </div>

      <div class="space-y-4">
        <#list petReports as report>
        <div class="space-y-4">
          <div class="bg-white p-4 rounded-lg shadow-sm">
            <div class="flex gap-4">
              <a href = "/freports/${report.foundReportID}">
                <#if report.pet.imgPath??>
                <img class="w-20 h-20 rounded-lg object-cover" src="${report.pet.imgPath!''}" alt= ${report.pet.name!''}>
                <#else>
                <img src="/images/default.jpg" class="w-20 h-20 rounded-lg object-cover" alt= ${report.pet.name!''}>
                </#if>
              </a>
              <div class="flex-1">
                <div class="flex items-center justify-between">
                  <a href= "/freports/${report.foundReportID}" class="font-semibold">
                    <#if report.pet??>
                    ${report.pet.breed!"Unknown"}/${report.pet.species}
                    <#else>
                    Unknown
                    </#if>
                  </a>
                    <#if report.type?? && report.type>
                    <span class="text-red-500">Lost</span>
                    <#else>
                    <span class="text-green-500">Found</span>
                    </#if>
                </div>
                <p class="text-sm text-gray-500 mt-1">${report.foundDate!''}</p>
                <p class="text-sm text-gray-500">${report.foundLocation!''}</p>
              </div>
            </div>
          </div>
        </#list>
        </div>
    </section>
  </main>
  <nav id="bottom-nav" class="fixed bottom-0 w-full bg-white border-t border-gray-100">
    <div class="flex justify-around items-center h-16">
      <a href="sysStat.ftlh" class="text-gray-600">
        <i class="fa-solid fa-chart-line text-xl"></i>
      </a>
      <a href="Sysadmin-dashboard.ftlh" class="text-blue-600">
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
          