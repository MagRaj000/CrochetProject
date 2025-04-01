package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import pl.coderslab.crochetproject.dto.PatternListDTO;
import pl.coderslab.crochetproject.service.PatternService;

import java.util.List;

@RestController
@RequestMapping("/pattern")
@AllArgsConstructor
@Transactional
public class PatternController {
    private final PatternService patternService;

    @GetMapping("/all")
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
