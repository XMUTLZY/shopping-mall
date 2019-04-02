package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.Goods;
import service.GoodsService;

import java.util.List;

//表明这是一个控制器
@Controller
@RequestMapping("Goods")
public class GoodsController {
    @Autowired
    GoodsService goodsService;

    @RequestMapping("login")
    public String login(){return "../jsp/login";}
    @RequestMapping("adminstorLogin")
    public String adminstorLogin(){return "../jsp/adminstorLogin";}

    @RequestMapping("listGoods")
    public ModelAndView listGoods(){
        System.out.println("沃尔");
        ModelAndView mav = new ModelAndView();
        List<Goods> goods = goodsService.list();
        mav.addObject("goods",goods);
        mav.setViewName("ShoppingMallIndex");
        return mav;
    }
}
