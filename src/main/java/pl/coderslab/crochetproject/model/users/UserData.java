package pl.coderslab.crochetproject.model.users;

import jakarta.persistence.*;
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

    @OneToOne
    @JoinColumn(name = "user_id", unique=true)
    private User user;

    @OneToOne
    @JoinColumn(name = "pattern_id", unique=true)
    private Pattern pattern;

    @OneToMany
    @JoinColumn(name = "user_data_id")  // user can add many notes to one pattern
    private List<Note> notes = new ArrayList<>();
}
