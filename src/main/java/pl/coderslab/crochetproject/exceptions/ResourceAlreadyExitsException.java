package pl.coderslab.crochetproject.exceptions;

public class ResourceAlreadyExitsException extends RuntimeException {
    public ResourceAlreadyExitsException(String message) {
        super(message);
    }
}
