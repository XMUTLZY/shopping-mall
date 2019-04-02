package service;

import pojo.User;

import java.util.List;

public interface UserService {
    List<User> list();
    void add(User user);
    void delete(User user);
    void update(User user);
    User get(int id);
    //登录验证
    User loginCheck(User user);
}
