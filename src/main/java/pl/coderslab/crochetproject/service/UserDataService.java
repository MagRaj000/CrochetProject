package pl.coderslab.crochetproject.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
    private final ObjectMapper objectMapper; // for storing JSON

    public List<UserLibraryDTO> getUserLibrary(Long userId) {
        List<UserData> userData = userDataRepository.findAllDataByUserId(userId);
        if (userData.isEmpty()) {
            throw new ResourceNotFoundException("User with id " + userId + " not found");
        }
        return userData.stream()
                .map(UserLibraryDTO::convertToUserLibraryDTO)
                .collect(Collectors.toList());
    }

    public void savePatternToLibrary(Long userId, Long patternId) {
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

        // set all steps of progress to false by default
        String[] steps = pattern.getDescription().split("\n");
        boolean[] progress = new boolean[steps.length];
        userData.setProgress(serializeProgress(progress));
        userDataRepository.save(userData);
    }

    public void deletePatternFromLibrary(Long userId, Long patternId) {
        UserData userData = userDataRepository.findByUserIdAndPatternId(userId, patternId);
        if (userData == null) {
            throw new ResourceNotFoundException("Pattern with id " + patternId + " not found in user's library");
        }
        userDataRepository.delete(userData);
    }

    public String toggleCompleted(Long userId, Long patternId) {
        UserData userData = userDataRepository.findByUserIdAndPatternId(userId, patternId);
        if (userData == null) {
            throw new ResourceNotFoundException("Pattern with id " + patternId + " not found in user's library");
        }
        boolean isCompleted = !userData.isCompleted();
        userData.setCompleted(isCompleted);
        userDataRepository.save(userData);
        return "Pattern was marked as " + (isCompleted ? "completed" : "not completed") + " for this user";
    }

    public boolean[] getProgress(Long userId, Long patternId) {
        UserData userData = userDataRepository.findByUserIdAndPatternId(userId, patternId);
        if (userData == null) {
            throw new ResourceNotFoundException("Pattern with id " + patternId + " not found in user's library");
        }
        return deserializeProgress(userData.getProgress());
    }

    public boolean[] updateProgress(Long userId, Long patternId, int stepIndex) {
        UserData userData = userDataRepository.findByUserIdAndPatternId(userId, patternId);
        if (userData == null) {
            throw new ResourceNotFoundException("Pattern with id " + patternId + " not found in user's library");
        }

        String[] steps = userData.getPattern().getDescription().split("\n");
        if (stepIndex < 0 || stepIndex >= steps.length) {
            throw new IllegalArgumentException("Invalid step index: " + stepIndex);
        }

        boolean[] progress = deserializeProgress(userData.getProgress());
        // also mark all steps before the specified step as completed
        for (int i = 0; i < progress.length; i++) {
            if (i <= stepIndex) {
                progress[i] = true;  // also mark all steps before the specified step as completed
            } else {
                progress[i] = false; // reset all steps after the specified step (if some other step was set up before)
            }
        }
        userData.setProgress(serializeProgress(progress));

        // check if all steps are completed, to also mark the whole pattern as completed
        boolean allCompleted = true;
        for (boolean step : progress) {
            if (!step) {
                allCompleted = false;
                break;
            }
        }
        userData.setCompleted(allCompleted);
        userDataRepository.save(userData);
        return progress;
    }

    public boolean getCompletedStatusByUserIdAndPatternId(Long userId, Long patternId) {
        return userDataRepository.getCompletedStatusByUserIdAndPatternId(userId, patternId);
    }

    // convert the boolean array to a JSON string for storage
    private String serializeProgress(boolean[] progress) {
        try {
            return objectMapper.writeValueAsString(progress);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to serialize progress", e);
        }
    }

    // converts the JSON string back to a boolean array to use in the application
    private boolean[] deserializeProgress(String progress) {
        try {
            return objectMapper.readValue(progress, boolean[].class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to deserialize progress", e);
        }
    }

}
