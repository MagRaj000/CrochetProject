package pl.coderslab.crochetproject.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.exceptions.ResourceNotFoundException;
import pl.coderslab.crochetproject.model.users.Note;
import pl.coderslab.crochetproject.model.users.UserData;
import pl.coderslab.crochetproject.repository.NoteRepository;
import pl.coderslab.crochetproject.repository.UserDataRepository;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class NoteService {
    private final NoteRepository noteRepository;
    private final UserDataRepository userDataRepository;

    public List<Note> getAllNotesForPatternByUser(long userDataId) {
        List<Note> notes = noteRepository.findByUserDataId(userDataId);
        if (notes.isEmpty()) {
            throw new ResourceNotFoundException("Notes for UserData with id " + userDataId + " not found");
        }
        return notes;
    }

    public String addNoteToPattern(Long userDataId, String content) {
        UserData userData = userDataRepository
                .findById(userDataId)
                .orElseThrow(() -> new ResourceNotFoundException("UserData with id " + userDataId + " not found"));
        Note note = new Note();
        note.setContent(content);
        note.setUserData(userData);
        noteRepository.save(note);
        return "Note added for user id " + userData.getUser().getId() + " and pattern id " + userData.getPattern().getId();
    }

    public String updateNote(Long noteId, String content) {
        Note note = noteRepository.
                findById(noteId)
                .orElseThrow(() -> new ResourceNotFoundException("Note with id " + noteId + " not found"));
        note.setContent(content);
        noteRepository.save(note);
        return "Note updated";
    }

    public String deleteNote(Long noteId) {
        Optional<Note> note = noteRepository.findById(noteId);
        if (note.isEmpty()) {
            throw new ResourceNotFoundException("Note with id " + noteId + " not found");
        }
        noteRepository.deleteById(noteId);
        return "Note deleted";
    }

}
