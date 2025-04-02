package pl.coderslab.crochetproject.model.users;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import pl.coderslab.crochetproject.model.crochet.Pattern;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user_data")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Column(nullable = false)
    private boolean completed;  // track completion status for each user

    @ManyToOne // multiple UserData records for one user
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne // multiple users (via UserData) can have one pattern
    @JoinColumn(name = "pattern_id", nullable = false)
    private Pattern pattern;

    @OneToMany // one pattern can have many notes added by one user
    @JoinColumn(name = "user_data_id")
    private List<Note> notes = new ArrayList<>();

}
