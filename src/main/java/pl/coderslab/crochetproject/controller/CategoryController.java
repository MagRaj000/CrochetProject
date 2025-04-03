package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import pl.coderslab.crochetproject.service.CategoryService;
import pl.coderslab.crochetproject.model.crochet.Category;

import java.util.List;

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

//    @GetMapping("/all")
//    public List<Category> getAllCategories() {
//        return categoryService.getAllCategories();
//    }

//    @GetMapping("/{categoryId}/patterns")
//    @ResponseBody
//    public String getPatternsByCategoryId(@PathVariable Long categoryId, Model model) {
//        model.addAttribute("patterns", categoryService.getPatternsByCategoryId(categoryId));
//        model.addAttribute("title", "Patterns for Selected Category");
//        model.addAttribute("allCategories", categoryService.getAllCategories()); // Ensure categories are available
//        return "home";
//    }

//    @GetMapping("/{categoryId}/patterns")
//    public List<PatternListDTO> getPatternsByCategoryId(@PathVariable Long categoryId) {
//        return categoryService.getPatternsByCategoryId(categoryId);
//    }
}
