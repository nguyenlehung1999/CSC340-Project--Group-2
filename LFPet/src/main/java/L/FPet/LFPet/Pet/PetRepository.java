package com.example.LostPetFinder;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PetRepository extends JpaRepository<Pet, Integer> {

    List<Pet> getPetsByBreed(String breed);

    List<Pet> getPetsBySpecies(String spec);

    List<Pet> getPetsByStatus(boolean status);

    @Query(value = "SELECT * FROM pet p WHERE p.ownerID = ?1", nativeQuery = true)
    List<Pet> getPetsByOwnerID(int ownerID);

    @Query(value = "SELECT * FROM pet p WHERE p.name LIKE %?1%", nativeQuery = true)
    List<Pet> getPetsByName(String partialName);


    List<Pet> findByMember_MemberID(Integer memberId);
}
