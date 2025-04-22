package L.FPet.LFPet.Review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * ReviewController.java
 * Includes all REST API endpoint mappings for the Review object.
 */
@Controller
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    /**
     * Get a list of all Reviews in the database.
     * URL: http://localhost:8080/reviews/all
     *
     * @return a list of Review objects.
     */
    @GetMapping("/all")
    public ResponseEntity<?> getAllReviews() {
        return new ResponseEntity<>(reviewService.getAllReviews(), HttpStatus.OK);
    }

    /**
     * Get a specific Review by its ID.
     * URL: http://localhost:8080/reviews/{reviewId}
     *
     * @param reviewId the unique review ID.
     * @return one Review object, or null if not found.
     */
    @GetMapping("/{reviewId}")
    public ResponseEntity<?> getReviewById(@PathVariable int reviewId) {
        Review review = reviewService.getReviewById(reviewId);
        return new ResponseEntity<>(review, (review != null) ? HttpStatus.OK : HttpStatus.NOT_FOUND);
    }

    /**
     * Create a new Review entry.
     * URL: http://localhost:8080/reviews/new
     * Example request body (JSON):
     * {
     *   "rating": 4,
     *   "reviewText": "Great service!",
     *   "foundReport": {
     *     "foundReportID": 1
     *   },
     *   "owner": {
     *     "ownerID": 2
     *   }
     * }
     * @param review the new Review object to add.
     * @return the updated list of Review objects, or the created Review object.
     */
    @PostMapping("/new")
    public ResponseEntity<?> addNewReview(@RequestBody Review review) {
        reviewService.addNewReview(review);
        return new ResponseEntity<>(reviewService.getAllReviews(), HttpStatus.CREATED);
    }

    /**
     * Update an existing Review object.
     * URL: http://localhost:8080/reviews/update/{reviewId}
     * Example request body (JSON):
     * {
     *   "rating": 5,
     *   "reviewText": "Excellent service!"
     * }
     *
     * @param reviewId the unique review ID.
     * @param updatedReview the updated Review details.
     * @return the updated Review object.
     */
    @PutMapping("/update/{reviewId}")
    public ResponseEntity<?> updateReview(@PathVariable int reviewId, @RequestBody Review updatedReview) {
        reviewService.updateReview(reviewId, updatedReview);
        Review review = reviewService.getReviewById(reviewId);
        return new ResponseEntity<>(review, (review != null) ? HttpStatus.OK : HttpStatus.NOT_FOUND);
    }

    /**
     * Delete a Review object.
     * URL: http://localhost:8080/reviews/delete/{reviewId}
     *
     * @param reviewId the unique review ID.
     * @return the updated list of Review objects.
     */
    @DeleteMapping("/delete/{reviewId}")
    public ResponseEntity<?> deleteReviewById(@PathVariable int reviewId) {
        reviewService.deleteReviewById(reviewId);
        return new ResponseEntity<>(reviewService.getAllReviews(), HttpStatus.OK);
    }
}
