package mapper;

import pojo.Admin;

public interface AdminMapper {
    //管理员登录验证
    Admin adminLoginCheck(Admin admin);
}
