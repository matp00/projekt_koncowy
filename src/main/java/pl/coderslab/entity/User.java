package pl.coderslab.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import pl.coderslab.validator.RegisterValidator;

import javax.persistence.*;
import javax.validation.groups.Default;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(groups = RegisterValidator.class)
    @Column(unique = true)
    private String username;
    @NotEmpty(groups = {RegisterValidator.class, Default.class})
    private String password;
    @NotEmpty(groups = {RegisterValidator.class, Default.class})
    @Email
    @Column(unique = true)
    private String email;
    private String type="user";
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Comment> comments = new ArrayList<>();

    public User() {}

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
