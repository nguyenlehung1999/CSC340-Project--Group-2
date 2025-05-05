<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="styles.css">

    <style>

        #header-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: white;
            z-index: 1000;
            border-bottom: 1px solid #ddd;
        }


        #header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
        }

        #header h1 {
            font-size: 20px;
            font-weight: bold;
        }


        #header .icon {
            font-size: 20px;
            color: gray;
            cursor: pointer;
        }


        #custom-nav {
            background-color: #333;
            padding: 10px 0;
            text-align: center;
            width: 100%;
        }

        #custom-nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        #custom-nav li {
            margin: 0 15px;
        }

        #custom-nav a {
            text-decoration: none;
            color: white;
            background-color: #444;
            padding: 12px 20px;
            display: inline-block;
            border-radius: 8px;
            font-size: 18px;
            transition: 0.3s;
            border: 2px solid transparent;
        }

        #custom-nav a:hover {
            background-color: #575757;
            border-color: white;
        }


        body {
            padding-top: 110px;
        }


        #bottom-nav {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: white;
            border-top: 1px solid #ddd;
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 60px;
            z-index: 1000;
        }

        #bottom-nav button {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: gray;
        }

        #bottom-nav button.active {
            color: blue;
        }


        #bottom-nav .add-button {
            background-color: blue;
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-top: -20px;
        }
    </style>
</head>
<body>


<div id="header-container">

    <nav id="header">
        <h1>L&F Pet</h1>
        <i class="fa-regular fa-bell icon"></i>
    </nav>


    <nav id="custom-nav">
        <ul>
            <li><a href="Statistics">Statistics</a></li>
            <li><a href="Reviews">Reviews</a></li>

        </ul>
    </nav>
</div>


<div id="mobile-app" class="bg-gray-50">
    <main id="main-content" class="pt-10 pb-16">
        <section id="map-section" class="relative h-[300px]">
            <img class="w-full h-full object-cover" src="\Photos\map.png" alt="location for interactive map">
            <div class="absolute bottom-4 right-4">
                <button class="bg-white p-3 rounded-full shadow-lg">
                    <i class="fa-solid fa-location-crosshairs text-blue-600"></i>
                </button>
            </div>
        </section>


        <section id="pets-list" class="px-4 py-4">
            <div class="flex items-center justify-between mb-4">
                <h2 class="text-lg font-semibold">Nearby Pets</h2>
                <div class="flex gap-2">
                    <span class="px-3 py-1 bg-blue-100 text-blue-600 rounded-full text-sm">Lost</span>
                    <span class="px-3 py-1 bg-green-100 text-green-600 rounded-full text-sm">Found</span>
                </div>
            </div>
            <div class="space-y-4">
                <div class="bg-white p-4 rounded-lg shadow-sm">
                    <div class="flex gap-4">
                        <img class="w-20 h-20 rounded-lg object-cover" src="\Photos\1.jpg" alt="animal 1">
                        <div class="flex-1">
                            <div class="flex items-center justify-between">
                                <h3 class="font-semibold">Abyssinian</h3>
                                <span class="text-red-500 text-sm">Lost</span>
                            </div>
                            <p class="text-sm text-gray-500 mt-1">Last seen: 2 hours ago</p>
                            <p class="text-sm text-gray-500">Central Park Area</p>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-sm">
                    <div class="flex gap-4">
                        <img class="w-20 h-20 rounded-lg object-cover" src="\Photos\2.jpg" alt="animal 2">
                        <div class="flex-1">
                            <div class="flex items-center justify-between">
                                <h3 class="font-semibold">Tabby Cat</h3>
                                <span class="text-green-500 text-sm">Found</span>
                            </div>
                            <p class="text-sm text-gray-500 mt-1">Found: 1 hour ago</p>
                            <p class="text-sm text-gray-500">Downtown Street</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>


<nav id="bottom-nav" style="position: fixed; bottom: 0; width: 100%; display: flex; justify-content: space-around; background-color: #fff; padding: 10px 0; box-shadow: 0 -2px 5px rgba(0,0,0,0.1);">
    <button class="active" style="background: none; border: none;">
        <i class="fa-solid fa-map-location-dot fa-xl"></i>
    </button>

    <a href="FoundPet" class="text-gray-600" style="background: none; border: none; text-decoration: none; color: inherit;">
        <i class="fa-solid fa-plus"></i>
    </a>

    <a href="Profile" class="text-gray-600" style="background: none; border: none; text-decoration: none; color: inherit;">
        <i class="fa-regular fa-user fa-xl"></i>
    </a>
</nav>


</body>
</html>
