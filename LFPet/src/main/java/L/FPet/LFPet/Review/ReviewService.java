package com.example.LostPetFinder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public Map<Integer, Long> getStarCounts() {
        List<Object[]> results = reviewRepository.getRatingBreakdown();
        Map<Integer, Long> starMap = new HashMap<>();
        for (Object[] row : results) {
            Integer rating = (Integer) row[0];
            Long count = (Long) row[1];
            starMap.put(rating, count);
        }
        return starMap;
    }

    public double getAverageRating() {
        Double avg = reviewRepository.getAverageRating();
        return avg != null ? avg : 0.0;
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

    public List<Review> getReviewsByMemberId(Integer memberId) {
        return reviewRepository.findByMember_MemberID(memberId);
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

    public Map<Integer, Long> getStarCountsByMember(Long memberId) {
        List<Object[]> results = reviewRepository.findStarCountsByMemberId(memberId);
        Map<Integer, Long> counts = new HashMap<>();
        for (Object[] row : results) {
            Integer rating = (Integer) row[0];
            Long count = (Long) row[1];
            counts.put(rating, count);
        }
        return counts;
    }

    public double getAverageRatingByMember(Long memberId) {
        Double avg = reviewRepository.findAverageRatingByMemberId(memberId);
        return avg != null ? avg : 0.0;
    }

}


