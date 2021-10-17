package com.atguigu.ssm.service;

import com.atguigu.ssm.bean.Department;
import com.atguigu.ssm.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Mrxjr
 * @Date: 2021/10/11 19:56
 * @Description:
 */
@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        return departmentMapper.selectByExample(null);
    }
}
