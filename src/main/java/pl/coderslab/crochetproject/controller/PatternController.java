package pl.coderslab.crochetproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.PatternListDTO;
import pl.coderslab.crochetproject.service.CategoryService;
import pl.coderslab.crochetproject.service.PatternService;

import java.util.List;

@Controller
//@RequestMapping("/patterns")
@AllArgsConstructor
public class PatternController {
    private final PatternService patternService;
    private final CategoryService categoryService;

    @GetMapping("/home")
    public String showHomePage(Model model) {
        return "home1";
    }

    @GetMapping("/patterns/all")
    public String getAllPatterns(Model model) {
        model.addAttribute("patterns", patternService.getAllPatterns());
        model.addAttribute("title", "All available patterns");
        return "home_patterns";
    }

//    @GetMapping("/all")
//    @ResponseBody
//    public List<PatternListDTO> getAllPatterns() {
//        return patternService.getAllPatterns();
//    }

    @GetMapping("/filtered")
    public List<PatternListDTO> getFilteredPatterns(@RequestParam(required = false) Long categoryId,
                                                    @RequestParam(required = false) Long yarnId,
                                                    @RequestParam(required = false) String difficulty) {
        return patternService.getFilteredPatterns(categoryId, yarnId, difficulty);
    }
}
