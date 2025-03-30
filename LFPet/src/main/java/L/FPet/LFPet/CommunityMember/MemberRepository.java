package L.FPet.LFPet.CommunityMember;

import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberRepository extends JpaRepository <CommunityMember, Integer> {
    // Derived Query: find members by username
    List<CommunityMember> getMembersByUsername(String username);

    // Derived Query: find members by email
    CommunityMember getMembersByEmail(String email);

    // Derived Query: find members by status
    List<CommunityMember> getMembersByStatus(boolean status);

    // Example Native Query: find members whose name contains a certain string
    @Query(value = "SELECT * FROM communitymember m WHERE m.username LIKE %?1%", nativeQuery = true)
    List<CommunityMember> searchByUsernameContains(String partialName);
}
