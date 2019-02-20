package com.ws.controller;

import com.ws.bean.WebUser;
import com.ws.service.WebUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class WebUserController {

    @Autowired
    private WebUserService webUserService;



    //查询用户表
    @RequestMapping("queryWebUser")
    @ResponseBody
    public HashMap<String,Object> queryCatalog(int page, int rows, WebUser webuser){
        HashMap<String,Object> list = webUserService.queryWebUser(page,rows, webuser);

        return list;
    }



    //修改回显
    @RequestMapping("queryWebUserById")
    @ResponseBody
    public WebUser queryWebUserById(Integer id){

        WebUser  webUser   = webUserService.queryWebUserById(id);
        return webUser;
    }



    //修改 ： 新增
    @RequestMapping("addWebUser")
    @ResponseBody
    public void  addAnswer(WebUser webuser){

        Integer id = webuser.getId();
        if (id!=null){
            //修改
            webUserService.updateWebUser(webuser);
        }else {
            //新增
            webUserService.addWebUser(webuser);
        }

    }



    //批量删除
    @RequestMapping("deleteWebUserAll")
    @ResponseBody
    public  void  deleteCatalogAll(String id){
        webUserService.deleteAll(id);
    }

}
