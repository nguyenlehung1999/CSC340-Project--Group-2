package L.FPet.LFPet.LostPetOwner;

import jakarta.persistence.*;

@Entity
@Table(name = "lostpetowner")
public class LostPetOwner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ownerID")
    private Integer ownerID;

    @Column(name = "username", length = 50, nullable = false)
    private String username;

    @Column(name = "password", length = 50, nullable = false)
    private String password;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    @Column(name = "imgPATH", length = 100)
    private String imgPATH;

    @Column(name = "status", length = 20)
    private String status;

    // No-argument constructor (required by JPA)
    public LostPetOwner() {
    }

    // All-argument constructor
    public LostPetOwner(Integer ownerID, String username, String password, String email, String imgPATH, String status) {
        this.ownerID = ownerID;
        this.username = username;
        this.password = password;
        this.email = email;
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

    public String getImgPATH() {
        return imgPATH;
    }

    public void setImgPATH(String imgPATH) {
        this.imgPATH = imgPATH;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
