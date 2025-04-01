package pl.coderslab.crochetproject.exceptions;

public class PatternNotFoundException extends RuntimeException {
    public PatternNotFoundException() {
        super("No matching patterns were found");
    }
}
