package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.Review.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminRepository extends JpaRepository<SystemAdmin, Integer> {

    @Query(value = "SELECT * FROM communitymember ORDER BY join_date DESC;", nativeQuery = true)
    List<CommunityMember> recentMemberAccounts();

    @Query(value = "SELECT * FROM lostpetowner ORDER BY join_date DESC;", nativeQuery = true)
    List<LostPetOwner> recentOwnerAccounts();

}
