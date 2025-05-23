package pl.coderslab.crochetproject.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.dto.NoteDTO;
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

    public List<NoteDTO> getAllNotesForPatternByUser(long userDataId) {
        List<Note> notes = noteRepository.findByUserDataId(userDataId);
        return notes.stream()
                .map(NoteDTO::convertToNoteDTO)
                .toList();
    }

    public void addNoteToPattern(Long userDataId, String content) {
        UserData userData = userDataRepository
                .findById(userDataId)
                .orElseThrow(() -> new ResourceNotFoundException("UserData with id " + userDataId + " not found"));
        Note note = new Note();
        note.setContent(content);
        note.setUserData(userData);
        noteRepository.save(note);
    }

    public void updateNote(Long noteId, String content) {
        Note note = noteRepository.
                findById(noteId)
                .orElseThrow(() -> new ResourceNotFoundException("Note with id " + noteId + " not found"));
        note.setContent(content);
        noteRepository.save(note);
    }

    public void deleteNote(Long noteId) {
        Optional<Note> note = noteRepository.findById(noteId);
        if (note.isEmpty()) {
            throw new ResourceNotFoundException("Note with id " + noteId + " not found");
        }
        noteRepository.deleteById(noteId);
    }

    public Long getUserDataIdByNoteId(Long noteId) {
        return noteRepository.findUserDataIdByNoteId(noteId);
    }

    public NoteDTO getNoteById(Long noteId) {
        Note note = noteRepository
                .findById(noteId)
                .orElseThrow(() -> new ResourceNotFoundException("Note with id " + noteId + " not found"));
        return NoteDTO.convertToNoteDTO(note);
    }
}
