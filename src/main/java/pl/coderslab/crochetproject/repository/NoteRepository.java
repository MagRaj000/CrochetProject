package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.crochetproject.model.users.Note;

import java.util.List;

public interface NoteRepository extends JpaRepository<Note, Long> {
    List<Note> findByUserDataId(Long userDataId);

    @Query("select n.userData.id from Note n where n.id = :noteId")
    Long findUserDataIdByNoteId(Long noteId);
}
