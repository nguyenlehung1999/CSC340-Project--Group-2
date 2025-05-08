<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Member</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            background-color: #fff;
            padding: 24px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .card h2 {
            margin-bottom: 16px;
            text-align: center;
            color: #333;
        }

        .card input {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .card button,
        .card a {
            display: inline-block;
            width: 48%;
            padding: 10px;
            text-align: center;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .card button {
            background-color: #007bff;
        }

        .card a {
            background-color: #dc3545;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Update Member</h2>
    <form id="member-update" action="/communitymember/update/${memberId?c}" method="post">
        <input type="text" id="memberId" name="memberId" value="${memberId?c}" readonly />
        <input type="text" id="email" name="email" value="${member.email!''}" placeholder="Email" />
        <input type="text" id="username" name="memberUsername" value="${member.memberUsername!''}" placeholder="Username" />
        <input type="text" id="password" name="memberPassword" value="${member.memberPassword!''}" placeholder="Password" />
        <input type="text" id="imgPATH" name="imgPATH" value="${member.imgPATH!''}" placeholder="Image" />

        <div class="button-group">
            <button type="submit">Save</button>
            <a href="/communitymember/${memberId?c}">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
