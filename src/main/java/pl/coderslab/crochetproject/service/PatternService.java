package pl.coderslab.crochetproject.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.dto.PatternListDTO;
import pl.coderslab.crochetproject.exceptions.PatternNotFoundException;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.repository.PatternRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class PatternService {
    private PatternRepository patternRepository;

    public List<PatternListDTO> getAllPatterns() {
        return patternRepository.findAll().stream()
                .map(this::convertToListDTO)
                .collect(Collectors.toList());
    }

    public List<PatternListDTO> getFilteredPatterns(Long categoryId, Long yarnId, String difficulty) {
        List<Pattern> patterns = findPatterns(categoryId, yarnId, difficulty);
        if (patterns.isEmpty()) {
            throw new PatternNotFoundException();
        }
        return patterns.stream()
                .map(this::convertToListDTO)
                .collect(Collectors.toList());
    }



    private PatternListDTO convertToListDTO(Pattern pattern) {
        PatternListDTO dto = new PatternListDTO();
        dto.setId(pattern.getId());
        dto.setName(pattern.getName());
        return dto;
    }

    private List<Pattern> findPatterns(Long categoryId, Long yarnId, String difficulty) {
        if (categoryId != null && yarnId != null && difficulty != null) {
            return patternRepository.findAllByCategoriesIdAndYarnIdAndDifficulty(categoryId, yarnId, difficulty);
        } else if (categoryId != null && yarnId != null) {
            return patternRepository.findAllByCategoriesIdAndYarnId(categoryId, yarnId);
        } else if (categoryId != null && difficulty != null) {
            return patternRepository.findAllByCategoriesIdAndDifficulty(categoryId, difficulty);
        } else if (yarnId != null && difficulty != null) {
            return patternRepository.findAllByYarnIdAndDifficulty(yarnId, difficulty);
        } else if (categoryId != null) {
            return patternRepository.findAllByCategoriesId(categoryId);
        } else if (yarnId != null) {
            return patternRepository.findAllByYarnId(yarnId);
        } else if (difficulty != null) {
            return patternRepository.findAllByDifficulty(difficulty);
        } else {
            return patternRepository.findAll();
        }
    }

}
