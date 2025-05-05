<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Review Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body class="h-full text-base-content bg-gray-50">

<div id="mobile-app">

    <nav id="header" class="fixed top-0 w-full bg-white border-b border-gray-100 z-50">
        <div class="flex items-center justify-between px-4 h-14">
            <h1 class="text-lg font-semibold">Dashboard</h1>
            <button class="p-2">
                <i class="fa-solid fa-filter text-gray-600"></i>
            </button>
        </div>
    </nav>

    <main id="main-content" class="pt-16 pb-20 px-4 space-y-6">
        <p class="text-sm text-gray-500">Review Count: ${reviews?size}</p>
        <p class="text-sm text-gray-500">Username: ${member.memberUsername!''}</p>

        <#if reviews?? && reviews?size gt 0>
        <#list reviews as review>
        <div class="bg-white p-4 rounded-lg shadow-sm">
            <div class="flex items-start gap-3">
                <img class="w-10 h-10 rounded-full" src="/Photos/avatar.jpg" alt="User avatar">
                <div class="flex-1">
                    <div class="font-semibold">${review.ownerid!''}</div>

                    <div class="flex text-yellow-400 my-1">
                        <#list 1..5 as i>
                        <#if i <= review.rating>
                        <i class="fa-solid fa-star"></i>
                        <#else>
                        <i class="fa-regular fa-star"></i>
                    </#if>
                </#list>
            </div>

            <p class="text-sm text-gray-600">${review.reviewText!''}</p>

            <#if review.foundReport??>
            <div class="mt-2 p-2 bg-gray-50 rounded-lg text-sm">
                ${review.foundReport().petName!"Unknown Pet"} - ${review.foundReport().location!"Unknown Location"}
            </div>
            <#else>
            <div class="mt-2 p-2 bg-gray-50 rounded-lg text-sm text-gray-400 italic">
                No associated pet info
            </div>
        </#if>


        <#if review.replyText?? && review.replyText?trim != "">
        <div class="posted-reply mt-2 text-sm text-gray-700">
            <strong>Reply:</strong> ${review.replyText}
        </div>
    </#if>


    <button class="text-blue-600 text-sm mt-2 reply-toggle">Reply</button>
    <form action="/communitymember/reply/${review.reviewID}" method="post" class="reply-box mt-2 hidden">
        <textarea name="replyText" class="w-full border p-2 mt-2 rounded" placeholder="Write a reply..." required></textarea>
        <button type="submit" class="bg-blue-600 text-white mt-2 px-4 py-1 rounded">Post</button>
    </form>

</div>
</div>
</div>
</#list>
<#else>
<p class="text-center text-gray-500">You dont have any reviews yet.</p>
</#if>
</main>


<nav id="bottom-nav" class="fixed bottom-0 w-full bg-white border-t border-gray-100">
    <div class="flex justify-around items-center h-16">
        <a href="Statistics" class="text-gray-600">
            <i class="fa-solid fa-chart-line text-xl"></i>
        </a>
        <a href="/communitymember/Dashboard" class="text-gray-600">
            <i class="fa-solid fa-map-location-dot text-xl"></i>
        </a>
        <button class="text-blue-600">
            <i class="fa-solid fa-star text-xl"></i>
        </button>
    </div>
</nav>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.querySelectorAll(".reply-toggle").forEach(button => {
            button.addEventListener("click", () => {
                const box = button.nextElementSibling;
                box.classList.toggle("hidden");
            });
        });
    });
</script>

</body>
</html>

