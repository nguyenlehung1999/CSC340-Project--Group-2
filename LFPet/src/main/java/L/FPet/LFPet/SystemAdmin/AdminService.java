package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.CommunityMember.MemberRepository;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.LostPetOwner.OwnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    private OwnerRepository ownerRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private AdminRepository repository;
    /**
     * Find all users by combining owners and community members.
     *
     * @return a list of all User objects (both owners and members).
     */
    public List<Object> findAllUser() {
        List<Object> allUsers = new ArrayList<>();
        allUsers.addAll(ownerRepository.findAll());      // List<LostPetOwner>
        allUsers.addAll(memberRepository.findAll());       // List<CommunityMember>
        return allUsers;
    }

    public List<UserDTO> findAllUsersAsDTOs() {
        List<UserDTO> userDTOs = new ArrayList<>();

        for (LostPetOwner owner : ownerRepository.findAll()) {
            UserDTO dto = new UserDTO();
            dto.setId(owner.getOwnerID());
            dto.setUsername(owner.getUsername());
            dto.setEmail(owner.getEmail());
            dto.setJoindate(owner.getJoinDate());
            dto.setStatus(owner.getStatus());
            dto.setRole("owner");
            userDTOs.add(dto);
        }

        for (CommunityMember member : memberRepository.findAll()) {
            UserDTO dto = new UserDTO();
            dto.setId(member.getMemberID());
            dto.setUsername(member.getUsername());
            dto.setEmail(member.getEmail());
            dto.setJoindate(member.getJoinDate());
            dto.setStatus(member.getStatus());
            dto.setRole("member");
            userDTOs.add(dto);
        }

        userDTOs.sort(Comparator.comparing(UserDTO::getJoindate).reversed());
        return userDTOs;
    }
    /**
     * Allow admin to update status of an owner by ID
     *
     */
    public void updateOwner(int ownerId, LostPetOwner owner) {
        LostPetOwner existing = ownerRepository.findById(ownerId).orElse(null);
        if (existing != null) {
            existing.setStatus(owner.getStatus());
            ownerRepository.save(existing);
        }
    }

    /**
     * Allow admin to update status of a member by ID
     *
     */
    public void updateMember(int memberId, CommunityMember member) {
        CommunityMember existing = memberRepository.findById(memberId).orElse(null);
        if (existing != null) {
            existing.setStatus(member.getStatus());
            memberRepository.save(existing);
        }
    }


}
