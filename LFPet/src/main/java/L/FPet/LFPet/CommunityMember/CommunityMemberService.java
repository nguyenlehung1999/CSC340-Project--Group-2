package com.example.LostPetFinder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * StudentService.java
 * Centralizes data access to the Student Database.
 */
@Service
public class CommunityMemberService {

    @Autowired
    private CommunityMemberRepository communitymemberRepository;
    private ReviewRepository reviewRepository;

    /**
     * Fetch all Students.
     *
     * @return the list of all Students.
     */
    public List<CommunityMember> getAllCommunityMembers() {

        return communitymemberRepository.findAll();
    }


    public CommunityMember getEmail(String email) {
        return communitymemberRepository.findByEmail(email);
    }
    public List<Review> getReviewsByMemberId(int memberId) {
        return reviewRepository.findByMember_MemberID(memberId);
    }



    public List<CommunityMember> getimgPATH(String imgPATH) {

        return communitymemberRepository.getimgPATH(imgPATH);
    }
    //public List<CommunityMember> getMemberByStatus(boolean status) {
       // return CommunityMemberRepository.getMemberByStatus(status);
   // }

    /**
     * Fetch a unique student.
     *
     * @param memberId the unique Student id.
     * @return a unique Student object.
     */
    public CommunityMember getMemberId(int memberId) {

        return communitymemberRepository.findById(memberId).orElse(null);
    }

    /**
     * Fetch all students whose major matches the search term.
     *
     * @param username the search key.
     * @return the list of matching Students.
     */
    public List<CommunityMember> getMemberUsername(String username) {

        return communitymemberRepository.getMemberUsername(username);
    }


    /**
     * Fetch all students with a GPA above a threshold.
     *
     * @param age the threshold
     * @return the list of matching Students
     */



    /**
     * Fetch all students with a name that contains the given string.
     *
     * @param password the search name
     * @return the list of matching Students
     */
    public List<CommunityMember> getMemberPassword(String password) {

        return communitymemberRepository.getMemberPassword(password);
    }

    /**
     * Add a new Student to the database.
     *
     * @param communitymember the new Student to add.
     */
    public void addNewMember(CommunityMember communitymember) {

        communitymemberRepository.save(communitymember);
    }

    /**
     * Update an existing Student.
     *
     * @param memberId the unique Student Id.
     * @param communitymember   the new Student details.
     */
    public void updateMember(int memberId,  CommunityMember communitymember) {
        CommunityMember existing = getMemberId(memberId);
        existing.setMemberUsername(communitymember.getMemberUsername());
        existing.setMemberPassword(communitymember.getMemberPassword());
        existing.setEmail(communitymember.getEmail());

        //Technically the 4 lines above are not necessary because the save method merges by default.
        communitymemberRepository.save(existing);
    }

    /**
     * Delete a unique Student.
     *
     * @param memberId the unique Student Id.
     */
    public void deleteMemberId(int memberId) {

        communitymemberRepository.deleteById(memberId);
    }



    public void MemberLogIn(CommunityMember communitymember) {

    }


    public CommunityMember getMemberReviewId(int reviewId) {

        return communitymemberRepository.findById(reviewId).orElse(null);
    }
}
