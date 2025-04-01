package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.crochetproject.model.crochet.Pattern;

import java.util.List;

public interface PatternRepository extends JpaRepository<Pattern, Long> {
    List<Pattern> findAllByCategoriesId(Long categoryId);
    List<Pattern> findAllByYarnId(Long yarnId);
    List<Pattern> findAllByDifficulty(String difficulty);

    List<Pattern> findAllByCategoriesIdAndYarnId(Long categoryId, Long yarnId);
    List<Pattern> findAllByCategoriesIdAndDifficulty(Long categoryId, String difficulty);
    List<Pattern> findAllByYarnIdAndDifficulty(Long yarnId, String difficulty);
    List<Pattern> findAllByCategoriesIdAndYarnIdAndDifficulty(Long categoryId, Long yarnId, String difficulty);

}
