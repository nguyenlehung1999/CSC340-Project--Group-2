package L.FPet.LFPet.LostPetReport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LReportService {

    @Autowired
    private LReportRepository lReportRepository;


    /**
     * Fetch all LostPetReport records.
     *
     * @return a list of LostPetReport objects.
     */
    public List<LostPetReport> getAllReports() {
        return lReportRepository.findAll();
    }

    /**
     * Fetch a specific LostPetReport by its ID.
     *
     * @param reportId the unique report ID.
     * @return a LostPetReport object.
     */
    public LostPetReport getReportById(int reportId) {
        return lReportRepository.findById(reportId).orElse(null);
    }

    /**
     * Add a new LostPetReport.
     *
     * @param report the new LostPetReport object to add.
     */
    public void addNewReport(LostPetReport report) {
        lReportRepository.save(report);
    }

    /**
     * Update an existing LostPetReport.
     *
     * @param reportId the unique report ID.
     * @param updatedReport the updated LostPetReport details.
     */
    public void updateReport(int reportId, LostPetReport updatedReport) {
        LostPetReport existing = getReportById(reportId);
        if (existing != null) {
            existing.setPet(updatedReport.getPet());
            existing.setOwner(updatedReport.getOwner());
            existing.setLostTime(updatedReport.getLostTime());
            existing.setLostLocation(updatedReport.getLostLocation());
            existing.setStatus(updatedReport.getStatus());
            lReportRepository.save(existing);
        }
    }

    /**
     * Delete a LostPetReport by its ID.
     *
     * @param reportId the unique report ID.
     */
    public void deleteReportById(int reportId) {
        lReportRepository.deleteById(reportId);
    }
}
