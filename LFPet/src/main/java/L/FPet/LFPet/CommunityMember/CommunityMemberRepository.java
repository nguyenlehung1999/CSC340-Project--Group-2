package com.example.LostPetFinder;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Provides the actual database transactions.
 */
@Repository
public interface CommunityMemberRepository extends JpaRepository<CommunityMember, Integer> {




    @Query(value = "username ", nativeQuery = true)
    List<CommunityMember> getMemberUsername(String username);

    @Query(value = "password", nativeQuery = true)
    List<CommunityMember> getMemberPassword(String password);

   // List<CommunityMember> getMemberByStatus(boolean status);

       CommunityMember findByEmail(String email);


    //@Query(value = "email", nativeQuery = true)
   // List<CommunityMember> getMemberEmail(String email);

    @Query(value = "image", nativeQuery = true)
    List<CommunityMember> getimgPATH(String imgPATH);
}
