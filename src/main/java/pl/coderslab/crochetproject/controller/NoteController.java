package pl.coderslab.crochetproject.controller;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.crochetproject.dto.NoteDTO;
import pl.coderslab.crochetproject.model.users.Note;
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
        if (notes.isEmpty()) {
            return "redirect:/notes/add/userDataId=" + userDataId;
        }
        return "show_notes";
    }

    @GetMapping("/add")
    public String showAddNoteForm(@RequestParam Long userDataId, Model model) {
        model.addAttribute("userDataId", userDataId);
        model.addAttribute("note", new Note());
        return "add_note";
    }

    @PostMapping("/add")
    public String addNoteToPattern(@RequestParam Long userDataId, @RequestParam String content) {
        noteService.addNoteToPattern(userDataId, content);
        return "redirect:/notes/" + userDataId;
    }

    @GetMapping("/update")
    public String showUpdateNoteForm(@RequestParam Long noteId, Model model) {
        NoteDTO noteDTO = noteService.getNoteById(noteId);
        model.addAttribute("note", noteDTO);
        return "update_note";
    }

    @PostMapping("/update")
    public String updateNoteContent(@RequestParam Long noteId, @RequestParam String content) {
        noteService.updateNote(noteId, content);
        Long userDataId = noteService.getUserDataIdByNoteId(noteId);
        return "redirect:/notes/" + userDataId;
    }

    @DeleteMapping("/delete")
    public String deleteNote(@RequestParam Long noteId) {
        return noteService.deleteNote(noteId);
    }

}
