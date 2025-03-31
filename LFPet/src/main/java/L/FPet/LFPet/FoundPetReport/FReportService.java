package L.FPet.LFPet.FoundPetReport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FReportService {

    @Autowired
    private FReportRepository fReportRepository;

    /**
     * Fetch all FoundPetReport records.
     *
     * @return a list of FoundPetReport objects.
     */
    public List<FoundPetReport> getAllReports() {
        return fReportRepository.findAll();
    }

    /**
     * Fetch a specific FoundPetReport by its ID.
     *
     * @param reportId the unique report ID.
     * @return a FoundPetReport object, or null if not found.
     */
    public FoundPetReport getReportById(int reportId) {
        return fReportRepository.findById(reportId).orElse(null);
    }

    /**
     * Add a new FoundPetReport.
     *
     * @param report the new FoundPetReport object to add.
     */
    public void addNewReport(FoundPetReport report) {
        fReportRepository.save(report);
    }

    /**
     * Update an existing FoundPetReport.
     *
     * @param reportId the unique report ID.
     * @param updatedReport the updated FoundPetReport details.
     */
    public void updateReport(int reportId, FoundPetReport updatedReport) {
        FoundPetReport existing = getReportById(reportId);
        if (existing != null) {
            existing.setMember(updatedReport.getMember());
            existing.setPet(updatedReport.getPet());
            existing.setFoundLocation(updatedReport.getFoundLocation());
            existing.setFoundDate(updatedReport.getFoundDate());
            existing.setStatus(updatedReport.getStatus());
            fReportRepository.save(existing);
        }
    }

    /**
     * Delete a FoundPetReport by its ID.
     *
     * @param reportId the unique report ID.
     */
    public void deleteReportById(int reportId) {
        fReportRepository.deleteById(reportId);
    }
}
