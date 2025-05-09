<!DOCTYPE html>
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
            <h1 class="text-lg font-semibold">L&F Pet - Users</h1>
            <div class="flex items-center gap-2">
                <a href="/admin/statistics" class="p-2">
                    <i class="fa-solid fa-chart-simple text-gray-600"></i>
                </a>
            </div>
        </div>
    </nav>

    <main id="main-content" class="pt-14 pb-16">
        <section class="px-4 py-4">
            <h2 class="text-lg font-semibold mb-4">All Users</h2>
            <div class="space-y-4">
                <#list userDTOs as user>
                <div class="bg-white p-4 rounded-lg shadow-sm">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-base font-semibold">
                                <#if user.role == "owner">
                                <a href="/owners/${user.id}">${user.username}</a>
                                <#elseif user.role == "member">
                                <a href="/members/${user.id}">${user.username}</a>
                                <#else>
                                ${user.username}
                                </#if>
                            </h3>
                            <p class="text-sm text-gray-500">${user.email}</p>
                            <p class="text-sm text-gray-500">Joined: ${user.joindate!''}</p>
                        </div>
                        <div class="text-end">
                            <#if user.status?? && user.status>
                            <span class="text-sm px-3 py-1 rounded-full bg-green-100 text-green-600">Active</span>
                            <#else>
                            <span class="text-sm px-3 py-1 rounded-full bg-red-100 text-red-600">Banned</span>
                            </#if>
                        <div class="text-sm text-gray-600 mt-1">
                            Role: ${user.role!""}
                        </div>
                        </div>
                    </div>
                </div>
                </#list>
            </div>
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
        <a href="/admin/reviews/all" class="text-gray-600">
            <i class="fa-regular fa-star text-xl"></i>
        </a>
        <a href="/admin/allusers" class="text-blue-600">
            <i class="fa-solid fa-users text-xl"></i>
        </a>
    </div>
</nav>
</div>
</body>
</html>
