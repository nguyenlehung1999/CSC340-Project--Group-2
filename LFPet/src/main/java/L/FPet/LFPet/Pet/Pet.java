package L.FPet.LFPet.Pet;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import jakarta.persistence.*;

@Entity
@Table(name = "pet")
public class Pet {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int petID;

    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String breed;

    @Column(nullable = false)
    private String species;

    private double age;

    @OneToOne
    @JoinColumn(name = "ownerID")
    private LostPetOwner owner;

    @OneToOne
    @JoinColumn(name = "memberID")
    private CommunityMember member;

    @Column(nullable = false)
    private String imgPath;

    private boolean status;

    public Pet() {
    }
    public Pet(String species, String breed, String description, String imgPath, boolean status) {
        this.species = species;
        this.breed = breed;
        this.description = description;
        this.imgPath = imgPath;
        this.status = status;
    }

    public Pet(boolean status, String description, String breed, String imgPath) {
        this.status = status;
        this.description = description;
        this.breed = breed;
        this.imgPath = imgPath;
    }

    public Pet(CommunityMember member, String description, String breed, String imgPath, boolean status) {
        this.member = member;
        this.description = description;
        this.breed = breed;
        this.imgPath = imgPath;
        this.status = status;
    }

    public Pet(String name, String description, String breed, double age, LostPetOwner owner, String imgPath, boolean status) {
        this.name = name;
        this.description = description;
        this.breed = breed;
        this.age = age;
        this.owner = owner;
        this.imgPath = imgPath;
        this.status = status;
    }

    ////////////////////////////////////////////////////
    //Getters and Setters
    public String imgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public boolean status() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public CommunityMember member() {
        return member;
    }

    public void setMember(CommunityMember member) {
        this.member = member;
    }

    public double age() {
        return age;
    }

    public void setAge(double age) {
        this.age = age;
    }

    public LostPetOwner owner() {
        return owner;
    }

    public void setOwner(LostPetOwner owner) {
        this.owner = owner;
    }

    public String breed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String description() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String name() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int petID() {
        return petID;
    }

    public void setPetID(int petID) {
        this.petID = petID;
    }

    public String species() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

}
