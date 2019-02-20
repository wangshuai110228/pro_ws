package com.ws.mapper;

import com.ws.bean.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleMapper {

    //查询
    @Select("select * from t_role")
    List<Role> queryRole();
}
