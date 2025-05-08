<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sign In - L&F Pet</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body class="h-full text-base-content">

<div id="login-pet-finder" class="bg-gray-50 min-h-screen p-4">
    <div id="header" class="flex justify-center mb-8 pt-6">
        <h1 class="text-2xl font-bold text-neutral-800">L&F Pet - Sign In</h1>
    </div>
    <div id="login-form" class="bg-white rounded-xl p-6 shadow-sm mx-auto max-w-sm">
        <h2 class="text-xl font-semibold text-gray-800 mb-6">Sign In</h2>

        <form class="space-y-4" method="post" action="/process-login">
            <div>
                <label class="block text-sm text-gray-600 mb-1">Username</label>
                <input name="username" type="text" required
                       class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none"
                       placeholder="Enter your username">
            </div>
            <div>
                <label class="block text-sm text-gray-600 mb-1">Password</label>
                <input name="password" type="password" required
                       class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:border-blue-600 focus:ring-1 focus:ring-blue-600 outline-none"
                       placeholder="Enter your password">
            </div>
            <div class="pt-2">
                <button type="submit"
                        class="block w-full bg-blue-600 text-white py-3 rounded-lg font-medium hover:bg-blue-700 transition-colors text-center">
                    Sign In
                </button>
            </div>
        </form>

        <#if Session.SPRING_SECURITY_CONTEXT??>
        <div class="mt-6 text-center text-sm text-gray-500">
            You are already signed in as <b>${Session.SPRING_SECURITY_CONTEXT.authentication.name}</b>
            <br>
            <a href="/logout" class="text-blue-600 hover:underline">Sign out</a>
        </div>
    </#if>

    <div class="mt-6 text-center">
        <p class="text-sm text-gray-500">
            Don't have an account?
            <a href="/register" class="text-blue-600 font-medium hover:underline">Create Account</a>
        </p>
    </div>
</div>
</div>
</body>
</html>
