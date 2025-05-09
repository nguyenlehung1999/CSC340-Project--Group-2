package L.FPet.LFPet.SystemAdmin;

import jakarta.persistence.*;

@Entity
@Table(name = "systemadmin")
public class SystemAdmin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "adminID")
    private Integer adminID;

    @Column(name = "username", length = 50, nullable = false, unique = true)
    private String username;

    @Column(name = "password", length = 100, nullable = false)
    private String password;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    @Column(name = "imgPATH", length = 100)
    private String imgPATH;

    @Column(name = "status", length = 20)
    private String status;

    @Column(name = "role", length = 20, nullable = false)
    private String role = "ROLE_ADMIN";

    public SystemAdmin() {
    }

    public SystemAdmin(Integer adminID, String username, String password, String email,
                       String imgPATH, String status, String role) {
        this.adminID = adminID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.imgPATH = imgPATH;
        this.status = status;
        this.role = role;
    }

    // Getters and Setters
    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
