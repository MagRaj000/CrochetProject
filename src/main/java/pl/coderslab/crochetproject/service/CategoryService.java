package pl.coderslab.crochetproject.service;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.dto.PatternListDTO;
import pl.coderslab.crochetproject.exceptions.ResourceNotFoundException;
import pl.coderslab.crochetproject.model.crochet.Category;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.repository.CategoryRepository;
import pl.coderslab.crochetproject.repository.PatternRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CategoryService {
    private final CategoryRepository categoryRepository;
    private final PatternRepository patternRepository;

    public String getCategoryNameFromId(Long id) {
        return categoryRepository.findById(id).get().getName();
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public List<PatternListDTO> getPatternsByCategoryId(Long categoryId) {
        List<Pattern> patterns = patternRepository.findAllByCategoriesId(categoryId);
        if (patterns.isEmpty()) {
            throw new ResourceNotFoundException("Category with id " + categoryId + " not found");
        }
        return patterns.stream()
                .map(PatternListDTO::convertToListDTO)
                .collect(Collectors.toList());
    }

}
