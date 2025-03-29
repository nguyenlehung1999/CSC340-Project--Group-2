package L.FPet.LFPet.Review;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reviewID")
    private Integer reviewID;

    @Column(name = "foundReportID", nullable = false)
    private Integer foundReportID;

    @Column(name = "rating", nullable = false)
    private Integer rating;

    @Column(name = "reviewText", columnDefinition = "TEXT")
    private String reviewText;

    @Column(name = "timeStamp", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime timeStamp;

    public Review() {
    }

    public Review(Integer reviewID, Integer foundReportID, Integer rating, String reviewText, LocalDateTime timeStamp) {
        this.reviewID = reviewID;
        this.foundReportID = foundReportID;
        this.rating = rating;
        this.reviewText = reviewText;
        this.timeStamp = timeStamp;
    }

    // Getters and Setters
    public Integer getReviewID() {
        return reviewID;
    }

    public void setReviewID(Integer reviewID) {
        this.reviewID = reviewID;
    }

    public Integer getFoundReportID() {
        return foundReportID;
    }

    public void setFoundReportID(Integer foundReportID) {
        this.foundReportID = foundReportID;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public LocalDateTime getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(LocalDateTime timeStamp) {
        this.timeStamp = timeStamp;
    }
}
