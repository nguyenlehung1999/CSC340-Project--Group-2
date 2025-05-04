<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>

    <!-- Include Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Proxima Nova', 'Inter', Arial, sans-serif;
        }

        body {
            background-color: #F1F1F1;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .back-arrow {
            position: fixed;
            top: 20px;
            left: 20px;
            font-size: 24px;
            color: #000001;
            text-decoration: none;
            z-index: 10;
        }

        .pet-listing-card {
            width: 100%;
            max-width: 550px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 0 auto;
            position: relative;
        }

        .card-title {
            font-size: 25px;
            font-weight: 400;
            color: black;
            margin: 30px 0;
        }

        .pet-image-container {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            position: relative;
        }

        .pet-image {
            width: 150px;
            height: 150px;
            border-radius: 8px;
            object-fit: cover;
        }

        .add-photo-button {
            width: 36px;
            height: 36px;
            background: #6EA8FF;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            bottom: -10px;
            right: calc(50% - 75px);
            border: 1px solid white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            cursor: pointer;
        }

        .add-photo-button i {
            color: white;
            font-size: 18px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 12px;
            color: #77787B;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            background-color: white;
        }

        .form-textarea {
            width: 100%;
            height: 100px;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            resize: none;
        }

        .submit-button {
            background: #AA6EFF;
            color: white;
            font-weight: 700;
            font-size: 16px;
            padding: 15px 0;
            border-radius: 26.5px;
            width: 100%;
            text-align: center;
            display: block;
            text-decoration: none;
            margin-top: 30px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(170, 110, 255, 0.3);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .submit-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(170, 110, 255, 0.4);
        }
    </style>
</head>
<body>
<!-- Back Arrow -->
<a href="/owners/dashboard" class="back-arrow">
    <i class="fa-solid fa-arrow-left"></i>
</a>

<!-- Pet Listing Card -->
<div class="pet-listing-card">
    <h1 class="card-title">List Pet</h1>

    <div class="pet-image-container">
        <img class="pet-image" src="https://images.pexels.com/photos/1490908/pexels-photo-1490908.jpeg?cs=srgb&dl=pexels-svetozar-milashevich-99573-1490908.jpg&fm=jpg" alt="Pet photo placeholder">
        <div class="add-photo-button">
            <i class="fas fa-plus"></i>
        </div>
    </div>



        <form id="newListPet" action="/lreports/new" method="post">

            <div class="form-group">
                <label class="form-label">Picture</label>
                <input type="text" id="imgPath" name="imgPath" required class="form-input" placeholder="Enter pet image">
            </div>

        <div class="form-group">
            <label class="form-label">Species</label>
            <input type="text" id="species" name="species" required class="form-input" placeholder="Enter pet type (e.g. Dog, Cat)">
        </div>

        <div class="form-group">
            <label class="form-label">Name</label>
            <input type="text" id="name" name="name" class="form-input" placeholder="Enter pet name">

        </div>

        <div class="form-group">
            <label class="form-label">Breed</label>
            <input type="text" id="breed" name="breed" class="form-input" placeholder="Enter pet breed/race">
        </div>


        <div class="form-group">
            <label class="form-label">Age</label>
            <input type="number" id="age" name="age" class="form-input" placeholder="Enter pet age">
        </div>

        <div class="form-group">
            <label class="form-label">Description</label>
            <textarea id="description" name="description" class="form-textarea" placeholder="Description (Last Seen)"></textarea>
        </div>

        <div class="form-group">
            <label class="form-label">Lost Location</label>
            <textarea id="lostLocation" name="lostLocation"  class="form-textarea" placeholder="Lost Location"></textarea>
        </div>

        <button type="submit" class="submit-button">Add a pet</button>
    </form>




</div>



</body>
</html>
