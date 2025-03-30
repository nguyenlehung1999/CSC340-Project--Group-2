package L.FPet.LFPet.CommunityMember;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "communitymember")
public class CommunityMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "memberID")
    private Integer memberID;

    @Column(name = "username", length = 50, nullable = false)
    private String username;

    @Column(name = "password", length = 50, nullable = false)
    private String password;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    @Column(name = "imgPATH", length = 100)
    private String imgPATH;

    // Using java LocalDateTime
    @Column(name = "joinDate", columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime joinDate;

    @Column(name = "status")
    private boolean status;

    public CommunityMember() {
    }

    public CommunityMember(Integer memberID, String username, String password, String email,
                           String imgPATH, LocalDateTime joinDate, boolean status) {
        this.memberID = memberID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.imgPATH = imgPATH;
        this.joinDate = joinDate;
        this.status = status;
    }

    // Getters and Setters
    public Integer getMemberID() {
        return memberID;
    }

    public void setMemberID(Integer memberID) {
        this.memberID = memberID;
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

    public LocalDateTime getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDateTime joinDate) {
        this.joinDate = joinDate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
