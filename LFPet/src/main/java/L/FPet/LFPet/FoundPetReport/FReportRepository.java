package L.FPet.LFPet.FoundPetReport;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FReportRepository extends JpaRepository<FoundPetReport, Integer> {

    /**
     * Derived query: find all found pet reports by status.
     */
    List<FoundPetReport> findByStatus(boolean status);

    /**
     * Derived query: find all found pet reports by memberID.
     */
    List<FoundPetReport> findByMemberMemberID(Integer memberID);

    @Query(value = "SELECT * FROM foundpetreport ORDER BY createdat DESC;", nativeQuery = true)
    List<FoundPetReport> allReports();
}