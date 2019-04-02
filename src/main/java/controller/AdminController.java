package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import pojo.Admin;
import service.AdminService;

@RestController
public class AdminController {
    @Autowired
    AdminService adminService;
    @RequestMapping("adminLoginCheck")
    public boolean adminLoginCheck(@RequestParam("username")String username,
                                   @RequestParam("password")String password){
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        System.out.println(admin);
        if(adminService.adminLoginCheck(admin)!=null){
            return true;
        }else {
            return false;
        }
    }
}
