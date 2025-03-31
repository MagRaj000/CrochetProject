package pl.coderslab.crochetproject.model.crochet;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patterns")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Pattern {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Lob // large object
    @Column(columnDefinition = "TEXT")
    private String description;
    @NotNull
    private String difficulty;
    @NotNull
    @Column(nullable = false)
    private boolean completed = false;

    @ManyToOne // pattern primary uses one type of yarn
    @JoinColumn(name = "yarn_id")
    private Yarn yarn;

    @ManyToMany
    @JoinTable(
            name = "pattern_category",
            joinColumns = @JoinColumn(name = "pattern_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private List<Category> categories = new ArrayList<>();
}
