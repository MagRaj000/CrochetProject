package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.crochetproject.model.crochet.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
