package pl.coderslab.crochetproject.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;

@ControllerAdvice
public class GlobalControllerAdvice {

    @ModelAttribute
    public void addAttributes(Model model, HttpServletRequest request) {
        // get userId from session
        HttpSession session = request.getSession(false);
        Long userId = session != null ? (Long) session.getAttribute("userId") : null;
        String username = session != null ?  (String) session.getAttribute("username") : null;
        // add attributes to every model
        model.addAttribute("userId", userId);
        model.addAttribute("username", username);
        model.addAttribute("isLoggedIn", userId != null && userId > 0);
    }
}
