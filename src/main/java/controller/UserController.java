package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;
import service.UserService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.Thread.sleep;

//表明这是一个控制器
@Controller
@RequestMapping("User")
public class UserController {
    @Autowired
    UserService userService;
//    /*
//    * 前台请求转发
//    * */
    @RequestMapping("login")
    public String login(){return "../jsp/login";}
    @RequestMapping("adminstorLogin")
    public String adminstorLogin(){return "../jsp/adminstorLogin";}
    /*
     * 注册用户
     * */
    @RequestMapping("addUser")
    public ModelAndView addUser(User user){
        userService.add(user);
        System.out.println(user);
        //ModelAndView mav = new ModelAndView("redirect:/Goods/listGoods");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("LoginSuccess");
        return mav;
    }
    /*
    * 用户登陆验证
    * */
    @RequestMapping("logincheck")
    public ModelAndView logincheck(@RequestParam("phone")String phone,
                                   @RequestParam("password")String password, HttpServletResponse response) throws IOException {
        ModelAndView mav = null;
        response.setContentType("text/html;charset=gb2312");
        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);
        //判断是否查询到数据
        if(userService.loginCheck(user)!=null){
            System.out.println("查询到了");
            mav = new ModelAndView("redirect:/Goods/listGoods");
        }else {
            //mav = new ModelAndView();
            //mav.setViewName("login");
            PrintWriter out = response.getWriter();
            out.print("<script language=\"javascript\">alert('账号或密码错误！')</script>");
        }
        return mav;
    }
}
