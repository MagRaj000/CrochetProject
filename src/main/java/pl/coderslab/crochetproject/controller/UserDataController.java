package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.UserLibraryDTO;
import pl.coderslab.crochetproject.service.UserDataService;

import java.util.List;

@RestController
@RequestMapping("/userdata")
@AllArgsConstructor
public class UserDataController {
    private final UserDataService userDataService;

    @GetMapping("/library/{id}")
    public List<UserLibraryDTO> getUserLibrary(@PathVariable Long id) {
        return userDataService.getUserLibrary(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/save")
    public String save(@RequestParam Long userId, @RequestParam Long patternId) {
        return userDataService.savePatternToLibrary(userId, patternId);
    }

    @DeleteMapping("/delete")
    public String delete(@RequestParam Long userId, @RequestParam Long patternId) {
        return userDataService.deletePatternFromLibrary(userId, patternId);
    }

    @PostMapping("/complete")
    public String toggleCompleted(@RequestParam Long userId, @RequestParam Long patternId) {
        return userDataService.toggleCompleted(userId, patternId);
    }

    @GetMapping("/progress/{userId}/{patternId}")
    public boolean[] getProgress(@PathVariable Long userId, @PathVariable Long patternId) {
        return userDataService.getProgress(userId, patternId);
    }

    @PostMapping("/progress/{userId}/{patternId}")
    public String updateProgress(@PathVariable Long userId, @PathVariable Long patternId, @RequestParam int stepIndex) {
        return userDataService.updateProgress(userId, patternId, stepIndex);
    }
}
