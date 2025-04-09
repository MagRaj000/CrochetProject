package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.crochetproject.service.CategoryService;
import pl.coderslab.crochetproject.service.PatternService;

@Controller
@AllArgsConstructor
public class HomeController {
    private final PatternService patternService;
    private final CategoryService categoryService;

    @GetMapping("/home")
    public String showHomePage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("difficulties", patternService.getAllDifficulties());
        model.addAttribute("yarns", patternService.getAllYarns());
        return "home_form";
    }

    @GetMapping("/login")
    public String showSigninPage(Model model) {
        return "login";
    }
}
