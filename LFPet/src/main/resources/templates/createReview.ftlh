<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Review Page</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        /* Hide the radio buttons */
        input[type="radio"] {
            display: none;
        }

        .star-rating {
            display: flex;
            direction: row;
            justify-content: center;
        }

        .star {
            font-size: 2rem;
            cursor: pointer;
            color: lightgray;
            transition: color 0.3s;
        }

        /* Hover effect: when hovering over a star, highlight it and all stars before it */
        .star:hover,
        .star:hover ~ .star {
            color: gold;
        }

        /* Keep the selected star and all stars before it gold */
        input[type="radio"]:checked ~ .star-rating .star,
        input[type="radio"]:checked ~ .star-rating .star ~ .star {
            color: gold;
        }

        /* When a star is selected, keep it and all previous stars gold */
        input[type="radio"]:checked + label,
        input[type="radio"]:checked + label ~ label {
            color: gold;
        }
    </style>
</head>
<body class="h-full bg-gray-50 flex items-center justify-center">

<div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-lg">
    <h1 class="text-2xl font-bold text-center text-neutral-800 mb-6">L&F Pet</h1>

    <div class="mb-8 text-center text-4xl font-semibold text-black">
        ${title}
    </div>

    <form id="newReviewForm" action="/reviews/new" method="post">

    <!-- Rating Section (Interactive Stars) -->
    <div class="flex justify-between mb-6">
        <div class="text-xl font-medium text-gray-600">Rating</div>
        <div class="star-rating">
            <!-- Star 5 -->
            <input type="radio" id="star5" name="rating" value="5">
            <label class="star" for="star5">&#9733;</label>

            <!-- Star 4 -->
            <input type="radio" id="star4" name="rating" value="4">
            <label class="star" for="star4">&#9733;</label>

            <!-- Star 3 -->
            <input type="radio" id="star3" name="rating" value="3">
            <label class="star" for="star3">&#9733;</label>

            <!-- Star 2 -->
            <input type="radio" id="star2" name="rating" value="2">
            <label class="star" for="star2">&#9733;</label>

            <!-- Star 1 -->
            <input type="radio" id="star1" name="rating" value="1">
            <label class="star" for="star1">&#9733;</label>
        </div>
    </div>

    <!-- Feedback Section -->
    <div class="mb-6">
        <div class="text-xl font-medium text-gray-600 mb-2">Add Feedback?</div>
        <textarea id="reviewText" name="reviewText"

        class="w-full p-4 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-600" rows="4" placeholder="Enter Text"></textarea>
    </div>
 <!-- End of Feedback Section -->
<div class="mt-6 text-center">
    <button type="submit"
            class="block w-full bg-purple-600 text-white py-3 rounded-lg font-medium hover:bg-purple-700 transition-colors text-center">
        Create Review
    </button>
</div>
</form>

</div>

</body>
</html>
