<!DOCTYPE html>
<html class="">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="styles.css">
</head>

<body class="h-full text-base-content">
<div id="mobile-app" class="bg-gray-50">
    <nav id="header" class="fixed top-0 w-full bg-white border-b border-gray-100 z-50">
        <div class="flex items-center px-4 h-14">
            <a href="/communitymember/Dashboard" class="mr-2">
                <i class="fa-solid fa-arrow-left text-gray-600"></i>
            </a>
            <h1 class="text-lg font-semibold">Report Found Pet</h1>
        </div>
    </nav>

    <main id="main-content" class="pt-14 pb-16 px-4">
        <form method="post" action="/communitymember/FoundPet">
            <section id="pet-info" class="bg-white rounded-lg p-4 mb-6 shadow">
                <h2 class="text-xl font-semibold mb-4">Basic Information</h2>

                <div class="mb-4">
                    <label class="block text-sm font-medium mb-1">Pet Name</label>
                    <input name="name" value="${pet.name!''}" type="text" class="w-full border p-2 rounded" required>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium mb-1">Species</label>
                    <input name="species" value="${pet.species!''}" type="text" class="w-full border p-2 rounded" required>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium mb-1">Breed</label>
                    <input name="breed" value="${pet.breed!''}" type="text" class="w-full border p-2 rounded" required>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium mb-1">Color</label>
                    <input name="color" value="${pet.color!''}" type="text" class="w-full border p-2 rounded">
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium mb-1">Collar</label>
                    <select name="hasCollar" class="w-full border p-2 rounded">
                        <option value="true" <#if pet.hasCollar?? && pet.hasCollar?c == "true">selected</#if>>Yes</option>
                    <option value="false" <#if pet.hasCollar?? && pet.hasCollar?c == "false">selected</#if>>No</option>
                </select>
</div>
</section>

<section id="location-info" class="bg-white rounded-lg p-4 mb-6 shadow">
    <h2 class="text-xl font-semibold mb-4">Found Location</h2>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Location Description</label>
        <input name="foundLocation" value="${pet.foundLocation!''}" type="text" class="w-full border p-2 rounded">
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Found Time</label>
        <input name="foundTime" value="${pet.foundTime!''}" type="text" class="w-full border p-2 rounded" placeholder="e.g. 2 hours ago or April 29, 3PM">
    </div>
</section>

<section id="description" class="bg-white rounded-lg p-4 mb-6 shadow">
    <h2 class="text-xl font-semibold mb-4">Description</h2>

    <textarea name="description" class="w-full border p-2 rounded h-24" placeholder="Describe the pet">${pet.description!''}</textarea>
</section>

<section id="image-upload" class="bg-white rounded-lg p-4 mb-6 shadow">
    <h2 class="text-xl font-semibold mb-4">Pet Image</h2>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Image Path (e.g., CatImg/pet1.jpg)</label>
        <input name="imgPath" value="${pet.imgPath!''}" type="text" class="w-full border p-2 rounded">
    </div>
</section>

<div class="fixed bottom-0 w-full p-4 bg-white border-t border-gray-100">
    <button type="submit" class="w-full bg-green-600 text-white py-3 rounded-lg font-semibold">
        Submit Found Pet
    </button>
</div>
</form>
</main>
</div>
</body>
</html>
