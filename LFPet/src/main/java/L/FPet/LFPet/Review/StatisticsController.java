package com.example.LostPetFinder;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

    @Autowired
    private CommunityMemberService memberService;

    @Autowired
    private ReviewService reviewService;

    @GetMapping
    public String showReviewStats(HttpSession session, Model model) {
        String email = (String) session.getAttribute("loggedInEmail");
        if (email == null) return "redirect:/communitymember/LoginPage";

        CommunityMember member = memberService.getEmail(email);
        if (member == null) return "redirect:/communitymember/LoginPage";

        Map<Integer, Long> ratingCount = reviewService.getStarCounts();
        long total = ratingCount.values().stream().mapToLong(Long::longValue).sum();
        double average = reviewService.getAverageRating();

        Map<Integer, Double> ratingPercent = new HashMap<>();
        for (int i = 1; i <= 5; i++) {
            ratingPercent.put(i, total == 0 ? 0.0 : (ratingCount.getOrDefault(i, 0L) * 100.0 / total));
        }

        model.addAttribute("avgRating", average);

        model.addAttribute("totalRatings", total);
        model.addAttribute("ratingPercent", ratingPercent);
        model.addAttribute("member", member);
        model.addAttribute("petsHelped", member.getPetsHelped());

        return "statistics";
    }
}
