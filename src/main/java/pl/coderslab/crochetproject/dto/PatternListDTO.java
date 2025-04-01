package pl.coderslab.crochetproject.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.crochetproject.model.crochet.Pattern;

@Getter
@Setter
public class PatternListDTO {
    private Long id;
    private String name;

    public static PatternListDTO convertToListDTO(Pattern pattern) {
        PatternListDTO dto = new PatternListDTO();
        dto.setId(pattern.getId());
        dto.setName(pattern.getName());
        return dto;
    }
}
