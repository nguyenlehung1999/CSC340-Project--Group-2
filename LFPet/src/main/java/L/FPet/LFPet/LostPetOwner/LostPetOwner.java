package L.FPet.LFPet.LostPetOwner;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "lostpetowner")
public class LostPetOwner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ownerID")
    private Integer ownerID;

    @Column(name = "username", length = 50, nullable = false)
    private String username;

    @Column(name = "fullname", length = 50, nullable = false)
    private String fullname;

    @Column(name = "password", length = 50, nullable = false)
    private String password;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    // Using java LocalDateTime
    @Column(insertable = false, name = "joinDate", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime joinDate;

    @Column(name = "imgPATH", length = 100)
    private String imgPATH;

    @Column(name = "status")
    private boolean status;

    // No-argument constructor (required by JPA)
    public LostPetOwner() {
    }

    // All-argument constructor
    public LostPetOwner(Integer ownerID, String username, String fullname, String password, String email, LocalDateTime joinDate, String imgPATH, boolean status) {
        this.ownerID = ownerID;
        this.username = username;
        this.fullname = fullname;
        this.password = password;
        this.email = email;
        this.joinDate = joinDate;
        this.imgPATH = imgPATH;
        this.status = status;
    }

    // Getters and Setters
    public Integer getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(Integer ownerID) {
        this.ownerID = ownerID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {return fullname;}

    public void setFullname(String fullname) {this.fullname = fullname;}
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDateTime getJoinDate() {return joinDate;}

    public void setJoinDate(LocalDateTime joinDate) {this.joinDate = joinDate;}

    public String getImgPATH() {
        return imgPATH;
    }

    public void setImgPATH(String imgPATH) {
        this.imgPATH = imgPATH;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
