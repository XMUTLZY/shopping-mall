package service.impl;

import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.User;
import service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> list() {
        return userMapper.list();
    }

    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public void delete(User user) {
        userMapper.delete(user.getId());
    }

    @Override
    public void update(User user) {
        userMapper.add(user);
    }

    @Override
    public User get(int id) {
        return userMapper.get(id);
    }

    @Override
    public User loginCheck(User user) {
        User u = userMapper.loginCheck(user);
        return u;
    }
}
