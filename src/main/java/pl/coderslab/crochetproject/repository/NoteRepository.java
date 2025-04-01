package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.crochetproject.model.users.Note;

public interface NoteRepository extends JpaRepository<Note, Long> {
}
