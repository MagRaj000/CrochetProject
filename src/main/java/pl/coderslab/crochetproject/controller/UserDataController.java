package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.UserLibraryDTO;
import pl.coderslab.crochetproject.exceptions.ResourceNotFoundException;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.service.PatternService;
import pl.coderslab.crochetproject.service.UserDataService;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userdata")
@AllArgsConstructor
public class UserDataController {
    private final UserDataService userDataService;
    private final PatternService patternService;

    @GetMapping("/progress/{userId}/{patternId}")
    public String getStepsAndProgress(@PathVariable Long userId, @PathVariable Long patternId, Model model) {
        Pattern pattern = patternService.getPatternById(patternId)
                .orElseThrow(() -> new ResourceNotFoundException("Pattern with id " + patternId + " not found"));
        boolean[] progress = userDataService.getProgress(userId, patternId);
        List<String> descriptionLines = Arrays.asList(pattern.getDescription().split("\\r?\\n"));
        model.addAttribute("pattern", pattern);
        model.addAttribute("descriptionLines", descriptionLines);
        model.addAttribute("progress", progress);
        return "progress_tracker";
    }

    @PostMapping("/progress/{userId}/{patternId}")
    public ResponseEntity<Map<String, Object>> updateProgress(@PathVariable Long userId, @PathVariable Long patternId, @RequestParam int stepIndex) {
        boolean[] updatedProgress = userDataService.updateProgress(userId, patternId, stepIndex);
        boolean stepCompleted = updatedProgress[stepIndex];

        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("completed", stepCompleted); // is the current step completed
        response.put("allCompleted", userDataService.getCompletedStatusByUserIdAndPatternId(userId, patternId));
        return ResponseEntity.ok(response);
    }

    @GetMapping("/library/{id}")
    public String getUserLibrary(@PathVariable Long id, Model model) {
        model.addAttribute("patterns", userDataService.getUserLibrary(id));
        model.addAttribute("title", "All available patterns");
        return "user_library";
    }
//
//    @ResponseStatus(HttpStatus.CREATED)
//    @PostMapping("/save")
//    public String save(@RequestParam Long userId, @RequestParam Long patternId) {
//        return userDataService.savePatternToLibrary(userId, patternId);
//    }
//
//    @DeleteMapping("/delete")
//    public String delete(@RequestParam Long userId, @RequestParam Long patternId) {
//        return userDataService.deletePatternFromLibrary(userId, patternId);
//    }
//
//    @PostMapping("/complete")
//    public String toggleCompleted(@RequestParam Long userId, @RequestParam Long patternId) {
//        return userDataService.toggleCompleted(userId, patternId);
//    }


}
