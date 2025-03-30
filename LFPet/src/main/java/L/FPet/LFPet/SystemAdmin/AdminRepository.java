package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.Review.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminRepository extends JpaRepository<SystemAdmin, Integer> {


}
