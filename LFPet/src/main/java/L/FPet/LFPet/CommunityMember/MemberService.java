package L.FPet.LFPet.CommunityMember;

import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    /**
     * Fetch all CommunityMember records.
     *
     * @return a list of CommunityMember objects.
     */
    public List<CommunityMember> getAllMembers() {
        return memberRepository.findAll();
    }

    /**
     * Fetch a specific CommunityMember by their ID.
     *
     * @param memberId the unique ID of the member.
     * @return a CommunityMember object.
     */
    public CommunityMember getMemberById(int memberId) {
        return memberRepository.findById(memberId).orElse(null);
    }

    /**
     * Fetch members by username.
     *
     * @param username the username to search for.
     * @return a list of matching CommunityMember objects.
     */
    public List<CommunityMember> getMembersByUsername(String username) {
        return memberRepository.getMembersByUsername(username);
    }

    /**
     * Fetch a member by their email.
     *
     * @param email the email address.
     * @return the CommunityMember object.
     */
    public CommunityMember getMemberByEmail(String email) {
        return memberRepository.getMembersByEmail(email);
    }

    /**
     * Fetch members by status.
     *
     * @param status the status to search for.
     * @return a list of matching CommunityMember objects.
     */
    public List<CommunityMember> getMembersByStatus(boolean status) {
        return memberRepository.getMembersByStatus(status);
    }

    /**
     * Add a new member to the database.
     *
     * @param member the new CommunityMember to add.
     */
    public void addNewMember(CommunityMember member) {
        memberRepository.save(member);
    }

    /**
     * Update an existing member.
     *
     * @param memberId the unique ID of the member to update.
     * @param member   the updated CommunityMember object.
     */

    public void updateMember(int memberId, CommunityMember member) {
        CommunityMember existing = getMemberById(memberId);

            existing.setUsername(member.getUsername());
            existing.setPassword(member.getPassword());
            existing.setEmail(member.getEmail());
            existing.setImgPATH(member.getImgPATH());
            existing.setStatus(member.getStatus());
            memberRepository.save(existing);
    }

    public void save(CommunityMember member) {
        memberRepository.save(member);
    }
    /**
     * Count the total number of CommunityMember records.
     *
     * @return the total count of community members.
     */
    public long countMembers() {
        return memberRepository.count();
    }

    /**
     * Delete a member by their ID.
     *
     * @param memberId the unique ID of the member.
     */
    public void deleteMemberById(int memberId) {
        memberRepository.deleteById(memberId);
    }

    /**
     * Search for members whose username contains a given substring.
     *
     * @param search the search term.
     * @return a list of matching CommunityMember objects.
     */
    public List<CommunityMember> searchMembersByUsername(String search) {
        return memberRepository.searchByUsernameContains(search);
    }
}
