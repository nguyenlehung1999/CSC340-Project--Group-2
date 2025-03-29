package L.FPet.LFPet.Pet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * PetController.java.
 * Includes all REST API endpoint mappings for the Pet object.
 */
@RestController
@RequestMapping("/pets")
public class PetController {

    @Autowired
    private PetService service;

    /**
     * Get a list of all Pets in the database.
     * http://localhost:8080/pets/all
     *
     * @return a list of Pet objects.
     */
    @GetMapping("/all")
    public Object getAllPets() {
        return new ResponseEntity<>(service.getAllPets(), HttpStatus.OK);
    }

    /**
     * Get a specific Pet by Id.
     * http://localhost:8080/pets/2
     *
     * @param petId the unique Pet id.
     * @return one Pet object.
     */
    @GetMapping("/{petId}")
    public Object getOnePet(@PathVariable int petId) {
        return new ResponseEntity<>(service.getPetById(petId), HttpStatus.OK);
    }

    /**
     * Get a list of Pets with a name that contains the given string.
     * http://localhost:8080/pets/name?search=fluffy
     *
     * @param search the search key.
     * @return a list of Pet objects matching the search key.
     */
    @GetMapping("/name")
    public Object getPetsByName(@RequestParam(name = "search", defaultValue = "") String search) {
        return new ResponseEntity<>(service.getPetsByName(search), HttpStatus.OK);
    }

    /**
     * Get a list of Pets based on their breed.
     * http://localhost:8080/pets/breed/Golden
     *
     * @param breed the breed search key.
     * @return a list of Pet objects matching the breed.
     */
    @GetMapping("/breed/{breed}")
    public Object getPetsByBreed(@PathVariable String breed) {
        return new ResponseEntity<>(service.getPetsByBreed(breed), HttpStatus.OK);
    }
    /**
     * Get a list of Pets based on their species.
     * http://localhost:8080/pets/species/Dog
     *
     * @param spec the breed search key.
     * @return a list of Pet objects matching the breed.
     */
    @GetMapping("/species/{spec}")
    public Object getPetsBySpecies(@PathVariable String spec) {
        return new ResponseEntity<>(service.getPetsBySpecies(spec), HttpStatus.OK);
    }
    /**
     * Create a new Pet entry.
     * http://localhost:8080/pets/new
     * Example request body:
     * {
     *   "name": "Fluffy",
     *   "description": "Friendly cat",
     *   "species": "Cat",
     *   "breed": "Tabby",
     *   "age": 2,
     *   "imgPath": "someImage.jpg",
     *   "status": true
     * }
     *
     * @param pet the new Pet object.
     * @return the updated list of Pet objects.
     */
    @PostMapping("/new")
    public Object addNewPet(@RequestBody Pet pet) {
        service.addNewPet(pet);
        return new ResponseEntity<>(service.getAllPets(), HttpStatus.CREATED);
    }

    /**
     * Update an existing Pet object.
     * http://localhost:8080/pets/update/2
     * Example request body:
     * {
     *   "petID": 2,
     *   "name": "Fluffy Updated",
     *   "breed": "Golden Retriever",
     *   "age": 4,
     *   "description": "Very friendly and active"
     * }
     *
     * @param petId the unique Pet id.
     * @param pet   the updated Pet details.
     * @return the updated Pet object.
     */
    @PutMapping("/update/{petId}")
    public Object updatePet(@PathVariable int petId, @RequestBody Pet pet) {
        service.updatePet(petId, pet);
        return new ResponseEntity<>(service.getPetById(petId), HttpStatus.CREATED);
    }

    /**
     * Delete a Pet object.
     * http://localhost:8080/pets/delete/2
     *
     * @param petId the unique Pet id.
     * @return the updated list of Pet objects.
     */
    @DeleteMapping("/delete/{petId}")
    public Object deletePetById(@PathVariable int petId) {
        service.deletePetById(petId);
        return new ResponseEntity<>(service.getAllPets(), HttpStatus.OK);
    }
}