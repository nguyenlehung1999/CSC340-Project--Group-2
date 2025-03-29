package L.FPet.LFPet.Pet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * PetService.java
 * Centralizes data access to the Pet Database.
 */
@Service
public class PetService {

    @Autowired
    private PetRepository petRepository;

    /**
     * Fetch all Pets.
     *
     * @return the list of all Pets.
     */
    public List<Pet> getAllPets() {
        return petRepository.findAll();
    }

    /**
     * Fetch a unique Pet.
     *
     * @param petId the unique Pet id.
     * @return a unique Pet object.
     */
    public Pet getPetById(int petId) {
        return petRepository.findById(petId).orElse(null);
    }

    /**
     * Fetch all Pets by breed.
     *
     * @param breed the breed to search for.
     * @return the list of matching Pets.
     */
    public List<Pet> getPetsByBreed(String breed) {
        return petRepository.getPetsByBreed(breed);
    }

    /**
     * Fetch all Pets by status.
     *
     * @param status the status (e.g., "lost", "found") to search for.
     * @return the list of matching Pets.
     */
    public List<Pet> getPetsByStatus(boolean status) {
        return petRepository.getPetsByStatus(status);
    }

    //List pet by species
    public List<Pet> getPetsBySpecies(String spec) {
        return petRepository.getPetsBySpecies(spec);
    }
    //List pet by partial name
    public List<Pet> getPetsByName(String name) {
        return petRepository.getPetsByName(name);
    }
    /**
     * Add a new Pet to the database.
     *
     * @param pet the new Pet to add.
     */
    public void addNewPet(Pet pet) {
        petRepository.save(pet);
    }

    /**
     * Update an existing Pet.
     *
     * @param petId the unique Pet id.
     * @param pet   the new Pet details.
     */
    public void updatePet(int petId, Pet pet) {
        Pet existing = getPetById(petId);
        existing.setName(pet.getName());
        existing.setBreed(pet.getBreed());
        existing.setDescription(pet.getDescription());
        existing.setAge(pet.getAge());
        existing.setStatus(pet.getStatus());
        existing.setImgPath(pet.getImgPath());

        petRepository.save(existing);
    }

    /**
     * Delete a unique Pet.
     *
     * @param petId the unique Pet id.
     */
    public void deletePetById(int petId) {
        petRepository.deleteById(petId);
    }


}