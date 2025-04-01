package pl.coderslab.crochetproject.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<String> handlePatternNotFoundException(ResourceNotFoundException e) {
        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
//        return ResponseEntity.status(HttpStatus.NOT_FOUND)
//                .header("Content-Type", "text/html")
//                .body("<img src='https://http.cat/404' alt='404 Not Found'>" + e.getMessage());
    }

    @ExceptionHandler(ResourceAlreadyExitsException.class)
    public ResponseEntity<String> handlePatternAlreadyExitsException(ResourceAlreadyExitsException e) {
        return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
    }
}
