package com.example.LostPetFinder;


import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reviewID")
    private Integer reviewID;
    @ManyToOne
    @JoinColumn(name = "member_id", nullable = false) // this will be the foreign key
    private CommunityMember member;

    @OneToOne
    @JoinColumn(name = "foundReportID")
    private FoundPetReport foundReport;

    @ManyToOne
    @JoinColumn(name = "ownerID")
    private LostPetOwner owner;

    @Column(name = "rating", nullable = false)
    private Integer rating;

    @Column(name = "reviewText", columnDefinition = "TEXT")
    private String reviewText;

    @Column(name = "replyText", columnDefinition = "TEXT")
    private String replyText;

    @Column(name = "timeStamp", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime timeStamp;


    public Review() {
    }

    public Review(Integer reviewID, FoundPetReport foundReport, LostPetOwner owner, Integer rating, String reviewText, String replyText, LocalDateTime timeStamp) {
        this.reviewID = reviewID;
        this.foundReport = foundReport;
        this.owner = owner;
        this.rating = rating;
        this.reviewText = reviewText;
        this.timeStamp = timeStamp;
        this.replyText = replyText;
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

    public LostPetOwner getOwner() {
        return owner;
    }

    public void setOwner(LostPetOwner owner) {
        this.owner = owner;
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

    public String getReplyText() {
        return replyText;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }


    public LocalDateTime getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(LocalDateTime timeStamp) {
        this.timeStamp = timeStamp;
    }
    public CommunityMember getMember() {
        return member;
    }

    public void setMember(CommunityMember member) {
        this.member = member;
    }
}
