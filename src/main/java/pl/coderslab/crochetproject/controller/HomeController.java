package pl.coderslab.crochetproject.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.crochetproject.service.CategoryService;
import pl.coderslab.crochetproject.service.PatternService;
import pl.coderslab.crochetproject.service.UserService;

@Controller
@AllArgsConstructor
public class HomeController {
    private final PatternService patternService;
    private final CategoryService categoryService;
    private final UserService userService;

    @GetMapping("/home")
    public String showHomePage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("difficulties", patternService.getAllDifficulties());
        model.addAttribute("yarns", patternService.getAllYarns());
        return "home_form";
    }

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "login";
    }

    @GetMapping("/signup")
    public String showSignupPage(Model model) {
        return "signup";
    }

    @PostMapping("/signup")
    public String signUpUser(@RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String confirmPassword,
                             Model model, HttpSession session) {
        if (password.length() < 5) {
            model.addAttribute("errorMessage", "Password must be at least 5 characters long");
            return "signup";
        }
        if (!password.equals(confirmPassword)) {
            model.addAttribute("errorMessage", "Passwords do not match!");
            return "signup";
        }
        if (userService.existsByUsername(username)) {
            model.addAttribute("errorMessage", "Username already exists! Please choose a different name");
            return "signup";
        }
        userService.addUser(username, password);
        session.setAttribute("userId", userService.findUserIdByUsernameAndPassword(username, password));
        return "redirect:/home";
    }
}
