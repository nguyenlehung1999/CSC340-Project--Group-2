package L.FPet.LFPet.LostPetReport;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.Pet.Pet;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "lostpetreport")
public class LostPetReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lost_reportid")
    private Integer lostReportID;

    @OneToOne
    @JoinColumn(name = "petID")
    private Pet pet;

    @ManyToOne
    @JoinColumn(name = "ownerID")
    private LostPetOwner owner;

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

    public LostPetReport(Integer lostReportID, LostPetOwner owner, Pet pet, LocalDateTime createdAT,
                         LocalDateTime lastSeen, String lostLocation, boolean status) {
        this.lostReportID = lostReportID;
        this.pet = pet;
        this.owner = owner;
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

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public LostPetOwner getOwner() {
        return owner;
    }

    public void setOwner(LostPetOwner owner) {
        this.owner = owner;
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

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}