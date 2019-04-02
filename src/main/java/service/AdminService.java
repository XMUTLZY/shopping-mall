package service;

import mapper.AdminMapper;
import pojo.Admin;

public interface AdminService {
    Admin adminLoginCheck(Admin admin);
}
