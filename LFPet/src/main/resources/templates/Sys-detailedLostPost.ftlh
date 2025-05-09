
<html class="">

<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="styles.css">
</head>

<body class="h-full text-base-content">
<div id="mobile-app" class="bg-gray-50">
    <nav id="header" class="fixed top-0 w-full bg-white border-b border-gray-100 z-50">
        <div class="flex items-center px-4 h-14">
            <a href="Sysadmin-dashboard.ftlh" class="mr-2">
                <i  class="fa-solid fa-arrow-left text-gray-600"></i>
            </a>
            <h1 class="text-lg font-semibold">Pet Details</h1>
        </div>
    </nav>
    <main id="main-content" class="pt-14 pb-16">
        <section id="pet-images" class="relative h-[300px]">
            <img class="w-full h-full object-cover" src="CatImg/1.jpg" alt="lost golden retriever dog portrait, high quality photography">
            <div class="absolute bottom-4 right-4 flex gap-2">
                <span class="px-3 py-1 bg-red-500 text-white rounded-full text-sm">Lost</span>
            </div>
        </section>
        <section id="pet-info" class="px-4 py-6">
            <div id="basic-info" class="mb-6">
                <h2 class="text-xl font-semibold mb-2">Abyssinian Cat</h2>
                <div class="flex items-center gap-4 text-sm text-gray-500">
                    <span><i class="fa-regular fa-clock mr-1"></i> Lost 2 hours ago</span>
                    <span><i class="fa-solid fa-location-dot mr-1"></i> Central Park Area</span>
                </div>
            </div>
            <div id="detailed-info" class="bg-white rounded-lg p-4 mb-6">
                <h3 class="font-semibold mb-3">Pet Information</h3>
                <div class="space-y-3 text-sm">
                    <div class="flex justify-between">
                        <span class="text-gray-500">Name</span>
                        <span>Hachimaru</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-500">Gender</span>
                        <span>Male</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-500">Age</span>
                        <span>8 years</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-500">Color</span>
                        <span>Orange</span>
                    </div>
                </div>
            </div>
            <div id="description" class="bg-white rounded-lg p-4 mb-6">
                <h3 class="font-semibold mb-3">Description</h3>
                <p class="text-sm text-gray-600">A chonky boi</p>
            </div>
            <div id="poster-info" class="bg-white rounded-lg p-4">
                <h3 class="font-semibold mb-3">Posted by</h3>
                <div class="flex items-center gap-3">
                    <img src="CatImg/avatar.jpg" alt="Profile" class="w-12 h-12 rounded-full">
                    <div>
                        <p class="font-semibold">Agent Smith</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <div id="contact-button" class="fixed bottom-0 w-full p-4 bg-white border-t border-gray-100">
        <button class="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold">
            Contact Owner
        </button>
    </div>
</div>
</body>
</html>
          