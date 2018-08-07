package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import java.util.List;

@Component
public class UserService {

    @Autowired
    UserRepository userRepository;

    public void addUser(User user){
        String hashedPassword = BCrypt.hashpw( user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashedPassword);
        userRepository.save(user);
    }

    public boolean checkEmail(String email, String password){
        User user = userRepository.findByEmail(email);
        if(user != null){
            return BCrypt.checkpw(password, user.getPassword());
        }
        return false;
    }
    public boolean checkEmail(String email){
        User user = userRepository.findByEmail(email);
        if(user != null) return true;
        else return false;
    }

    public boolean checkUsername(String username){
        User user = userRepository.findByUsername(username);
        if(user != null) return true;
        else return false;
    }

    public User getLogedUser(){
        //how to get data from session??
        return null;
    }


}
