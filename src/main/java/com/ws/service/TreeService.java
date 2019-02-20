package com.ws.service;

import com.ws.bean.PowerMenu;
import com.ws.bean.Tree;
import com.ws.bean.UserBean;

import java.util.List;

public interface TreeService {
    List<Tree> queryTree(Integer uid);

    UserBean queryUserByLoginNumber(String username);


    List<Tree> authTree2(String id);

    void saveRolePower(Integer roleId, String powerIds);

    List<PowerMenu> querypowerMenu(String powerId);

    String savePowerMenu(PowerMenu powerMenu);

    void deleteAll(String id);
}
