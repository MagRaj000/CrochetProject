package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.NoteDTO;
import pl.coderslab.crochetproject.repository.UserDataRepository;
import pl.coderslab.crochetproject.service.NoteService;

import java.util.List;


@Controller
@RequestMapping("/notes")
@AllArgsConstructor
public class NoteController {
    private final NoteService noteService;
    private final UserDataRepository userDataRepository;

    @GetMapping("/{userDataId}")
    public String getAllNotesForPatternByUser(@PathVariable Long userDataId, Model model) {
        List<NoteDTO> notes = noteService.getAllNotesForPatternByUser(userDataId);
        model.addAttribute("notes", notes);
        model.addAttribute("patternName", userDataRepository.findById(userDataId).get().getPattern().getName());
        model.addAttribute("userDataId", userDataId);
        return "show_notes";
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/add")
    public String addNoteToPattern(@RequestParam Long userDataId, @RequestParam String content) {
        return noteService.addNoteToPattern(userDataId, content);
    }

    @PutMapping("/update")
    public String updateNoteContent(@RequestParam Long noteId, @RequestParam String content) {
        return noteService.updateNote(noteId, content);
    }

    @DeleteMapping("/delete")
    public String deleteNote(@RequestParam Long noteId) {
        return noteService.deleteNote(noteId);
    }

}
