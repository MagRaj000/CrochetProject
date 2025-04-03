package pl.coderslab.crochetproject.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.crochetproject.model.crochet.Pattern;

@Getter
@Setter
public class PatternListDTO {
    private Long id;
    private String name;
    private String difficulty;

    public static PatternListDTO convertToListDTO(Pattern pattern) {
        PatternListDTO dto = new PatternListDTO();
        dto.setId(pattern.getId());
        dto.setName(pattern.getName());
        dto.setDifficulty(pattern.getDifficulty());
        return dto;
    }
}
