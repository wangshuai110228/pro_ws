package com.ws.service.impl;

import com.ws.bean.Role;
import com.ws.mapper.RoleMapper;
import com.ws.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> queryRole() {
        return roleMapper.queryRole();
    }
}
