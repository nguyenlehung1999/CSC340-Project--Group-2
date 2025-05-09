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
            <div class="flex items-center gap-2">
                <a href="/admin/allusers" class="p-1">
                    <i class="fa-solid fa-arrow-left text-gray-600"></i>
                </a>
                <h1 class="text-lg font-semibold">User Profile</h1>
            </div>
            <#if user.status?? && user.status>
            <a  class="text-red-600 text-sm font-medium">
                Ban User
            </a>
            <#else>
            <a class="text-green-600 text-sm font-medium">
                Unban User
            </a>
            </#if>

        </div>
    </nav>

    <main id="main-content" class="pt-14 pb-16">
        <section id="profile-header" class="bg-white p-4 border-b border-gray-100">
            <div class="flex items-center gap-4">
                <img class="w-20 h-20 rounded-full" src="${user.imgPath!'/images/avatar.jpg'}" alt="User avatar">
                <div>
                    <h2 class="text-xl font-semibold">${user.username}</h2>
                    <div class="flex items-center gap-2 mt-1">
                        <#if user.status?? && user.status>
                            <span class="bg-blue-100 text-blue-700 text-xs px-2 py-1 rounded-full">Active</span>
                        <#else>
                            <span class="bg-red-100 text-red-700 text-xs px-2 py-1 rounded-full">Banned</span>
                        </#if>
                    <#if role??>
                    <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">${role}</span>
                        </#if>
                    </div>

            </div>
</div>
</section>

<section id="user-stats" class="grid grid-cols-3 bg-white p-4 border-b border-gray-100">
    <div class="text-center">
        <p class="text-2xl font-semibold text-gray-800">${report!"0"}</p>
        <p class="text-xs text-gray-500">Posts</p>
    </div>
<!--    <div class="text-center border-x border-gray-100">-->
<!--        <p class="text-2xl font-semibold text-gray-800">${user.totalFound!"0"}</p>-->
<!--        <p class="text-xs text-gray-500">Found</p>-->
<!--    </div>-->
<!--    <div class="text-center">-->
<!--        <p class="text-2xl font-semibold text-gray-800">${user.rating!"0.0"}</p>-->
<!--        <p class="text-xs text-gray-500">Rating</p>-->
<!--    </div>-->
</section>

<section id="user-details" class="p-4 space-y-4">
    <div id="contact-info" class="bg-white p-4 rounded-lg">
        <h3 class="text-sm font-semibold text-gray-500 mb-3">Contact Information</h3>
        <div class="space-y-3">
            <div class="flex items-center gap-3">
                <i class="fa-regular fa-envelope text-gray-400 w-5"></i>
                <p class="text-sm">${user.email}</p>
            </div>
            <div class="flex items-center gap-3">
                <i class="fa-solid fa-phone text-gray-400 w-5"></i>
                <p class="text-sm">${user.phone!"Not Provided"}</p>
            </div>
            <div class="flex items-center gap-3">
                <i class="fa-solid fa-location-dot text-gray-400 w-5"></i>
                <p class="text-sm">${user.location!"Unknown"}</p>
            </div>
        </div>
    </div>

    <div id="account-info" class="bg-white p-4 rounded-lg">
        <h3 class="text-sm font-semibold text-gray-500 mb-3">Account Information</h3>
        <div class="space-y-3">
            <div class="flex justify-between items-center">
                <p class="text-sm text-gray-600">Account Status</p>
                <#if user.status?? && user.status>
                <p class="text-sm font-medium text-green-600">Active</p>
                <#else>
                <p class="text-sm font-medium text-red-600">Banned</p>
            </#if>
        </div>
        <div class="flex justify-between items-center">
            <p class="text-sm text-gray-600">Join Date</p>
            <p class="text-sm text-gray-800">${user.joinDate}</p>
        </div>
    </div>
    </div>

    <div id="admin-actions" class="bg-white p-4 rounded-lg">
        <h3 class="text-sm font-semibold text-gray-500 mb-3">Administrative Actions</h3>
        <div class="space-y-3">
            <#assign newStatus = (user.status == true)?then(false, true)>
            <#assign formAction = (role == "Owner")?then("/admin/updateowner/${user.ownerID}?status=${newStatus?c}", "/admin/updatemember/${user.memberID}?status=${newStatus?c}")>
            <form method="post" action="${formAction}">
                <button type="submit" class="block w-full text-center py-2 px-4
                ${user.status?then("bg-yellow-100 text-yellow-700", "bg-green-100 text-green-700")}
                rounded-lg text-sm font-medium transition">
                ${user.status?then("Ban User", "Unban User")}
                </button>
            </form>
            <a class="block w-full text-center py-2 px-4 bg-red-100 text-red-700 rounded-lg text-sm font-medium hover:bg-red-200 transition"
               onclick="document.getElementById('confirmDialog').showModal()">
                Delete User
            </a>
        </div>
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
        <a href="/admin/allusers" class="text-gray-600">
            <i class="fa-solid fa-users text-xl"></i>
        </a>
    </div>
</nav>
</div>

<dialog id="confirmDialog" class="p-6 bg-white rounded-md shadow-lg">
    <h2 class="text-lg font-bold mb-4">Confirm Ban</h2>
    <p class="text-gray-600 mb-6">Are you sure you want to remove this profile?</p>

    <div class="flex justify-end space-x-4">
        <button class="px-4 py-2 bg-gray-300 text-gray-800 rounded-md"
                onclick="document.getElementById('confirmDialog').close()">Cancel</button>
        <#if role == "Owner">
        <a href="/owners/delete/${user.ownerID}" class="px-4 py-2 bg-red-600 text-white rounded-md">Remove</a>
        <#else>
        <a href="/members/delete/${user.memberID}" class="px-4 py-2 bg-red-600 text-white rounded-md">Remove</a>
        </#if>
    </div>
</dialog>

</body>
</html>
