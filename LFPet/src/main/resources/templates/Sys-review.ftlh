
<html class="">

<head>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="/css/styles.css">
</head>

<body class="h-full text-base-content">
<div id="mobile-app" class="bg-gray-50">
  <nav id="header" class="fixed top-0 w-full bg-white border-b border-gray-100 z-50">
    <div class="flex items-center justify-between px-4 h-14">
      <h1 class="text-lg font-semibold">L&F Pet - Reviews</h1>
    </div>
  </nav>

  <main id="main-content" class="pt-14 pb-16">
    <section id="stats-section" class="p-4 bg-white border-b border-gray-100">
      <div class="grid grid-cols-2 gap-4 text-center">
        <div>
          <p class="text-2xl font-semibold text-blue-600">${countReview!0}</p>
          <p class="text-xs text-gray-500">Total Reviews</p>
        </div>
        <div>
          <p class="text-2xl font-semibold text-yellow-600">${averageRating!0.0}</p>
          <p class="text-xs text-gray-500">Avg Rating</p>
        </div>
      </div>
    </section>


    <section id="reviews-list" class="px-4 py-4">
      <#list review as r>
      <div class="space-y-4">
        <div class="bg-white p-4 rounded-lg shadow-sm">
          <div class="flex items-start gap-3">
            <img class="w-10 h-10 rounded-full" src="${r.owner.imgPath!'/images/avatar.jpg'}" alt="User avatar">
            <div class="flex-1">
              <div class="flex items-center justify-between">
                <a href="/owner/${r.owner.ownerID}" class="font-semibold">${r.owner.username!''}</a>
                  <a href="/admin/reviews/delete/${r.reviewID}" class="text-red-600 text-sm font-medium">remove</a>
              </div>
              <p class="text-sm text-gray-600">Rating: ${r.rating?string("0.0")}</p>
              <div class="flex text-yellow-400 my-1">
                <#assign roundedRating = r.rating?round>
                <#list 1..5 as i>
                  <#if i <= roundedRating>
                    <i class="fa-solid fa-star"></i>
                  <#else>
                    <i class="fa-regular fa-star"></i>
                  </#if>
                </#list>
              </div>

          <p class="text-sm text-gray-600">${r.reviewText!''}</p>

          <div class="mt-2 p-2 bg-gray-50 rounded-lg">
            <p class="text-sm">Report ID #: ${r.foundReport.foundReportID!''}</p>
          </div>

          <p class="text-xs text-gray-400 mt-1">Posted: ${r.timeStamp!''}</p>
        </div>
      </div>
</div>
</div>
</#list>
    </section>
  </main>

  <nav id="bottom-nav" class="fixed bottom-0 w-full bg-white border-t border-gray-100">
    <div class="flex justify-around items-center h-16">
      <a href="/admin/statistics" class="text-gray-600">
        <i class="fa-solid fa-chart-line text-xl"></i>
      </a>
      <a href="/admin/dashboard" class="text-gray-600">
        <i class="fa-solid fa-map-location-dot text-xl"></i>
      </a>
      <a href="/admin/reviews/all" class="text-blue-600">
        <i class="fa-solid fa-star text-xl"></i>
      </a>
      <a href="/admin/allusers" class="text-gray-600">
        <i class="fa-solid fa-users text-xl"></i>
      </a>
    </div>
  </nav>
</div>

</body>
</html>
          