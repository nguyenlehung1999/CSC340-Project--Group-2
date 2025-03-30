package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.CommunityMember.MemberService;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.LostPetOwner.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService service;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private MemberService memberService;

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
}
