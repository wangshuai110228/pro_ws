package com.ws.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageController {

    @RequestMapping("index")
    public  String  main(){

        return "index";
    }

    @RequestMapping("lunbo")
    public  String  lunbo(){

        return "lunbo2";
    }

    @RequestMapping("userlist")
    public  String  userlist(){

        return "show";
    }

    @RequestMapping("rolepower")
    public  String  rolepower(){

        return "rolepower";
    }

    @RequestMapping("updatePwd")
    public  String  updatePwd(){

        return "updatePwd";
    }


    @RequestMapping("pingjia")
    public  String  pingjia(){

        return "pingjia";
    }


    @RequestMapping("problem")
    public  String  problem(){

        return "pro";
    }

    @RequestMapping("answer")
    public  String  answer(){

        return "answer";
    }


    @RequestMapping("kecheng")
    public  String  kecheng(){

        return "kecheng";
    }

    @RequestMapping("catalog")
    public  String  catalog(){

        return "catalog";
    }

    @RequestMapping("webuser")
    public  String  webuser(){

        return "webuser";
    }


    @RequestMapping("ecahers")
    public  String  ecahers(){

        return "ecahers";
    }
}
