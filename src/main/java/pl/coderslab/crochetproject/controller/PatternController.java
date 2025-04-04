package pl.coderslab.crochetproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.exceptions.ResourceNotFoundException;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.service.CategoryService;
import pl.coderslab.crochetproject.service.PatternService;

import java.util.Arrays;
import java.util.List;

@Controller
@AllArgsConstructor
public class PatternController {
    private final PatternService patternService;
    private final CategoryService categoryService;

    @GetMapping("/home")
    public String showHomePage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("difficulties", patternService.getAllDifficulties());
        model.addAttribute("yarns", patternService.getAllYarns());
        return "home_form";
    }

    @GetMapping("/patterns/all")
    public String getAllPatterns(Model model) {
        model.addAttribute("patterns", patternService.getAllPatterns());
        model.addAttribute("title", "All available patterns");
        return "home_patterns";
    }

    @GetMapping("/patterns/{id}")
    public String getPatternById(@PathVariable Long id, Model model) {
        Pattern pattern = patternService.getPatternById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Pattern with id " + id + " not found"));
        model.addAttribute("pattern", pattern);
        // split description here, as later there were problems with \n in JSP
        List<String> descriptionLines = Arrays.asList(pattern.getDescription().split("\\r?\\n"));
        model.addAttribute("descriptionLines", descriptionLines);
        return "show_pattern";
    }

    @PostMapping("/patterns/filtered")
    public String getFilteredPatterns(@RequestParam(required = false) Long categoryId,
                                                    @RequestParam(required = false) Long yarnId,
                                                    @RequestParam(required = false) String difficulty,
                                                    Model model) {
        // convert empty String to null by hand here (or the filtering does not work)
        if (difficulty.isEmpty()) difficulty = null;
        model.addAttribute("patterns", patternService.getFilteredPatterns(categoryId, yarnId, difficulty));
        model.addAttribute("title", "All matching patterns");
        return "filtered_patterns";
    }
}
