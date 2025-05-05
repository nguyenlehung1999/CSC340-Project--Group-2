package com.example.LostPetFinder;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
     * StudentController.java.
     * Includes all REST API endpoint mappings for the Student object.
     */
    @Controller
    @RequestMapping("/communitymember")
    public class CommunityMemberController {

        @Autowired
        private CommunityMemberService service;
        @Autowired
        private ReviewService reviewService;
        @Autowired
        private PetService petService;
        @Autowired
        private FReportService fReportService;

    /**
         * Get a list of all Students in the database.
         * http://localhost:8080/students/all
         *
         * @return a list of Students  objects.
         */

        //@GetMapping("/all")
       // public Object getAllCommunityMembers(Model model) {
            // return new ResponseEntity<>(service.getAllStudents(), HttpStatus.OK);
           // model.addAttribute("member", service.getAllCommunityMembers());
          //  model.addAttribute("title", "All Members");
           // return "PetFinder-memberinfo";

       // }

    @GetMapping("/Dashboard")
        public String getDashboard(HttpSession session, Model model) {
            String email = (String) session.getAttribute("loggedInEmail");

            if (email == null) {
                System.out.println("No email found in session.");
                return "redirect:/communitymember/LoginPage";
            }

            CommunityMember member = service.getEmail(email);

            if (member == null) {
                System.out.println("No member found for email: " + email);
                return "redirect:/communitymember/LoginPage";
            }



        model.addAttribute("member", member);
            model.addAttribute("title", "Welcome, " + member.getMemberUsername());
            return "Petfinder-dashboard";
        }




    @GetMapping("/memberImg/{memberImg}")
        public Object getMemberImg(@PathVariable String memberImg, Model model) {
            model.addAttribute("member", service.getimgPATH(memberImg));
            model.addAttribute("title", "Member Img: " + memberImg);
            return "PetFinder-memberinfo";
        }
       // @GetMapping("/status/{status}")
       // public Object getMemberByStatus(@PathVariable boolean status) {
         //   return new ResponseEntity<>(service.getMemberByStatus(status), HttpStatus.OK);
       // }


        /**
         * Get a specific Student by Id.
         * http://localhost:8080/students/2
         *
         * @param memberId the unique Id for a Student.
         * @return One Student object.
         */

        @GetMapping("/memberId/{memberId}")
        public String getOneMember(@PathVariable int memberId, Model model) {
            model.addAttribute("member", service.getMemberId(memberId));
            model.addAttribute("title", "Member #: " + memberId);
            return "PetFinder-memberinfo";
        }



        /**
         * Get a list of students with a name that contains the given string.
         * http://localhost:8080/students/name?search=alex
         *
         * @param username the search key
         * @return list of Student objects matching the search key.
         */

        @GetMapping("/username")
        public String getUsername(@RequestParam String username, Model model) {
            model.addAttribute("member", service.getMemberUsername(username));
            model.addAttribute("title", "Username: " + username);
            return "PetFinder-memberinfo";
        }

        /**
         * Get a list of Students based on their major.
         * http://localhost:8080/students/major/csc
         *
         * @param password the search key.
         * @return A list of Student objects matching the search key.
         */

        @GetMapping("/password")
        public String getMemberPassword(@RequestParam String password, Model model) {
            model.addAttribute("member", service.getMemberPassword(password));
            model.addAttribute("title", "Password match");
            return "PetFinder-memberinfo";
        }


        /**
         * Get a list of students with a GPA above a threshold.
         * http://localhost:8080/students/honors?gpa=3.6
         *
         * @param email the minimum GPA
         * @return list of Student objects matching the search key.
         */

        @GetMapping("/email")
        public String getMemberEmail(@RequestParam String email, Model model) {
            model.addAttribute("member", service.getEmail(email));
            model.addAttribute("title", "Email: " + email);
            return "PetFinder-memberinfo";
        }

        /**
         *  {
         *     "imgPATH": "string",
         *     "joinDate": "2025-03-18T15:20:20",
         *     "memberPassword": "venegas",
         *     "memberUsername": "bairds",
         *     "memberEmail": "r_venegas778@uncg.edu",
         *     "memberByStatus": true
         * }
         * Create a new Student entry.
         * http://localhost:8080/students/new --data '{  "name": "sample new student", "major": "csc", "gpa": 3.55}'
         *
         * @param communitymember the new Student object.
         * @return the updated list of Students.
         */


        @PostMapping("/new")
        public String addNewMember(CommunityMember communitymember, HttpSession session) {
            service.addNewMember(communitymember);
            session.setAttribute("loggedInEmail", communitymember.getEmail());
            return "redirect:/communitymember/Dashboard";
        }


        @GetMapping("/new")
        public String showCreateForm(Model model) {
            model.addAttribute("member", new CommunityMember());
            model.addAttribute("title", "Add New CommunityMember");
            return "PetFinder-SignUppage";
        }


    @GetMapping("/Reviews")
    public String showMemberReviews(HttpSession session, Model model) {
        String email = (String) session.getAttribute("loggedInEmail");
        System.out.println("Logged-in email: " + email);

        if (email == null) return "redirect:/communitymember/LoginPage";

        CommunityMember member = service.getEmail(email);
        if (member == null) {
            System.out.println("No member found for email: " + email);
            return "redirect:/communitymember/LoginPage";
        }

        System.out.println("Member ID: " + member.getMemberID());

        List<Review> reviews = reviewService.getReviewsByMemberId(member.getMemberID());
        System.out.println("Review count: " + reviews.size());

        for (Review r : reviews) {
            System.out.println("Review: " + r.getReviewText());
        }

        model.addAttribute("member", member);
        model.addAttribute("reviews", reviews);
        model.addAttribute("title", "Your Reviews");

        return "Pet-Finder-reviews";

    }
    @PostMapping("/reply/{reviewId}")
    public String replyToReview(@PathVariable int reviewId,
                                @RequestParam("replyText") String replyText,
                                HttpSession session) {
        String email = (String) session.getAttribute("loggedInEmail");
        if (email == null) return "redirect:/communitymember/LoginPage";

        Review review = reviewService.getReviewById(reviewId);
        if (review != null) {
            review.setReplyText(replyText);
            reviewService.addNewReview(review);  // save updated review
        }

        return "redirect:/communitymember/Reviews";
    }





    @GetMapping("/Statistics")
    public String showReviewStats(HttpSession session, Model model) {
        String email = (String) session.getAttribute("loggedInEmail");
        CommunityMember member = service.getEmail(email);

        Map<Integer, Long> ratingCount = reviewService.getStarCounts();
        long total = ratingCount.values().stream().mapToLong(Long::longValue).sum();
        double average = reviewService.getAverageRating();


        Map<String, Double> ratingPercent = new HashMap<>();
        for (int i = 1; i <= 5; i++) {
            String key = String.valueOf(i);
            double percent = total == 0 ? 0.0 : (ratingCount.getOrDefault(i, 0L) * 100.0 / total);
            ratingPercent.put(key, percent);
        }

        model.addAttribute("avgRating", average);
        model.addAttribute("totalRatings", total);
        model.addAttribute("ratingPercent", ratingPercent);
        model.addAttribute("member", member);
        model.addAttribute("petsHelped", member.getPetsHelped());

        return "Petfinder-statistics";
    }

    @GetMapping("/LoginPage")
    public String showLogInPage(Model model) {
        model.addAttribute("member", new CommunityMember());
        model.addAttribute("title", "Log In Member");
        return "PetFinder-loginpage";
    }




    @PostMapping("/LoginPage")
    public String LogInMember(@RequestParam String email, @RequestParam String password, HttpSession session) {
        CommunityMember member = service.getEmail(email);

        if (member != null && member.getMemberPassword().equals(password)) {
            session.setAttribute("loggedInEmail", email);
            return "redirect:/communitymember/Dashboard";
        }

        return "redirect:/communitymember/LoginPage?error=true";
    }

    @GetMapping("/Profile")
    public String FindMemberEmail(HttpSession session, Model model) {
        String email = (String) session.getAttribute("loggedInEmail");

        if (email == null) {
            return "redirect:/communitymember/LoginPage";
        }

        CommunityMember member = service.getEmail(email);
        model.addAttribute("member", member);
        model.addAttribute("title", "Email: " + email);
        return "PetFinder-memberinfo";
    }

    @GetMapping("/FoundPet")
    public String showFoundPetForm(Model model) {
        model.addAttribute("pet", new Pet());
        return "report-found-pet";
    }
    @PostMapping("/FoundPet")
    public String submitFoundPet(@ModelAttribute Pet pet, HttpSession session) {
        String email = (String) session.getAttribute("loggedInEmail");
        if (email == null) return "redirect:/communitymember/LoginPage";

        CommunityMember member = service.getEmail(email);
        if (member == null) return "redirect:/communitymember/LoginPage";

        // Step 1: Save the new pet
        pet.setMember(member);
        pet.setStatus(true); // mark as found
        petService.addNewPet(pet);

        // Step 2: Create and save the FoundPetReport
        FoundPetReport report = new FoundPetReport();
        report.setPet(pet);
        report.setMember(member);
        report.setCreatedAT(LocalDateTime.now());
        report.setFoundDate(LocalDateTime.now()); // or manually entered via form later
        report.setFoundLocation(pet.getFoundLocation()); // assume pet has this field
        report.setDescription(pet.getDescription());
        report.setStatus(true);

        fReportService.addNewReport(report); // save the report

        return "redirect:/communitymember/Dashboard"; // show reported pets
    }






    @GetMapping("/statistics/{memberId}")
        public Object viewMemberStatistics(@PathVariable int memberId, Model model) {
            model.addAttribute("member", service.getMemberId(memberId));
            model.addAttribute("title", "Member Statistics");
            return "Petfinder-statistics";
        }
        @GetMapping("/Reviews/{reviewId}")
        public Object viewMemberReviews(@PathVariable int reviewId, Model model) {
            model.addAttribute("member", service.getMemberReviewId(reviewId));
            model.addAttribute("title", "Member Reviews");
            return "Pet-Finder-reviews";
        }




    /**
         * Update an existing Student object.
         * http://localhost:8080/students/update/2 --data '{ "studentId": 1, "name": "sampleUpdated", "major": "csc", "gpa": 3.92}'
         *
         * @param memberId the unique Student Id.
         * @param communitymember  the new update Student details.
         * @return the updated Student object.
         */

        @PostMapping("/update/{memberId}")
        public Object updateMember(@PathVariable int memberId, @ModelAttribute CommunityMember communitymember)
        {
            service.updateMember(memberId, communitymember);
            //return new ResponseEntity<>(service.getStudentById(studentId), HttpStatus.CREATED);
            return "redirect:/communitymember/Dashboard";


        }
    @GetMapping("/update/{memberId}")
    public String showUpdateForm(@PathVariable int memberId, Model model) {
        CommunityMember member = service.getMemberId(memberId);

        if (member == null) {
            System.out.println("Member not found for ID: " + memberId);
            return "redirect:/communitymember/Dashboard";
        }

        model.addAttribute("member", member);
        model.addAttribute("memberId", memberId);
        return "member-update";
    }






    /**
         * Delete a Student object.
         * http://localhost:8080/students/delete/2
         *
         * @param memberId the unique Student Id.
         * @return the updated list of Students.
         */

        @GetMapping("/delete/{memberId}")
        public Object deleteMemberById(@PathVariable int memberId) {
            service.deleteMemberId(memberId);
            // return new ResponseEntity<>(service.getAllStudents(), HttpStatus.OK);
            return "redirect:/communitymember/Dashboard";
        }

    }


