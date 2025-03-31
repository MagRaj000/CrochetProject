package pl.coderslab.crochetproject.model.crochet;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;


@Entity
@Table(name = "yarns")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Yarn {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    private int weight;
    @NotNull
    private String name;
    private String type;
    private double hookSize;

    // unidirectional relationship with Pattern
}
