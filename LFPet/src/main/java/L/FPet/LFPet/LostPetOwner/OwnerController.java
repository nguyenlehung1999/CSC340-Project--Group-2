package L.FPet.LFPet.LostPetOwner;

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
    public Object getOneOwner(@PathVariable int ownerId, Model model) {
        model.addAttribute("user", service.getOwnerById(ownerId));

        model.addAttribute("role", "Owner");
        return "Sys-detailedProfile";
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
    public Object addNewOwner(@RequestBody LostPetOwner owner) {
        service.addNewOwner(owner);
        return new ResponseEntity<>(service.getAllOwners(), HttpStatus.CREATED);
    }

    /**
     * Update an existing Owner object.
     * URL: http://localhost:8080/owners/update/2
     * Example request body:
     * {
     *   "username": "john_doe_updated",
     *   "password": "newsecret",
     *   "email": "john_updated@example.com",
     *   "imgPATH": "newprofile.jpg",
     *   "status": true
     * }
     *
     * @param ownerId the unique Owner id.
     * @param owner   the updated LostPetOwner details.
     * @return the updated LostPetOwner object.
     */
    @PutMapping("/update/{ownerId}")
    public Object updateOwner(@PathVariable int ownerId, @RequestBody LostPetOwner owner) {
        service.updateOwner(ownerId, owner);
        return new ResponseEntity<>(service.getOwnerById(ownerId), HttpStatus.CREATED);
    }

    /**
     * Delete an Owner object.
     * URL: http://localhost:8080/owners/delete/2
     *
     * @param ownerId the unique Owner id.
     * @return the updated list of Owner objects.
     */
    @GetMapping("/delete/{ownerId}")
    public Object deleteOwnerById(@PathVariable int ownerId) {
        service.deleteOwnerById(ownerId);
        return "redirect:/admin/allusers";
    }
}
