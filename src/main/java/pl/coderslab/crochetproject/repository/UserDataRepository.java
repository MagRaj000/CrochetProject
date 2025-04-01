package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.crochetproject.model.users.UserData;

import java.util.List;

public interface UserDataRepository extends JpaRepository<UserData, Long> {
    List<UserData> findAllDataByUserId(Long userId);
    UserData findByUserIdAndPatternId(Long userId, Long patternId);
}
