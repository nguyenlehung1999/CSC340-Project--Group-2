package L.FPet.LFPet.Review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    /**
     * Fetch all Review records.
     *
     * @return a list of Review objects.
     */
    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }

    /**
     * Get total number of reviews
     *
     * @return the total number of review
     */
    public long getReviewCount() {
        return reviewRepository.count();
    }
    /**
     * Fetch a specific Review by its ID.
     *
     * @param reviewId the unique review ID.
     * @return a Review object, or null if not found.
     */
    public Review getReviewById(int reviewId) {
        return reviewRepository.findById(reviewId).orElse(null);
    }

    /**
     * Get the average rating of all review
     */
    public double getAverageRating() {
        return reviewRepository.findAverageRating();
    }
    /**
     * Add a new Review.
     *
     * @param review the new Review object to add.
     */
    public void addNewReview(Review review) {
        reviewRepository.save(review);
    }

    /**
     * Update an existing Review.
     *
     * @param reviewId the unique review ID.
     * @param review   the updated Review details.
     */
    public void updateReview(int reviewId, Review review) {
        Review existingReview = getReviewById(reviewId);
        if (existingReview != null) {
            existingReview.setRating(review.getRating());
            existingReview.setReviewText(review.getReviewText());
            reviewRepository.save(existingReview);
        }
    }

    /**
     * Delete a Review by its ID.
     *
     * @param reviewId the unique review ID.
     */
    public void deleteReviewById(int reviewId) {
        reviewRepository.deleteById(reviewId);
    }
}
