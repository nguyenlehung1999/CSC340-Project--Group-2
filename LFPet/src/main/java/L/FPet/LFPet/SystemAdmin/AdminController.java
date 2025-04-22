package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.CommunityMember.MemberService;
import L.FPet.LFPet.FoundPetReport.FReportRepository;
import L.FPet.LFPet.FoundPetReport.FReportService;
import L.FPet.LFPet.FoundPetReport.FoundPetReport;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.LostPetOwner.OwnerService;
import L.FPet.LFPet.LostPetReport.LReportRepository;
import L.FPet.LFPet.LostPetReport.LReportService;
import L.FPet.LFPet.LostPetReport.LostPetReport;
import L.FPet.LFPet.Pet.PetService;
import L.FPet.LFPet.Review.Review;
import L.FPet.LFPet.Review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private PetService petService;

    @Autowired
    private AdminService service;

    @Autowired
    private AdminRepository repository;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private FReportService fReportService;

    @Autowired
    private LReportService lReportService;

    @Autowired
    private FReportRepository rRepository;
    /**
     * Get a list of all User in the database.
     * URL: http://localhost:8080/admin/allusers
     *
     * @return a list of owners and members objects.
     */
    @GetMapping("/allusers")
    public Object getAllUsers() {
        return new ResponseEntity<>(service.findAllUser(), HttpStatus.OK);
    }

    @GetMapping("/dashboard")
    public Object getAllReports(Model model) {
        model.addAttribute("petReports", rRepository.allReports());
        model.addAttribute("title", "All Reports");
        return "Sysadmin-dashboard";
    }
    /**
     * Get a list of all User in the database.
     * URL: http://localhost:8080/admin/recentmember
     *
     * @return a list of recently created member account
     */
    @GetMapping("/recentmember")
    public Object getRecentMembers() {
        return new ResponseEntity<>(repository.recentMemberAccounts(), HttpStatus.OK);
    }

    /**
     * Get a list of all User in the database.
     * URL: http://localhost:8080/admin/recentowner
     *
     * @return a list of recently created owner account
     */
    @GetMapping("/recentowner")
    public Object getRecentOwners() {
        return new ResponseEntity<>(repository.recentOwnerAccounts(), HttpStatus.OK);
    }

    /**
     * Update the status of an owner by their ID.
     * URL: http://localhost:8080/admin/updateowner/{ownerId}
     *
     * Example request body:
     * {
     *    "status": true
     * }
     */
    @PutMapping("/updateowner/{ownerId}")
    public ResponseEntity<LostPetOwner> updateOwnerStatus(@PathVariable int ownerId, @RequestBody LostPetOwner owner) {
        service.updateOwner(ownerId, owner);
        return new ResponseEntity<>(ownerService.getOwnerById(ownerId), HttpStatus.OK);
    }
    /**
     * Update the status of a CommunityMember by their ID.
     * URL: http://localhost:8080/admin/updatemember/{memberId}
     *
     * Example request body:
     * {
     *   "status": true
     * }
     */
    @PutMapping("/updatemember/{memberId}")
    public ResponseEntity<CommunityMember> updateMemberStatus(@PathVariable int memberId, @RequestBody CommunityMember member) {
        //Call the service to update the member
        service.updateMember(memberId, member);
        //Retrieve the updated member from the database
        CommunityMember updatedMember = memberService.getMemberById(memberId);
        return new ResponseEntity<>(updatedMember, HttpStatus.OK);
    }
    /**
     * Get a list of all Reviews.
     * URL: http://localhost:8080/admin/reviews/all
     *
     * @return a list of Review objects.
     */
    @GetMapping("/reviews/all")
    public ResponseEntity<List<Review>> getAllReviews() {
        List<Review> reviews = reviewService.getAllReviews();
        return new ResponseEntity<>(reviews, HttpStatus.OK);
    }
    /**
     * Delete a Review object.
     * URL: http://localhost:8080/admin/reviews/delete/{reviewId}
     *
     * @param reviewId the unique Review id.
     * @return the updated list of Review objects.
     */
    @DeleteMapping("/reviews/delete/{reviewId}")
    public ResponseEntity<?> deleteReview(@PathVariable int reviewId) {
        Review review = reviewService.getReviewById(reviewId);
        reviewService.deleteReviewById(reviewId);
        return new ResponseEntity<>(reviewService.getAllReviews(), HttpStatus.OK);
    }
    /**
     * Delete a Found Report object.
     * URL: http://localhost:8080/admin/freport/delete/{freportId}
     *
     * @param freportId the unique found report id.
     * @return the updated list of Found report objects.
     */
    @DeleteMapping("/freport/delete/{freportId}")
    public ResponseEntity<?> deleteFReport(@PathVariable int freportId) {
        FoundPetReport report = fReportService.getReportById(freportId);
        fReportService.deleteReportById(freportId);
        return new ResponseEntity<>(fReportService.getAllReports(), HttpStatus.OK);
    }
    /**
     * Delete a Lost Report object.
     * URL: http://localhost:8080/admin/lreport/delete/{lreportId}
     *
     * @param lreportId the unique lost report id.
     * @return the updated list of Lost Report objects.
     */
    @DeleteMapping("/lreport/delete/{lreportId}")
    public ResponseEntity<?> deleteLReport(@PathVariable int lreportId) {
        LostPetReport report = lReportService.getReportById(lreportId);
        lReportService.deleteReportById(lreportId);
        return new ResponseEntity<>(lReportService.getAllReports(), HttpStatus.OK);
    }
    /**
     * Display system statistics
     * URL: http://localhost:8080/admin/statistics
     */
    @GetMapping("/statistics")
    public ResponseEntity<Map<String, Object>> getStats() {
        Map<String, Object> stats = new LinkedHashMap<>();
        stats.put("totalPets", petService.countPets());
        stats.put("totalFoundPets", (petService.getPetsByStatus(true)).size());
        stats.put("totalLostPets", (petService.getPetsByStatus(false)).size());
        stats.put("successfulReunions", (fReportService.getFReportsByStatus(true)).size());
        stats.put("totalReviews", reviewService.getReviewCount());
        stats.put("averageRating", Math.round(reviewService.getAverageRating() * 100.0) / 100.0);
        stats.put("totalUsers", memberService.countMembers() + ownerService.countOwners());
        stats.put("activeOwners", (ownerService.getOwnersByStatus(true)).size());
        stats.put("bannedOwners", (ownerService.getOwnersByStatus(false)).size());
        stats.put("activeMembers", (memberService.getMembersByStatus(true)).size());
        stats.put("bannedMembers", (memberService.getMembersByStatus(false)).size());

        return new ResponseEntity<>(stats, HttpStatus.OK);
    }
}
