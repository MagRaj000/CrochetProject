package pl.coderslab.crochetproject.model.crochet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "categories")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    private String name;
    private String description;

    // bidirectional relationship with Pattern
    // navigation from Pattern to Category, and from Category to Pattern - both needed
    @ManyToMany(mappedBy = "categories")
    @JsonIgnore
    private List<Pattern> patterns = new ArrayList<>();
}
