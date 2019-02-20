package com.ws.controller;

import com.ws.bean.PowerMenu;
import com.ws.bean.Tree;
import com.ws.bean.UserBean;
import com.ws.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TreeController {

    @Autowired
     private TreeService treeService;

    @RequestMapping("authTree")
    @ResponseBody
    public List<Tree> queryTree(HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");
        Integer uid = user.getId();
        return treeService.queryTree(uid);
    }


    //登陆 queryLogin
    //登录
    @RequestMapping("login")
    @ResponseBody
    public String login(UserBean user, String valCode, HttpSession session){

        UserBean user2 = treeService.queryUserByLoginNumber(user.getUsername());
        if(user2==null){
            return "2";
        }
        //验证密码
        if(!user.getUserpwd().equals(user2.getUserpwd())){
            return "3";
        }
        session.setAttribute("user", user2);//user与注销登录的session一样
        return "登陆成功";
    }



    //查询中间表的树
    @RequestMapping("authTree2")
    @ResponseBody
    public  List<Tree>  authTree2(String id){
        return treeService.authTree2(id);
    }


    //赋权限
    @RequestMapping("saveRolePower")
    @ResponseBody
    public  void  saveRolePower(Integer roleId,String powerIds){
        treeService.saveRolePower(roleId,powerIds);
    }

    //查询 权限详情
    @ResponseBody
    @RequestMapping("querypowerMenu")
    public  List<PowerMenu> querypowerMenu(String powerId){

        return treeService.querypowerMenu(powerId);
    }

//新增
    @ResponseBody
    @RequestMapping("savePowerMenu")
    public  String savePowerMenu(PowerMenu powerMenu){

        return treeService.savePowerMenu(powerMenu);
    }

    //删除权限
    //批量删除
    @RequestMapping("deletePowerMenuAll")
    @ResponseBody
    public  void  deleteAll(String id){
        treeService.deleteAll(id);
    }
}
