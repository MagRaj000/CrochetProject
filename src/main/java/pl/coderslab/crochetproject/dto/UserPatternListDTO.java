package pl.coderslab.crochetproject.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.model.users.UserData;

@Getter
@Setter
public class UserPatternListDTO extends PatternListDTO {
    private boolean completed;

    public static UserPatternListDTO convertToUserPatternListDTO(UserData userData) {
        UserPatternListDTO dto = new UserPatternListDTO();
        Pattern pattern = userData.getPattern();
        dto.setId(pattern.getId());
        dto.setName(pattern.getName());
        dto.setCompleted(userData.isCompleted()); // completed status from user, not pattern
        return dto;
    }
}
