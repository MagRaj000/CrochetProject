package pl.coderslab.crochetproject.service;

import lombok.AllArgsConstructor;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.model.users.User;
import pl.coderslab.crochetproject.repository.UserRepository;

@Service
@AllArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public Long findUserIdByUsernameAndPassword(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && matchPassword(password, user.getPassword())) {
            return user.getId();
        }
        return null;
    }

    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    public void addUser(String username, String password) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(hashPassword(password));
        userRepository.save(user);
    }

    public boolean matchPassword(String rawPassword, String hashedPassword) {
        return BCrypt.checkpw(rawPassword, hashedPassword);
    }

    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
}
