package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
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

    @PostMapping("/save")
    public String save(@RequestParam Long userId,
                     @RequestParam Long patternId) {
        return userDataService.savePatternToLibrary(userId, patternId);
    }
}
