package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.coderslab.entity.User;

import javax.servlet.http.HttpSession;


@Controller
public class HomeController {
    @GetMapping("/home")
    public String home(Model model, HttpSession ses){
        User user = (User)ses.getAttribute("user");
        model.addAttribute("user", user);
        return "index";
    }
}
