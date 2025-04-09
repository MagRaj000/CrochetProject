package pl.coderslab.crochetproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.crochetproject.model.users.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    boolean existsByUsername(String username);
}
