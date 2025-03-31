package L.FPet.LFPet.FoundPetReport;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.Pet.Pet;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "foundpetreport")
public class FoundPetReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "foundReportID")
    private Integer foundReportID;

    @ManyToOne
    @JoinColumn(name = "memberID")
    private CommunityMember member;

    @OneToOne
    @JoinColumn(name = "petID")
    private Pet pet;

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

    public FoundPetReport(Integer foundReportID, CommunityMember member, Pet pet, LocalDateTime createdAT, String description, LocalDateTime foundDate, String foundLocation, boolean status) {
        this.foundReportID = foundReportID;
        this.member = member;
        this.pet = pet;
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

    public CommunityMember getMember() {
        return member;
    }

    public void setMember(CommunityMember member) {
        this.member = member;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
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

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}