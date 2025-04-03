package pl.coderslab.crochetproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.PatternListDTO;
import pl.coderslab.crochetproject.service.PatternService;

import java.util.List;

@Controller
@RequestMapping("/patterns")
@AllArgsConstructor
//@Transactional
public class PatternController {
    private final PatternService patternService;

    @GetMapping("/try")
    public String getPatterns(Model model) {
        model.addAttribute("patterns", patternService.getAllPatterns());
        return "patterns"; // This refers to the patterns.jsp view
    }

    @GetMapping("/all")
    @ResponseBody
    public List<PatternListDTO> getAllPatterns() {
        return patternService.getAllPatterns();
    }

    @GetMapping("/filtered")
    public List<PatternListDTO> getFilteredPatterns(@RequestParam(required = false) Long categoryId,
                                                    @RequestParam(required = false) Long yarnId,
                                                    @RequestParam(required = false) String difficulty) {
        return patternService.getFilteredPatterns(categoryId, yarnId, difficulty);
    }
}
