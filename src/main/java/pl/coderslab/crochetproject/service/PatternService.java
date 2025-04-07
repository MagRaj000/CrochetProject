package pl.coderslab.crochetproject.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.dto.PatternListDTO;
import pl.coderslab.crochetproject.exceptions.ResourceNotFoundException;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.model.crochet.Yarn;
import pl.coderslab.crochetproject.repository.PatternRepository;
import pl.coderslab.crochetproject.repository.YarnRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class PatternService {
    private final PatternRepository patternRepository;
    private final YarnRepository yarnRepository;

    public List<PatternListDTO> getAllPatterns() {
        return patternRepository.findAll().stream()
                .map(PatternListDTO::convertToListDTO)
                .collect(Collectors.toList());
    }

    public List<String> getAllDifficulties() {
        return patternRepository.findDistinctDifficulties();
    }

    public List<Yarn> getAllYarns() {
        return yarnRepository.findDistinctYarns();
    }

    public Optional<Pattern> getPatternById(Long id) {
        return patternRepository.findById(id);
    }

    public List<PatternListDTO> getFilteredPatterns(Long categoryId, Long yarnId, String difficulty) {
        List<Pattern> patterns = findPatterns(categoryId, yarnId, difficulty);
        if (patterns.isEmpty()) {
            throw new ResourceNotFoundException("No matching patterns were found");
        }
        return patterns.stream()
                .map(PatternListDTO::convertToListDTO)
                .collect(Collectors.toList());
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
