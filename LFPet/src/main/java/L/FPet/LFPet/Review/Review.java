package L.FPet.LFPet.Review;

import L.FPet.LFPet.FoundPetReport.FoundPetReport;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reviewID")
    private Integer reviewID;

    @OneToOne
    @JoinColumn(name = "foundReportID")
    private FoundPetReport foundReport;

    @Column(name = "rating", nullable = false)
    private Integer rating;

    @Column(name = "reviewText", columnDefinition = "TEXT")
    private String reviewText;

    @Column(name = "timeStamp", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime timeStamp;

    public Review() {
    }

    public Review(Integer reviewID, FoundPetReport foundReport, Integer rating, String reviewText, LocalDateTime timeStamp) {
        this.reviewID = reviewID;
        this.foundReport = foundReport;
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

    public FoundPetReport foundReport() {
        return foundReport;
    }

    public void setFoundReport(FoundPetReport foundReport) {
        this.foundReport = foundReport;
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
