package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.crochetproject.model.crochet.Yarn;

import java.util.List;

public interface YarnRepository extends JpaRepository<Yarn, Long> {
    @Query("SELECT DISTINCT y FROM Yarn y")
    List<Yarn> findDistinctYarns();
}
