package L.FPet.LFPet.LostPetReport;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "lostpetreport")
public class LostPetReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lostReportID")
    private Integer lostReportID;

    @Column(name = "petID", nullable = false)
    private Integer petID;

    @Column(name = "createdAT", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createdAT;

    @Column(name = "lastSeen")
    private LocalDateTime lastSeen;

    @Column(name = "lostLocation", length = 100)
    private String lostLocation;

    @Column(name = "status")
    private boolean status;

    public LostPetReport() {
    }

    public LostPetReport(Integer lostReportID, Integer petID, LocalDateTime createdAT,
                         LocalDateTime lastSeen, String lostLocation, boolean status) {
        this.lostReportID = lostReportID;
        this.petID = petID;
        this.createdAT = createdAT;
        this.lastSeen = lastSeen;
        this.lostLocation = lostLocation;
        this.status = status;
    }

    // Getters and Setters
    public Integer getLostReportID() {
        return lostReportID;
    }

    public void setLostReportID(Integer lostReportID) {
        this.lostReportID = lostReportID;
    }

    public Integer getPetID() {
        return petID;
    }

    public void setPetID(Integer petID) {
        this.petID = petID;
    }

    public LocalDateTime getCreatedAT() {
        return createdAT;
    }

    public void setCreatedAT(LocalDateTime createdAT) {
        this.createdAT = createdAT;
    }

    public LocalDateTime getLostTime() {
        return lastSeen;
    }

    public void setLostTime(LocalDateTime lostTime) {
        this.lastSeen = lostTime;
    }

    public String getLostLocation() {
        return lostLocation;
    }

    public void setLostLocation(String lostLocation) {
        this.lostLocation = lostLocation;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}