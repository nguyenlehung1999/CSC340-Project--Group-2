package L.FPet.LFPet.FoundPetReport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * FReportController.java
 * Includes all REST API endpoint mappings for the FoundPetReport entity.
 */
@Controller
@RequestMapping("/freports")
public class FReportController {

    @Autowired
    private FReportService fReportService;

    /**
     * Get a list of all FoundPetReports in the database.
     * URL: http://localhost:8080/freports/all
     *
     * @return a list of FoundPetReport objects.
     */
    @GetMapping("/all")
    public ResponseEntity<?> getAllReports() {
        return new ResponseEntity<>(fReportService.getAllReports(), HttpStatus.OK);
    }

    /**
     * Get a specific FoundPetReport by Id.
     * URL: http://localhost:8080/freports/{reportId}
     *
     * @param reportId the unique report ID.
     * @return one FoundPetReport object or 404 if not found.
     */
    @GetMapping("/{reportId}")
    public Object getOneReport(@PathVariable int reportId, Model model) {
        model.addAttribute("report", fReportService.getReportById(reportId));
        model.addAttribute("title", "Report #: " + reportId);
        return "Sys-detailedFoundPost";
    }

    /**
     * Create a new FoundPetReport entry.
     * URL: http://localhost:8080/freports/new
     * Example request body:
     * {
     *    "member": { "memberID": 1 },
     *      "pet": { "petID": 5 },
     *       "foundLocation": "Downtown Park",
     *         "status": false
     *       }
     *
     * @param report the new FoundPetReport object.
     * @return the updated list of FoundPetReport objects.
     */
    @PostMapping("/new")
    public ResponseEntity<?> addNewReport(@RequestBody FoundPetReport report) {
        fReportService.addNewReport(report);
        return new ResponseEntity<>(fReportService.getAllReports(), HttpStatus.CREATED);
    }

    /**
     * Update an existing FoundPetReport object.
     * URL: http://localhost:8080/freports/update/2
     * Example request body:
     * {
     *   "foundLocation": "City Park",
     *   "status": true
     * }
     *
     * @param reportId the unique report ID.
     * @param updatedReport the updated FoundPetReport details.
     * @return the updated FoundPetReport object or 404 if not found.
     */
    @PutMapping("/update/{reportId}")
    public ResponseEntity<?> updateReport(@PathVariable int reportId, @RequestBody FoundPetReport updatedReport) {
        FoundPetReport existing = fReportService.getReportById(reportId);
        fReportService.updateReport(reportId, updatedReport);
        return new ResponseEntity<>(fReportService.getReportById(reportId), HttpStatus.OK);
    }
    /**
     * Update an existing FoundPetReport object's status.
     * URL: http://localhost:8080/freports/updatestatus/2
     * Example request body:
     * {
     *   "status": true
     * }
     *
     * @param reportId the unique report ID.
     * @param updatedReport the updated FoundPetReport details.
     * @return the updated FoundPetReport object.
     */
    @PutMapping("/updatestatus/{reportId}")
    public ResponseEntity<?> updateStatus(@PathVariable int reportId, @RequestBody FoundPetReport updatedReport) {
        FoundPetReport existing = fReportService.getReportById(reportId);
        fReportService.updateStatus(reportId, updatedReport);
        return new ResponseEntity<>(fReportService.getReportById(reportId), HttpStatus.OK);
    }
    /**
     * Delete a FoundPetReport object.
     * URL: http://localhost:8080/freports/delete/2
     *
     * @param reportId the unique report ID.
     * @return the updated list of FoundPetReport objects.
     */
    @DeleteMapping("/delete/{reportId}")
    public ResponseEntity<?> deleteReportById(@PathVariable int reportId) {
        FoundPetReport existing = fReportService.getReportById(reportId);
        fReportService.deleteReportById(reportId);
        return new ResponseEntity<>(fReportService.getAllReports(), HttpStatus.OK);
    }
}
