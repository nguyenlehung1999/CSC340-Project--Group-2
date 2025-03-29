package L.FPet.LFPet.FoundPetReport;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "foundpetreport")
public class FoundPetReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "foundReportID")
    private Integer foundReportID;

    @Column(name = "memberID")
    private Integer memberID;

    @Column(name = "petID")
    private Integer petID;

    @Column(name = "createdAT", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createdAT;

    @Column(name = "description", length = 200)
    private String description;

    @Column(name = "foundDate")
    private LocalDateTime foundDate;

    @Column(name = "foundLocation", length = 100)
    private String foundLocation;

    @Column(name = "status")
    private boolean status;

    public FoundPetReport() {
    }

    public FoundPetReport(Integer foundReportID, Integer memberID, Integer petID, LocalDateTime createdAT, String description, LocalDateTime foundDate, String foundLocation, boolean status) {
        this.foundReportID = foundReportID;
        this.memberID = memberID;
        this.petID = petID;
        this.createdAT = createdAT;
        this.description = description;
        this.foundDate = foundDate;
        this.foundLocation = foundLocation;
        this.status = status;
    }

    // Getters and Setters
    public Integer getFoundReportID() {
        return foundReportID;
    }

    public void setFoundReportID(Integer foundReportID) {
        this.foundReportID = foundReportID;
    }

    public Integer getMemberID() {
        return memberID;
    }

    public void setMemberID(Integer memberID) {
        this.memberID = memberID;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getFoundDate() {
        return foundDate;
    }

    public void setFoundDate(LocalDateTime foundDate) {
        this.foundDate = foundDate;
    }

    public String getFoundLocation() {
        return foundLocation;
    }

    public void setFoundLocation(String foundLocation) {
        this.foundLocation = foundLocation;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}