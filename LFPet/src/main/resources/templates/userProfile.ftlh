<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <!-- Include Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', 'Proxima Nova', Arial, sans-serif;
        }

        body {
            background-color: #f9fafb;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 40px;
        }

        .back-arrow {
            position: fixed;
            top: 20px;
            left: 20px;
            font-size: 24px;
            color: #333;
            text-decoration: none;
            z-index: 10;
        }

        .profile-card {
            width: 100%;
            max-width: 700px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            padding: 40px;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .title {
            font-size: 36px;
            font-weight: 900;
            color: #000001;
        }

        .options-menu {
            cursor: pointer;
        }

        .subtitle {
            font-size: 28px;
            font-weight: 500;
            color: #1d1d1f;
            margin-bottom: 30px;
        }

        .profile-info {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-details {
            flex: 1;
            padding-left: 20px;
        }

        .profile-age {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        .section-header {
            display: flex;
            flex-direction: column;
            margin-bottom: 8px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: black;
            margin-bottom: 5px;
        }

        .section-underline {
            width: 80px;
            height: 2px;
            background: #1D6CE3;
            box-shadow: 0px 2px 8px rgba(29, 108, 227, 0.40);
        }

        .divider {
            width: 100%;
            height: 1px;
            background: #ddd;
            margin: 30px 0;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-size: 18px;
            color: black;
            margin-bottom: 10px;
        }

        .form-input,
        input[type="text"] {
            width: 100%;
            padding: 14px 16px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: white;
        }

        .form-textarea {
            width: 100%;
            height: 120px;
            padding: 14px 16px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            resize: none;
            line-height: 1.5;
        }

        .buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }

        input[type="submit"],
        button {
            background-color: #1D6CE3;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        button.cancel {
            background-color: #888;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #155bc3;
        }

        img.profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 2px solid #1D6CE3;
            object-fit: cover;
        }
    </style>
</head>
<body>
<!-- Back Arrow -->
<a href="/owners/dashboard" class="back-arrow">
    <i class="fa-solid fa-arrow-left"></i>
</a>

<!-- Profile Card -->
<div class="profile-card">
    <div class="card-header">
        <h1 class="title">Account</h1>
        <div class="options-menu">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z"
                      stroke="#77787B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M19 13C19.5523 13 20 12.5523 20 12C20 11.4477 19.5523 11 19 11C18.4477 11 18 11.4477 18 12C18 12.5523 18.4477 13 19 13Z"
                      stroke="#77787B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M5 13C5.55228 13 6 12.5523 6 12C6 11.4477 5.55228 11 5 11C4.44772 11 4 11.4477 4 12C4 12.5523 4.44772 13 5 13Z"
                      stroke="#77787B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
    </div>

    <h2 class="subtitle">Profile</h2>

    <div class="profile-info">
        <!-- Show Current Profile Image -->
        <img src="/images/${owner.imgPATH}" alt="Profile Picture" class="profile-image">
        <div class="profile-details">
            <div class="section-header">
                <span class="section-title">About me</span>
                <div class="section-underline"></div>
            </div>
        </div>
    </div>

    <div class="divider"></div>

    <form id="updateProfile" action="/owners/profile" method="post">
        <div class="form-group">
            <label class="form-label" for="imgPATH">Image Filename:</label>
            <input type="text" id="imgPATH" name="imgPATH" value="${owner.imgPATH}" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="username">Username:</label>
            <input type="text" id="username" name="username" value="${owner.username}" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="${owner.fullname}" required>
        </div>

        <div class="form-group">
            <label class="form-label">Bio</label>
            <div class="form-textarea">Easy going, and fun loving. I like to live life to the fullest!</div>
        </div>

        <div class="buttons">
            <button type="button" class="cancel">Cancel</button>
            <input type="submit" value="Update Profile">
        </div>
    </form>
</div>

</body>
</html>
