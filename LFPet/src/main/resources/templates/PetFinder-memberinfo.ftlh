<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            padding: 20px;
            margin-bottom: 70px; /* Leave space for bottom nav */
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .member-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 16px;
            margin: 20px auto;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .member-card h2 {
            margin-top: 0;
            color: #2c3e50;
        }

        .member-card p {
            margin: 6px 0;
            color: #555;
        }

        .member-card img {
            margin-top: 12px;
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 8px;
        }

        #bottom-nav {
            position: fixed;
            bottom: 0;
            width: 100%;
            display: flex;
            justify-content: space-around;
            background-color: #fff;
            padding: 12px 0;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        #bottom-nav a, #bottom-nav button {
            color: #555;
            font-size: 20px;
            background: none;
            border: none;
            text-decoration: none;
            cursor: pointer;
        }

        #bottom-nav a.active {
            color: #000;
        }
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>

<h1>Member Info</h1>

<div class="member-card">
    <h2>${member.memberUsername!''}</h2>
    <p><strong>ID:</strong> ${member.memberID!''}</p>
    <p><strong>Email:</strong> ${member.email!''}</p>

    <img src="/Photos/avatar1.jpg" alt="${member.memberUsername!'User'}'s photo"/>
</div>


<nav id="bottom-nav">
    <a href="/communitymember/Dashboard" style="background: none; border: none;">
        <i class="fa-solid fa-map-location-dot"></i>
    </a>

    <a href="/communitymember/FoundPet" class="add-button" style="background: none; border: none; text-decoration: none; color: inherit;">
        <i class="fa-solid fa-plus"></i>
    </a>

    <a href="/communitymember/Profile" class="active" style="background: none; border: none; text-decoration: none; color: inherit;">
        <i class="fa-regular fa-user"></i>
    </a>
</nav>

</body>
</html>

