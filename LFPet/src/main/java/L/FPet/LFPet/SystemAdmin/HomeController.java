package L.FPet.LFPet.SystemAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }


}
