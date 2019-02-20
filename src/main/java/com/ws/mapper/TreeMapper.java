package com.ws.mapper;

import com.ws.bean.PowerMenu;
import com.ws.bean.Tree;
import com.ws.bean.UserBean;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TreeMapper {

    @Select("SELECT t.id,t.text,t.url,t.pid FROM t_tree t LEFT JOIN t_role_power rp on t.id = rp.power_id \n" +
            "LEFT JOIN  t_role r on rp.role_id = r.id LEFT JOIN user u on r.id=u.roleid WHERE u.id=#{uid}")
    List<Tree> queryTree(Integer uid);
    @Select("select * from user where username=#{username} ")
    UserBean queryUserByLoginNumber(String username);

    //查询中间表的树
    @Select("select * from t_tree")
    List<Tree> authTree2();

    //删除 关联角色表 重复新增内容 (等于修改)
    @Delete("DELETE  from t_role_power  where  role_id=#{roleId}")
    void deleteRolePowerById(Integer roleId);
    //新增角色关联权限树表
    @Insert("INSERT INTO t_role_power(role_id,power_id) VALUES(#{roleId},#{s})")
    void saveRolePower(@Param("roleId") Integer roleId, @Param("s") String s);

    /// /查询角色关联树
    @Select("SELECT * FROM t_tree t LEFT JOIN t_role_power rp on t.id=rp.power_id where rp.role_id=#{id}")
    List<Tree> queryByRoleId(String id);

    @Select("select * from t_prower_menu pm where  pm.power_id =#{powerId}")
    List<PowerMenu> querypowerMenu(String powerId);
    //新增权限详情
    @Insert("INSERT INTO t_prower_menu (name,url,power_id) VALUES(#{name},#{url},#{power_id})")
    String savePowerMenu(PowerMenu powerMenu);

    //删除
    @Delete("delete  FROM t_prower_menu  where id=#{s} ")
    void deleteAll(String s);
}
