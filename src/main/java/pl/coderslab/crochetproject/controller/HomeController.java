package pl.coderslab.crochetproject.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import pl.coderslab.crochetproject.service.CategoryService;
import pl.coderslab.crochetproject.service.PatternService;
import pl.coderslab.crochetproject.service.UserService;

@Controller
@AllArgsConstructor
@SessionAttributes({"userId", "username"})
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

    @PostMapping("/login")
    public String logInUser(@RequestParam String username, @RequestParam String password, Model model) {
        Long userId = userService.findUserIdByUsernameAndPassword(username, password);
        if (userId == null) {
            model.addAttribute("errorMessage", "Username or password is incorrect");
            return "login";
        }
        model.addAttribute("userId", userId);
        model.addAttribute("username", username);
        return "redirect:/home";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, SessionStatus status) {
        status.setComplete(); // clears @SessionAttributes from @ControllerAdvice
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/home";
    }

    @GetMapping("/signup")
    public String showSignupPage(Model model) {
        return "signup";
    }

    @PostMapping("/signup")
    public String signUpUser(@RequestParam String username, @RequestParam String password, @RequestParam String confirmPassword, Model model) {
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
        return "redirect:/login";
    }
}
