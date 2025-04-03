package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import pl.coderslab.crochetproject.service.CategoryService;


@Controller
@RequestMapping("/categories")
@AllArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;

    @GetMapping("/all")
    public String getAllCategories(Model model) {
        model.addAttribute("allCategories", categoryService.getAllCategories());
        return "home_categories";
    }

    @GetMapping("/{categoryId}/patterns")
    public String getPatternsByCategoryId(@PathVariable Long categoryId, Model model) {
        model.addAttribute("patterns", categoryService.getPatternsByCategoryId(categoryId));
        model.addAttribute("title", "Patterns for category: " + categoryService.getCategoryNameFromId(categoryId));
        model.addAttribute("allCategories", categoryService.getAllCategories());
        return "category_patterns";
    }

}
