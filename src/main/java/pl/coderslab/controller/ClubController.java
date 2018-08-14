package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Club;
import pl.coderslab.entity.User;
import pl.coderslab.repository.ClubRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ClubController {
    @Autowired
    ClubRepository clubRepository;


    @GetMapping("/dance")
    public String dance(Model model, HttpSession ses){
        model.addAttribute("clubs" , clubRepository.findAllByType("dance"));
        model.addAttribute("user",ses.getAttribute("user"));
        return "main";
    }

    @GetMapping("/dance/get")
    @ResponseBody
    public List<Club> getDance(){
        List<Club> clubs = clubRepository.findValidatedByType("dance");
        return clubs;
    }

    @GetMapping("/salsa/get")
    @ResponseBody
    public List<Club> getSalsa(){
        List<Club> clubs = clubRepository.findValidatedByType("salsa");
        return clubs;
    }

    @GetMapping("/sport/get")
    @ResponseBody
    public List<Club> getSport(){
        List<Club> clubs = clubRepository.findValidatedByType("sport");
        return clubs;
    }

    @GetMapping("/salsa")
    public String salsa(Model model, HttpSession ses){
        model.addAttribute("clubs" , clubRepository.findAllByType("salsa"));
        model.addAttribute("user",ses.getAttribute("user"));
        return "salsa";
    }

    @GetMapping("/sport")
    public String sport(Model model, HttpSession ses){
        model.addAttribute("clubs" , clubRepository.findAllByType("sport"));
        model.addAttribute("user",ses.getAttribute("user"));
        return "sport";
    }
    @GetMapping("/add")
    public String add(Model model, HttpSession ses){
        model.addAttribute("club",new Club());
        model.addAttribute("user", ses.getAttribute("user"));
        return "add";
    }
    @PostMapping("/add")
    public String add(@Valid Club club, BindingResult result){
        if(result.hasErrors()) return "add";
        club.setRating(0.0);
        clubRepository.save(club);
        return "redirect:/";
    }

    @GetMapping("/validate/{id}")
    public String validate(Model model, HttpSession ses, @PathVariable Long id){
        model.addAttribute("club",clubRepository.findOne(id));
        //model.addAttribute("user", ses.getAttribute("user"));
        return "validate";
    }
    @PostMapping("/validate/{id}")
    public String validate(@Valid Club club, BindingResult result){
        if(result.hasErrors()) return "validate";
        club.setValidated(true);
        clubRepository.save(club);
        return "redirect:/";
    }

}
