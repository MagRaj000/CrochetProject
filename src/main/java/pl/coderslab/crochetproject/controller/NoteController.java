package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.NoteDTO;
import pl.coderslab.crochetproject.model.users.Note;
import pl.coderslab.crochetproject.service.NoteService;

import java.util.List;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/notes")
@AllArgsConstructor
public class NoteController {
    private final NoteService noteService;

    @GetMapping("/{userDataId}")
    public List<NoteDTO> getAllNotesForPatternByUser(@PathVariable Long userDataId) {
        return noteService.getAllNotesForPatternByUser(userDataId)
                .stream()
                .map(NoteDTO::convertToNoteDTO)
                .collect(Collectors.toList());
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

    @DeleteMapping("/delete/{noteId}")
    public String deleteNote(@PathVariable Long noteId) {
        return noteService.deleteNote(noteId);
    }

}
