package L.FPet.LFPet.LostPetOwner;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OwnerRepository extends JpaRepository<LostPetOwner, Integer> {

    // Derived Query: find owners by username
    List<LostPetOwner> getLostPetOwnersByUsername(String username);

    // Derived Query: find owners by email
    LostPetOwner getLostPetOwnerByEmail(String email);

    // Derived Query: find owners by status
    List<LostPetOwner> getLostPetOwnersByStatus(boolean status);

    // Example Native Query: find owners whose name contains a certain string
    @Query(value = "SELECT * FROM lostpetowner o WHERE o.username LIKE %?1%", nativeQuery = true)
    List<LostPetOwner> searchByUsernameContains(String partialName);
}
