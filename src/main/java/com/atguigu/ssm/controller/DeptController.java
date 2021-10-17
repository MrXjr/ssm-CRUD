package com.atguigu.ssm.controller;

import com.atguigu.ssm.bean.Department;
import com.atguigu.ssm.bean.Msg;
import com.atguigu.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.PrivateKey;
import java.util.List;

/**
 * @Author: Mrxjr
 * @Date: 2021/10/11 19:44
 * @Description:
 * 处理部门信息
 */
@Controller
public class DeptController {

    @Autowired
    private DepartmentService departmentService;

    /**
     *
     * @date 2021/10/11 21:17
     * @author Mrxjr
     * @param
     * @return com.atguigu.ssm.bean.Msg
     * 获取全部部门
     */
    @RequestMapping("getDetps")
    @ResponseBody
    public Msg getDepts(){
        List<Department> depts = departmentService.getDepts();
        return Msg.success().add("depts",depts);
    }

}
