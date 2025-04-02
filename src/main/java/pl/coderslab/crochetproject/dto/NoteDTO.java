package pl.coderslab.crochetproject.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.crochetproject.model.users.Note;

@Getter
@Setter
public class NoteDTO {
    private Long id;
    private String content;

    public static NoteDTO convertToNoteDTO(Note note) {
        NoteDTO dto = new NoteDTO();
        dto.setId(note.getId());
        dto.setContent(note.getContent());
        return dto;
    }
}
