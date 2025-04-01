package pl.coderslab.crochetproject.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.crochetproject.dto.UserLibraryDTO;
import pl.coderslab.crochetproject.exceptions.ResourceAlreadyExitsException;
import pl.coderslab.crochetproject.exceptions.ResourceNotFoundException;
import pl.coderslab.crochetproject.model.crochet.Pattern;
import pl.coderslab.crochetproject.model.users.User;
import pl.coderslab.crochetproject.model.users.UserData;
import pl.coderslab.crochetproject.repository.PatternRepository;
import pl.coderslab.crochetproject.repository.UserDataRepository;
import pl.coderslab.crochetproject.repository.UserRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserDataService {
    private final UserDataRepository userDataRepository;
    private final UserRepository userRepository;
    private final PatternRepository patternRepository;

    public List<UserLibraryDTO> getUserLibrary(Long userId) {
        return userDataRepository.findAllDataByUserId(userId).stream()
                .map(UserLibraryDTO::convertToUserLibraryDTO)
                .collect(Collectors.toList());
    }

    public String savePatternToLibrary(Long userId, Long patternId) {
        UserData oldUserData = userDataRepository.findByUserIdAndPatternId(userId, patternId);
        if (oldUserData != null) {
            throw new ResourceAlreadyExitsException("Pattern already exists in user's library");
        }
        User user = userRepository
                .findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User with id " + userId + " not found"));
        Pattern pattern = patternRepository
                .findById(patternId)
                .orElseThrow(() -> new ResourceNotFoundException("Pattern with id " + patternId + " not found"));

        UserData userData = new UserData();
        userData.setUser(user);
        userData.setPattern(pattern);
        userDataRepository.save(userData);
        return "Pattern was successfully added to user's library";
    }


}
