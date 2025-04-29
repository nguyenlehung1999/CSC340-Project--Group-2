package L.FPet.LFPet.LostPetReport;

import L.FPet.LFPet.FoundPetReport.FoundPetReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LReportRepository extends JpaRepository<LostPetReport, Integer> {

    /**
     * Derived query: find all lost pet reports by status (true/false).
     */
    List<LostPetReport> findByStatus(boolean status);


    @Query(value = "SELECT * FROM lostpetreport ORDER BY createdat DESC;", nativeQuery = true)
    List<LostPetReport> allReports();

}