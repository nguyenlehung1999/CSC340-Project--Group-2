package L.FPet.LFPet.Review;

import L.FPet.LFPet.FoundPetReport.FoundPetReport;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {

    /**
     * Find reviews by a specific rating.
     */
    List<Review> findByRating(int rating);

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
    @Query("SELECT AVG(r.rating) FROM Review r")
    Double findAverageRating();

    /**
     * Return all review sorted by time_stamp
     */
    @Query(value = "SELECT * FROM review ORDER BY time_stamp DESC", nativeQuery = true)
    List<Review> findAllSortedByTimeStampNative();
}
