package L.FPet.LFPet.Review;

import L.FPet.LFPet.FoundPetReport.FoundPetReport;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

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
    @OnDelete(action = OnDeleteAction.CASCADE)
    private FoundPetReport foundReport;

    @ManyToOne
    @JoinColumn(name = "ownerID")
    private LostPetOwner owner;

    @Min(0)
    @Max(5)
    @Check(constraints = "rating >= 0 AND rating <= 5")
    @Column(name = "rating", nullable = false)
    private Double rating;

    @Column(name = "reviewText", columnDefinition = "TEXT")
    private String reviewText;

    @Column(insertable = false, name = "timeStamp", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime timeStamp;

    public Review() {
    }

    public Review(Integer reviewID, FoundPetReport foundReport, LostPetOwner owner, Double rating, String reviewText, LocalDateTime timeStamp) {
        this.reviewID = reviewID;
        this.foundReport = foundReport;
        this.owner = owner;
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

    public FoundPetReport getFoundReport() {
        return foundReport;
    }

    public void setFoundReport(FoundPetReport foundReport) {
        this.foundReport = foundReport;
    }

    public Double getRating() {
        return rating;
    }

    public LostPetOwner getOwner() {
        return owner;
    }

    public void setOwner(LostPetOwner owner) {
        this.owner = owner;
    }

    public void setRating(Double rating) {
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
