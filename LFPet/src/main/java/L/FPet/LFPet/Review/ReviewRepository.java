package com.example.LostPetFinder;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {

    /**
     * Find reviews by a specific rating.
     */
    List<Review> findByRating(int rating);
    List<Review> findByMember_MemberID(Integer memberId);



    /**
     * Find reviews with a rating greater than or equal to the specified value.
     */
    List<Review> findByRatingGreaterThanEqual(int rating);

    /**
     * Find reviews by part of the review text (case-sensitive).
     */
    List<Review> findByReviewTextContaining(String partialText);

    /**
     * Find review associated with a given FoundPetReport.
     */
    List<Review> findByFoundReport(FoundPetReport foundReport);

    /**
     * Find review associated with am owner.
     */
    List<Review> findByOwnerOwnerID(LostPetOwner owner);
    /**
     * Return the average rating
     */
    @Query("SELECT r.rating, COUNT(r) FROM Review r GROUP BY r.rating")
    List<Object[]> getRatingBreakdown();

    @Query("SELECT AVG(r.rating) FROM Review r")
    Double getAverageRating();

    // Count of each star rating for a given member
    @Query("SELECT r.rating, COUNT(r) FROM Review r WHERE r.member.id = :memberId GROUP BY r.rating")
    List<Object[]> findStarCountsByMemberId(@Param("memberId") Long memberId);

    // Average rating for a given member
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.member.id = :memberId")
    Double findAverageRatingByMemberId(@Param("memberId") Long memberId);

}
