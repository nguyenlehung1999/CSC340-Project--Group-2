package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.CommunityMember.MemberService;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.LostPetOwner.OwnerService;
import L.FPet.LFPet.Review.Review;
import L.FPet.LFPet.Review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService service;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private ReviewService reviewService;

    /**
     * Get a list of all User in the database.
     * URL: http://localhost:8080/admin/allUser
     *
     * @return a list of owners and members objects.
     */
    @GetMapping("/allusers")
    public Object getAllUsers() {
        return new ResponseEntity<>(service.findAllUser(), HttpStatus.OK);
    }
    /**
            * Update the status of an owner by their ID.
            * URL: http://localhost:8080/admin//updateowner/{ownerId}
            *
            * Example request body:
            * {
            *    "status": "true"
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

        // Call the service to update the member
        service.updateMember(memberId, member);

        // Retrieve the updated member from the database
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
     * @return the updated list of Review objects, or an error message if not found.
     */
    @DeleteMapping("/reviews/delete/{reviewId}")
    public ResponseEntity<?> deleteReview(@PathVariable int reviewId) {
        Review review = reviewService.getReviewById(reviewId);
        reviewService.deleteReviewById(reviewId);
        return new ResponseEntity<>(reviewService.getAllReviews(), HttpStatus.OK);
    }
}
