package com.example.LostPetFinder;


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

    @ManyToOne
    @JoinColumn(name = "memberID")
    private CommunityMember member;

    private String imgPath;

    private boolean status;
    private String foundLocation;

    public Pet() {
    }
    public Pet(String species, String breed, String description, String imgPath, boolean status, String foundLocation) {
        this.species = species;
        this.breed = breed;
        this.description = description;
        this.imgPath = imgPath;
        this.status = status;
        this.foundLocation = foundLocation;
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


    //Getters and Setters
    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public CommunityMember getMember() {
        return member;
    }

    public void setMember(CommunityMember member) {
        this.member = member;
    }

    public double getAge() {
        return age;
    }

    public void setAge(double age) {
        this.age = age;
    }

    public LostPetOwner getOwner() {
        return owner;
    }

    public void setOwner(LostPetOwner owner) {
        this.owner = owner;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPetID() {
        return petID;
    }

    public void setPetID(int petID) {
        this.petID = petID;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getFoundLocation() {
        return foundLocation;
    }

    public void setFoundLocation(String foundLocation) {
        this.foundLocation = foundLocation;
    }


}
