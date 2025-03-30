package L.FPet.LFPet.CommunityMember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * MemberController.java.
 * Includes all REST API endpoint mappings for the CommunityMember object.
 */
@RestController
@RequestMapping("/members")
public class MemberController {

    @Autowired
    private MemberService service;

    /**
     * Get a list of all CommunityMembers in the database.
     * URL: http://localhost:8080/members/all
     *
     * @return a list of CommunityMember objects.
     */
    @GetMapping("/all")
    public Object getAllMembers() {
        return new ResponseEntity<>(service.getAllMembers(), HttpStatus.OK);
    }

    /**
     * Get a specific CommunityMember by Id.
     * URL: http://localhost:8080/members/{memberId}
     *
     * @param memberId the unique member id.
     * @return one CommunityMember object.
     */
    @GetMapping("/{memberId}")
    public Object getOneMember(@PathVariable int memberId) {
        return new ResponseEntity<>(service.getMemberById(memberId), HttpStatus.OK);
    }

    /**
     * Get a list of CommunityMembers whose username contains the given string.
     * URL: http://localhost:8080/members/username?search=john
     *
     * @param search the search key.
     * @return a list of CommunityMember objects matching the search key.
     */
    @GetMapping("/username")
    public Object getMembersByUsername(@RequestParam(name = "search", defaultValue = "") String search) {
        return new ResponseEntity<>(service.getMembersByUsername(search), HttpStatus.OK);
    }

    /**
     * Get a list of CommunityMembers based on their status.
     * URL: http://localhost:8080/members/status/true
     *
     * @param status the status to search for.
     * @return a list of CommunityMember objects matching the status.
     */
    @GetMapping("/status/{status}")
    public Object getMembersByStatus(@PathVariable boolean status) {
        return new ResponseEntity<>(service.getMembersByStatus(status), HttpStatus.OK);
    }

    /**
     * Create a new CommunityMember entry.
     * URL: http://localhost:8080/members/new
     * Example request body:
     * {
     *   "username": "jane_doe",
     *   "password": "secret",
     *   "email": "jane@example.com",
     *   "imgPATH": "profile.jpg",
     *   "status": true
     * }
     *
     * @param member the new CommunityMember object.
     * @return the updated list of CommunityMember objects.
     */
    @PostMapping("/new")
    public Object addNewMember(@RequestBody CommunityMember member) {
        service.addNewMember(member);
        return new ResponseEntity<>(service.getAllMembers(), HttpStatus.CREATED);
    }

    /**
     * Update an existing CommunityMember object.
     * URL: http://localhost:8080/members/update/2
     * Example request body:
     * {
     *   "memberID": 2,
     *   "username": "jane_doe_updated",
     *   "password": "newsecret",
     *   "email": "jane_updated@example.com",
     *   "imgPATH": "newprofile.jpg",
     *   "status": true
     * }
     *
     * @param memberId the unique CommunityMember id.
     * @param member   the updated CommunityMember details.
     * @return the updated CommunityMember object.
     */
    @PutMapping("/update/{memberId}")
    public Object updateMember(@PathVariable int memberId, @RequestBody CommunityMember member) {
        service.updateMember(memberId, member);
        return new ResponseEntity<>(service.getMemberById(memberId), HttpStatus.CREATED);
    }

    /**
     * Delete a CommunityMember object.
     * URL: http://localhost:8080/members/delete/2
     *
     * @param memberId the unique CommunityMember id.
     * @return the updated list of CommunityMember objects.
     */
    @DeleteMapping("/delete/{memberId}")
    public Object deleteMemberById(@PathVariable int memberId) {
        service.deleteMemberById(memberId);
        return new ResponseEntity<>(service.getAllMembers(), HttpStatus.OK);
    }
}
