package pl.coderslab.crochetproject.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.crochetproject.model.users.Note;
import pl.coderslab.crochetproject.model.users.UserData;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class UserLibraryDTO {
    private Long id;
    private PatternListDTO pattern;
    private List<String> notes;

    public static UserLibraryDTO convertToUserLibraryDTO(UserData userData) {
        UserLibraryDTO dto = new UserLibraryDTO();
        dto.setId(userData.getId());
        dto.setPattern(UserPatternListDTO.convertToUserPatternListDTO(userData.getPattern()));
        dto.setNotes(userData
                .getNotes()
                .stream()
                .map(Note::getContent)
                .collect(Collectors.toList()));
        return dto;
    }
}
