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
    public Object getAllUsers(Model model) {
        List<UserDTO> users = service.findAllUsersAsDTOs();
        model.addAttribute("userDTOs", users);
        return "Sys-userlist";
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

    @PostMapping("/updateowner/{ownerId}")
    public String toggleOwnerStatus(@PathVariable int ownerId, @RequestParam boolean status) {
        LostPetOwner owner = ownerService.getOwnerById(ownerId);
        owner.setStatus(status);
        ownerService.save(owner);
        return "redirect:/owners/" + ownerId;
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
    @PostMapping("/updatemember/{memberId}")
    public String toggleMemberStatus(@PathVariable int memberId, @RequestParam boolean status) {
        CommunityMember member = memberService.getMemberById(memberId);
        member.setStatus(status);
        memberService.save(member);
        return "redirect:/members/" + memberId;
    }
    /**
     * Get a list of all Reviews.
     * URL: http://localhost:8080/admin/reviews/all
     *
     * @return a list of Review objects.
     */
    @GetMapping("/reviews/all")
    public Object getAllReviews(Model model) {
        List<Review> reviews = reviewService.getAllReviews();
        model.addAttribute("review", reviews);
        model.addAttribute("countReview", reviewService.getReviewCount());
        model.addAttribute("averageRating", Math.round(reviewService.getAverageRating() * 10.0) / 10.0);
        return "Sys-review";
    }
    /**
     * Delete a Review object.
     * URL: http://localhost:8080/admin/reviews/delete/{reviewId}
     *
     * @param reviewId the unique Review id.
     * @return the updated list of Review objects.
     */
    @GetMapping("/reviews/delete/{reviewId}")
    public Object deleteReview(@PathVariable int reviewId, Model model) {
        reviewService.deleteReviewById(reviewId);
        List<Review> updatedReviews = reviewService.getAllReviews();
        model.addAttribute("averageRating", Math.round(reviewService.getAverageRating() * 10.0) / 10.0);
        model.addAttribute("countReview", reviewService.getReviewCount());
        model.addAttribute("review", updatedReviews);
        return "redirect:/admin/reviews/all";
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
    public String getStats(Model model) {
        model.addAttribute("totalPets", petService.countPets());
        model.addAttribute("totalFoundPets", petService.getPetsByStatus(true).size());
        model.addAttribute("totalLostPets", petService.getPetsByStatus(false).size());
        model.addAttribute("successfulReunions", fReportService.getFReportsByStatus(true).size());
        model.addAttribute("totalReviews", reviewService.getReviewCount());
        model.addAttribute("averageRating", Math.round(reviewService.getAverageRating() * 100.0) / 100.0);
        model.addAttribute("totalUsers", memberService.countMembers() + ownerService.countOwners());
        model.addAttribute("activeOwners", ownerService.getOwnersByStatus(true).size());
        model.addAttribute("bannedOwners", ownerService.getOwnersByStatus(false).size());
        model.addAttribute("activeMembers", memberService.getMembersByStatus(true).size());
        model.addAttribute("bannedMembers", memberService.getMembersByStatus(false).size());

        return "Sys-stat";
    }
}
