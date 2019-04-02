package mapper;

import pojo.User;

import java.util.List;

public interface UserMapper {
    //增加用户
    int add(User user);
    //通过id删除用户
    void delete(int id);
    //修改用户
    int update(User user);
    //通过id查询yoghurt
    User get(int id);
    //查询所有用户
    List<User> list();
    //登录验证
    User loginCheck(User user);
    int count();
}
