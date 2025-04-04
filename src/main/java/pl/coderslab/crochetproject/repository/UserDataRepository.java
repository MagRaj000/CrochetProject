package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.crochetproject.model.users.UserData;

import java.util.List;

public interface UserDataRepository extends JpaRepository<UserData, Long> {
    List<UserData> findAllDataByUserId(Long userId);
    UserData findByUserIdAndPatternId(Long userId, Long patternId);

    @Query("SELECT u.completed FROM UserData u WHERE u.user.id = :userId AND u.pattern.id = :patternId")
    boolean getCompletedStatusByUserIdAndPatternId(@Param("userId") Long userId, @Param("patternId") Long patternId);
}
