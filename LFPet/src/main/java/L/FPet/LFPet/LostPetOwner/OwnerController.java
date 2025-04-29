package L.FPet.LFPet.LostPetOwner;

import L.FPet.LFPet.FoundPetReport.FReportRepository;
import L.FPet.LFPet.LostPetReport.LReportRepository;
import L.FPet.LFPet.Review.Review;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;



/**
 * OwnerController.java.
 * Includes all REST API endpoint mappings for the LostPetOwner object.
 */
@Controller
@RequestMapping("/owners")
public class OwnerController {

    @Autowired
    private OwnerService service;
    @Autowired
    private FReportRepository rRepository;
    @Autowired
    private LReportRepository lRepository;

    /**
     * Get a list of all Owners in the database.
     * URL: http://localhost:8080/owners/all
     *
     * @return a list of LostPetOwner objects.
     */
    @GetMapping("/all")
    public Object getAllOwners() {
        return new ResponseEntity<>(service.getAllOwners(), HttpStatus.OK);
    }

    /**
     * Get a specific Owner by Id.
     * URL: http://localhost:8080/owners/{ownerId}
     *
     * @param ownerId the unique Owner id.
     * @return one LostPetOwner object.
     */
    @GetMapping("/{ownerId}")
    public Object getOneOwner(@PathVariable int ownerId) {
        return new ResponseEntity<>(service.getOwnerById(ownerId), HttpStatus.OK);
    }

    /**
     * Get a list of Owners whose username contains the given string.
     * URL: http://localhost:8080/owners/username?search=john
     *
     * @param search the search key.
     * @return a list of LostPetOwner objects matching the search key.
     */
    @GetMapping("/username")
    public Object getOwnersByUsername(@RequestParam(name = "search", defaultValue = "") String search) {
        return new ResponseEntity<>(service.getOwnersByUsername(search), HttpStatus.OK);
    }

    /**
     * Get a list of Owners based on their status.
     * URL: http://localhost:8080/owners/status/true
     *
     * @param status the status search key.
     * @return a list of LostPetOwner objects matching the status.
     */
    @GetMapping("/status/{status}")
    public Object getOwnersByStatus(@PathVariable boolean status) {
        return new ResponseEntity<>(service.getOwnersByStatus(status), HttpStatus.OK);
    }

    /**
     * Create a new Owner entry.
     * URL: http://localhost:8080/owners/new
     * Example request body:
     * {
     *        "username": "john_doe",
     *        "password": "secret",
     *         "email": "john@example.com",
     *        "imgPATH": "profile.jpg",
     *        "status": true
     *       }
     *
     * @param owner the new LostPetOwner object.
     * @return the updated list of Owner objects.
     */



    @PostMapping("/new")
    public Object addNewOwner(LostPetOwner owner) {
        service.addNewOwner(owner);
        //return new ResponseEntity<>(service.getAllOwners(), HttpStatus.CREATED);
        return "redirect:/owners/dashboard";
    }

    @GetMapping("/LoginPage")
    public String showLogInPage(Model model) {
        model.addAttribute("owner", new LostPetOwner());
        model.addAttribute("title", "Log In Owner");
        return "myloginPage";
    }

//    @GetMapping("/dashboard")
//    public String showDashboard(HttpSession session, Model model) {
//        String email = (String) session.getAttribute("loggedInEmail");
//
//        if (email == null) {
//            return "redirect:/owners/LoginPage";  // Not logged in
//        }
//
//        LostPetOwner owner = service.getOwnerByEmail(email);
//        model.addAttribute("petReports", rRepository.allReports());
//        model.addAttribute("title", "Dashboard");
//
//        return "Cus-dash";
//    }
@GetMapping("/dashboard")
public String getAllReports(HttpSession session, Model model) {
    String email = (String) session.getAttribute("loggedInEmail");
    if (email == null) {
        return "redirect:/owners/LoginPage";
    }
    model.addAttribute("petReports", lRepository.allReports());
    model.addAttribute("title", "Dashboard");
    return "Cus-dash";
}

    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        String email = (String) session.getAttribute("loggedInEmail");
        if (email == null) return "redirect:/owners/LoginPage";

        LostPetOwner owner = service.getOwnerByEmail(email);
        model.addAttribute("owner", owner);
        return "userProfile";
    }

    @PostMapping("/profile")
    public String updateProfile(@ModelAttribute LostPetOwner updatedOwner, HttpSession session) {
        String email = (String) session.getAttribute("loggedInEmail");
        if (email == null) return "redirect:/owners/LoginPage";

        LostPetOwner existingOwner = service.getOwnerByEmail(email);
        if (existingOwner == null) return "redirect:/owners/LoginPage";


        updatedOwner.setOwnerID(existingOwner.getOwnerID());
        updatedOwner.setEmail(existingOwner.getEmail());
        updatedOwner.setPassword(existingOwner.getPassword());

        service.updateOwner(updatedOwner.getOwnerID(), updatedOwner);

        return "redirect:/owners/profile";
    }




    @PostMapping("/LoginPage")
    public String LogInOwner(@RequestParam String email, @RequestParam String password, HttpSession session) {
        LostPetOwner owner = service.getOwnerByEmail(email); // Use the existing method

        if (owner != null && owner.getPassword().equals(password)) { // Assuming it's getPassword()
            session.setAttribute("loggedInEmail", email);
            return "redirect:/owners/dashboard";
        }

        return "redirect:/owners/LoginPage?error=true";
    }

    @GetMapping("/SignUp")
    public String SignInOwner(Model model) {
        model.addAttribute("owner", new LostPetOwner());
        model.addAttribute("title", "Add New Lost Pet Owner");
        return "mysignUpPage";
    }


    /**
     * Update an existing Owner object.
     * URL: http://localhost:8080/owners/update/2
     * Example request body:
     * {
     *   "ownerID": 2,
     *   "username": "john_doe_updated",
     *   "password": "newsecret",
     *   "email": "john_updated@example.com",
     *   "imgPATH": "newprofile.jpg",
     *   "status": "active"
     * }
     *
     * @param ownerId the unique Owner id.
     * @param owner   the updated LostPetOwner details.
     * @return the updated LostPetOwner object.
     */
//    @PutMapping("/update/{ownerId}")
//    public Object updateOwner(@PathVariable int ownerId, @RequestBody LostPetOwner owner) {
//        service.updateOwner(ownerId, owner);
//        return new ResponseEntity<>(service.getOwnerById(ownerId), HttpStatus.CREATED);
//    }

    /**
     * Delete an Owner object.
     * URL: http://localhost:8080/owners/delete/2
     *
     * @param ownerId the unique Owner id.
     * @return the updated list of Owner objects.
     */
    @DeleteMapping("/delete/{ownerId}")
    public Object deleteOwnerById(@PathVariable int ownerId) {
        service.deleteOwnerById(ownerId);
        return new ResponseEntity<>(service.getAllOwners(), HttpStatus.OK);
    }
}
