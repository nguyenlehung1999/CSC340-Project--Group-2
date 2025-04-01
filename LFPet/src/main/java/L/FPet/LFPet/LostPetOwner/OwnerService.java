package L.FPet.LFPet.LostPetOwner;

import L.FPet.LFPet.Pet.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OwnerService {

    @Autowired
    private OwnerRepository ownerRepository;

    /**
     * Fetch all LostPetOwner records.
     *
     * @return a list of LostPetOwner objects.
     */
    public List<LostPetOwner> getAllOwners() {
        return ownerRepository.findAll();
    }

    /**
     * Fetch a specific owner by their ID.
     *
     * @param ownerId the unique ID of the owner.
     * @return a LostPetOwner object.
     */
    public LostPetOwner getOwnerById(int ownerId) {
        return ownerRepository.findById(ownerId).orElse(null);
    }

    /**
     * Fetch owners by username.
     *
     * @param username the username to search for.
     * @return a list of matching LostPetOwner objects.
     */
    public List<LostPetOwner> getOwnersByUsername(String username) {
        return ownerRepository.getLostPetOwnersByUsername(username);
    }

    /**
     * Fetch an owner by their email.
     *
     * @param email the email address.
     * @return the LostPetOwner object.
     */
    public LostPetOwner getOwnerByEmail(String email) {
        return ownerRepository.getLostPetOwnerByEmail(email);
    }

    /**
     * Fetch owners by status.
     *
     * @param status the status to search for.
     * @return a list of matching LostPetOwner objects.
     */
    public List<LostPetOwner> getOwnersByStatus(boolean status) {
        return ownerRepository.getLostPetOwnersByStatus(status);
    }

    /**
     * Add a new owner to the database.
     *
     * @param owner the new LostPetOwner to add.
     */
    public void addNewOwner(LostPetOwner owner) {
        ownerRepository.save(owner);
    }

    /**
     * Update an existing owner.
     *
     * @param ownerId the unique ID of the owner to update.
     * @param owner   the updated LostPetOwner object.
     */
    public void updateOwner(int ownerId, LostPetOwner owner) {
        LostPetOwner existing = getOwnerById(ownerId);
        existing.setUsername(owner.getUsername());
        existing.setPassword(owner.getPassword());
        existing.setEmail(owner.getEmail());
        existing.setStatus(owner.getStatus());
        existing.setImgPATH(owner.getImgPATH());

        ownerRepository.save(existing);
    }

    /**
     * Count the total number of LostPetOwner records.
     *
     * @return the total count of owners.
     */
    public long countOwners() {
        return ownerRepository.count();
    }

    /**
     * Delete an owner by their ID.
     *
     * @param ownerId the unique ID of the owner.
     */
    public void deleteOwnerById(int ownerId) {
        ownerRepository.deleteById(ownerId);
    }

    /**
     * Search for owners whose username contains a given substring.
     *
     * @param search the search term.
     * @return a list of matching LostPetOwner objects.
     */
    public List<LostPetOwner> searchOwnersByUsername(String search) {
        return ownerRepository.searchByUsernameContains(search);
    }
}
