package service.impl;

import mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Admin;
import service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin adminLoginCheck(Admin admin) {
        return adminMapper.adminLoginCheck(admin);
    }
}
