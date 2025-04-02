package pl.coderslab.crochetproject.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.crochetproject.model.crochet.Pattern;

@Getter
@Setter
public class UserPatternListDTO extends PatternListDTO {
    private boolean completed;

    public static UserPatternListDTO convertToUserPatternListDTO(Pattern pattern) {
        UserPatternListDTO dto = new UserPatternListDTO();
        dto.setId(pattern.getId());
        dto.setName(pattern.getName());
        dto.setCompleted(pattern.isCompleted());
        return dto;
    }
}
