package L.FPet.LFPet.LostPetReport;

import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.LostPetOwner.OwnerService;
import L.FPet.LFPet.Pet.Pet;

import L.FPet.LFPet.Pet.PetService;
import jakarta.servlet.http.HttpSession;
import L.FPet.LFPet.Review.Review;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * LostReportController.java
 * Includes all REST API endpoint mappings for the LostPetReport entity.
 */
@Controller
@RequestMapping("lreports")
public class LReportController {

    @Autowired
    private LReportService lReportService;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private PetService petService;



    /**
     * Get a list of all LostPetReports in the database.
     * URL: http://localhost:8080/lreports/all
     *
     * @return a list of LostPetReport objects.
     */
    @GetMapping("/all")
    public ResponseEntity<?> getAllReports() {
        return new ResponseEntity<>(lReportService.getAllReports(), HttpStatus.OK);
    }


    @PostMapping("/new")
    public Object addNewLReport(@ModelAttribute LostPetReport report,
                                @ModelAttribute Pet pet,
                                HttpSession session) {

        String email = (String) session.getAttribute("loggedInEmail");
        if (email == null) {
            return "redirect:/owners/LoginPage";
        }

        LostPetOwner owner = ownerService.getOwnerByEmail(email);

        if (owner != null) {
            pet.setOwner(owner);
            report.setPet(pet);       // cascade will save this Pet automatically
            report.setOwner(owner);

            lReportService.addNewReport(report);  // saves both LostPetReport and Pet
        }

        return "redirect:/owners/dashboard";
    }



    @GetMapping("/listaPet")
    public String showListPet(Model model) {
        LostPetReport report = new LostPetReport();
        model.addAttribute("report", report);
        model.addAttribute("title", "List pet");
        return "listPet";
    }



    /**
     * Get a specific LostPetReport by Id.
     * URL: http://localhost:8080/lreports/{reportId}
     *
     * @param reportId the unique report ID.
     * @return one LostPetReport object or 404 if not found.
     *
     */




    @GetMapping("/{reportId}")
    public ResponseEntity<?> getOneReport(@PathVariable int reportId) {
        LostPetReport report = lReportService.getReportById(reportId);
        return new ResponseEntity<>(report, HttpStatus.OK);
    }

    /**
     * Create a new LostPetReport entry.
     * URL: http://localhost:8080/lreports/new
     * Example request body:
     * {
     *   "pet": { "petID": 3 },
     *   "owner": { "ownerID": 1 },
     *   "lostLocation": "Downtown Area",
     *   "status": true
     * }
     *
     * @param report the new LostPetReport object.
     * @return the updated list of LostPetReport objects.
     */
//    @PostMapping("/new")
//    public ResponseEntity<?> addNewReport(@RequestBody LostPetReport report) {
//        lReportService.addNewReport(report);
//        return new ResponseEntity<>(lReportService.getAllReports(), HttpStatus.CREATED);
//    }

    /**
     * Update an existing LostPetReport object.
     * URL: http://localhost:8080/lreports/update/2
     * Example request body:
     * {
     *   "lostLocation": "City Park",
     *   "status": false
     * }
     *
     * @param reportId the unique report ID.
     * @param updatedReport the updated LostPetReport details.
     * @return the updated LostPetReport object or 404 if not found.
     */
    @PutMapping("/update/{reportId}")
    public ResponseEntity<?> updateReport(@PathVariable int reportId, @RequestBody LostPetReport updatedReport) {
        LostPetReport existing = lReportService.getReportById(reportId);
        lReportService.updateReport(reportId, updatedReport);
        return new ResponseEntity<>(lReportService.getReportById(reportId), HttpStatus.OK);
    }

    /**
     * Delete a LostPetReport object.
     * URL: http://localhost:8080/lreports/delete/2
     *
     * @param reportId the unique report ID.
     * @return the updated list of LostPetReport objects or 404 if not found.
     */
    @DeleteMapping("/delete/{reportId}")
    public ResponseEntity<?> deleteReportById(@PathVariable int reportId) {
        LostPetReport existing = lReportService.getReportById(reportId);
        lReportService.deleteReportById(reportId);
        return new ResponseEntity<>(lReportService.getAllReports(), HttpStatus.OK);
    }
}
