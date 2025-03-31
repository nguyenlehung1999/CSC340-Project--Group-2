package L.FPet.LFPet.LostPetReport;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LReportRepository extends JpaRepository<LostPetReport, Integer> {

    /**
     * Derived query: find all lost pet reports by status (true/false).
     */
    List<LostPetReport> findByStatus(boolean status);
}