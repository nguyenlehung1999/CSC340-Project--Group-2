<html class="">

<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="styles.css">
</head>










<body class="h-full text-base-content">
<div id="register-pet-finder" class="bg-gray-50 min-h-screen p-4">
    <div id="header" class="flex justify-center mb-8 pt-6">
        <h1 class="text-2xl font-bold text-gray-800">L&F Pet</h1>
    </div>
    <div id="registration-form" class="bg-white rounded-xl p-6 shadow-sm mx-auto max-w-sm">
        <h2 class="text-xl font-semibold text-gray-800 mb-6">Create Account</h2>
        <form id="signup-form" action="/communitymember/new" method="post" enctype="multipart/form-data">
            <input type="text" id="email" name="email" value="${member.email!''}" placeholder="Email"/>
            <input type="text" id="username" name="memberUsername" value="${member.memberUsername!''}" placeholder="Username"/>
            <input type="text" id="password" name="memberPassword" value="${member.memberPassword!''}" placeholder="Password"/>


            <p>Profile Picture</p> <input type="file" id="imgPATH" name="imgFile" accept="/Photos/avatar1.jpg" placeholder="Profile Picture"/>

            <div class="pt-2">
                <button class="w-full bg-blue-600 text-white py-3 rounded-lg font-medium hover:bg-blue-700 transition-colors">
                    Create Account
                </button>
            </div>
        </form>



        <div class="mt-6 text-center">
            <p class="text-sm text-gray-500">
                Already have an account?
                <a href="LoginPage" class="text-blue-600 font-medium cursor-pointer">Sign In</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>