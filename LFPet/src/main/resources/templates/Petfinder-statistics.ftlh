<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Customer Review Statistics</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body class="h-full text-base-content bg-neutral-50">
<div id="mobile-app" class="min-h-screen flex flex-col">

    <nav id="header" class="fixed top-0 w-full bg-white border-b border-neutral-100 z-50">
        <div class="flex items-center justify-between px-4 h-14">
            <h1 class="text-xl font-semibold text-gray-800">Customer Review Statistics</h1>
        </div>
    </nav>

    <main id="main-content" class="pt-16 pb-20 px-4 flex flex-col min-h-[calc(100vh-4rem)]">
        <div class="bg-white rounded-lg shadow-lg p-8 w-full flex-grow flex flex-col justify-between min-h-full h-full">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Customer reviews</h2>

            <#if totalRatings?number gt 0>
            <div class="flex items-center gap-4 mb-6 justify-between">
                <div class="text-gray-800 text-3xl font-semibold">
                    ${avgRating?string("0.0")} out of 5
                </div>
                <div class="flex items-center text-yellow-400 text-3xl">
                    <#list 1..5 as i>
                    <#if i <= avgRating?round>
                    <i class="fa-solid fa-star"></i>
                    <#else>
                    <i class="fa-regular fa-star"></i>
                </#if>
            </#list>
        </div>
</div>

<p class="text-xs text-gray-500 mb-4">${totalRatings!"0"} customer ratings</p>

<div class="space-y-2 text-sm">
    <#list [5, 4, 3, 2, 1] as star>
    <div class="flex items-center justify-between">
        <span class="text-blue-600 underline cursor-pointer">${star} star</span>
        <div class="w-2/3 bg-gray-200 rounded-full h-2 mx-2">
            <div class="bg-yellow-400 h-2 rounded-full"
                 style="width: ${ratingPercent[star?string]?string("0.0")}%;"></div>
    </div>
    <span>${ratingPercent[star?string]?string("0")}%</span>
</div>
</#list>
</div>
<#else>
<div class="text-gray-800 text-3xl font-semibold mb-4">
    No ratings yet
</div>
</#if>

<div class="mt-6 bg-blue-50 border border-blue-200 rounded-lg p-4 flex items-center gap-4">
    <i class="fa-solid fa-paw text-blue-500 text-2xl"></i>
    <div>
        <p class="text-sm text-blue-800 font-medium">
            ${member.memberUsername!"You"} has helped find
        </p>
        <p class="text-lg text-blue-900 font-semibold">
            ${petsHelped!"0"} pets
        </p>
    </div>
</div>
</div>
</main>

<nav id="bottom-nav" class="fixed bottom-0 w-full bg-white border-t border-gray-100">
    <div class="flex justify-around items-center h-16">
        <a href="/communitymember/Statistics" class="text-blue-600">
            <i class="fa-solid fa-chart-line text-xl"></i>
        </a>
        <a href="/communitymember/Dashboard" class="text-gray-600">
            <i class="fa-solid fa-map-location-dot text-xl"></i>
        </a>
        <a href="/communitymember/Reviews" class="text-gray-600">
            <i class="fa-regular fa-star text-xl"></i>
        </a>
    </div>
</nav>
</div>
</body>
</html>

