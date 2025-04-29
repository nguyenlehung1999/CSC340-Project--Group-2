<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous"></script>
    <style>
        * {
          font-family: "Inter", sans-serif;
        }
        ::-webkit-scrollbar {
          display: none;
        }
    </style>
</head>
<body class="h-full text-base-content">
<div id="register-pet-finder" class="bg-gray-50 min-h-screen p-4">
    <div id="header" class="flex justify-center mb-8 pt-6">
        <h1 class="text-3xl font-bold text-gray-800">L&F Pet</h1>
    </div>
    <div id="registration-form" class="bg-white rounded-xl p-8 md:px-16 shadow-sm mx-auto max-w-6xl">

        <h2 class="text-2xl font-semibold text-gray-800 mb-8 text-center">Create Account</h2>

        <form id="signupform" action="/owners/new" method="post" enctype="multipart/form-data" class="space-y-6">
            <!-- Profile Picture Upload Section -->
            <div class="mb-4 flex flex-col items-center">
                <label for="imgpath" class="block text-base text-gray-700 mb-3 font-medium">Profile Picture</label>
                <div class="flex flex-col items-center space-y-4">
                    <!-- Image Preview -->
                    <div id="imagePreview" class="w-32 h-32 rounded-full bg-gray-100 border-2 border-gray-200 flex items-center justify-center overflow-hidden">
                        <span id="placeholderIcon" class="text-gray-400">
                            <i class="fa-solid fa-user fa-2xl"></i>
                        </span>
                        <img id="previewImage" class="hidden w-full h-full object-cover" alt="Profile preview" />
                    </div>

                    <!-- Upload button -->
                        <i class="fa-solid fa-camera mr-2 text-blue-500"></i>
                        <span>Upload photo</span>
                    </label>
                    <input type="file" id="" name="imgpath" accept="image/*" class="hidden" />
                    <p id="fileName" class="text-sm text-gray-500 truncate max-w-full text-center"></p>
                </div>

                <!-- Textbox for imgpath -->
                <label for="imgPATH" class="block text-sm text-gray-600 mb-2">Enter Image Path</label>
                <input type="text" id="imgPATH" name="imgPATH" placeholder="Enter image file path or name"
                       class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none" />
            </div>

            <!-- Two-column layout for form fields on desktop -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="fullname" class="block text-sm text-gray-600 mb-2">Full Name</label>
                    <input type="text" id="fullname" name="fullname" required
                           class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none"
                           placeholder="Enter your full name">
                </div>
                <div>
                    <label for="username" class="block text-sm text-gray-600 mb-2">User Name</label>
                    <input type="text" id="username" name="username" required
                           class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none"
                           placeholder="Enter your user name">
                </div>
                <div>
                    <label for="email" class="block text-sm text-gray-600 mb-2">Email</label>
                    <input type="email" id="email" name="email" required
                           class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none"
                           placeholder="Enter your email">
                </div>
                <div>
                    <label for="password" class="block text-sm text-gray-600 mb-2">Password</label>
                    <input type="password" id="password" name="password" required minlength="8"
                           class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none"
                           placeholder="Min. 8 characters">
                </div>
            </div>

            <div class="pt-4">
                <button type="submit"
                        class="w-full bg-blue-600 text-white py-4 rounded-lg font-medium hover:bg-blue-700 transition-colors text-lg">
                    Create Account
                </button>
            </div>
        </form>

        <div class="mt-8 text-center">
            <p class="text-base text-gray-500">
                Already have an account?
                <a href="/owners/LoginPage" class="text-blue-600 font-medium cursor-pointer">Sign In</a>

            </p>
        </div>
    </div>
</div>

<script>
    // Handling file input change to show the selected file name
    document.getElementById('imgpath').addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
            document.getElementById('fileName').textContent = file.name;
            document.getElementById('imgPathInput').value = file.name; // Auto fill the textbox with file name
        }
    });
</script>

</body>
</html>
