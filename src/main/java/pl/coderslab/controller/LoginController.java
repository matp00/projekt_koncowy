package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;
import pl.coderslab.validator.RegisterValidator;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.groups.Default;

@Controller
public class LoginController {
    @Autowired
    UserService userService;
    @Autowired
    UserRepository userRepository;
    @GetMapping("/login")
    public String login(Model model){
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@Validated({Default.class}) User user, BindingResult result, HttpSession ses, Model model){
        if(result.hasErrors())return "login";
        if(!userService.checkEmail(user.getEmail(), user.getPassword())){
            model.addAttribute("invalid", true);
            return "login";
        }
        ses.setAttribute("user", userRepository.findByEmail(user.getEmail()));
        return "redirect:/";
    }

    @GetMapping("/register")
    public String register(Model model){
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Validated({RegisterValidator.class, Default.class}) User user, BindingResult result, Model model,HttpSession ses){
        if(result.hasErrors())return "register";
        if(userService.checkEmail(user.getEmail())) {
            model.addAttribute("invalidEmail", true);
            return "register";}
        if(userService.checkUsername(user.getUsername())) {
            model.addAttribute("invalidUsername", true);
            return "register"; }
        userService.addUser(user);
        ses.setAttribute("user", userRepository.findByEmail(user.getEmail()));
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id){
        model.addAttribute("user", userRepository.findById(id));
        return "edit";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Validated({Default.class}) User user, BindingResult result, Model model,HttpSession ses, @PathVariable Long id){
        if(result.hasErrors()){
           model.addAttribute("user", userRepository.findByUsername(user.getUsername()));
            return "edit";
        }
        if(userService.checkEmail(user.getEmail())) {
            model.addAttribute("invalidEmail", true);
            model.addAttribute("user", userRepository.findById(id));
            return "edit";}
        userService.addUser(user);
        ses.setAttribute("user", userRepository.findByEmail(user.getEmail()));
        return "index";
    }

    @GetMapping("/logout")
    public String logout(Model model, HttpSession ses){
        ses.setAttribute("user", null);
        return "redirect:/";
    }



}
