package com.atguigu.ssm.controller;

import com.atguigu.ssm.bean.Employee;
import com.atguigu.ssm.bean.Msg;
import com.atguigu.ssm.service.EmployeeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Mrxjr
 * @Date: 2021/10/5 11:44
 * @Description:
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     *
     * @date 2021/10/15 16:20
     * @author Mrxjr
     * @param ids
     * @return com.atguigu.ssm.bean.Msg
     * 批量删除、单个删除二合一方法
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            List<Integer> ids_list = new ArrayList<>();
            //带”-“标志批量删除
            //将传过来的参数以”-“分割成多个字符串（即将传过来的员工id分割放入字符串数组）
            String[] spl_ids = ids.split("-");
            //将id数组放入list集合中
            for (String spl_id : spl_ids) {
                ids_list.add(Integer.parseInt(spl_id));
                employeeService.batchDelete(ids_list);
            }
        }else {
            //单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }

    //rest编程，这里的参数empId需要跟pojo的属性值一直，不然封装不上
    // 如果前端直接发送的put的ajax请求，需要配置过滤器HttpPutFormContentFilter，作用是将请求参数封装成map
    // 重写request.getParameter方法，来接收这些参数
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     *
     * @date 2021/10/14 21:38
     * @author Mrxjr
     * @param id
     * @return com.atguigu.ssm.bean.Msg
     * 根据id获取员工信息
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id){
       Employee employee = employeeService.getEmpById(id);
       return Msg.success().add("emp",employee);
    }


    /**
     *
     * @date 2021/10/12 21:44
     * @author Mrxjr
     * @param empName
     * @return com.atguigu.ssm.bean.Msg
     * 检查用户名是否可用
     */
    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(String empName){
        //校验用户名格式
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
        if (!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名可以是2-5位中文或者6-16位英文和数字的结合");
        }
        //验证用户名是否可用
        boolean b = employeeService.checkUser(empName);
        if (b == true){
            return Msg.success().add("va_msg","用户名可用");
        }else {
            return Msg.fail().add("va_msg","用户名重复");
        }
    }

    /**
     *
     * @date 2021/10/11 21:18
     * @author Mrxjr
     * @param
     * @return com.atguigu.ssm.bean.Msg
     * 保存员工
     * JSR303后端校验
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        //校验失败，不保存数据库，返回错误信息
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                //getField获取错误字段名，getDefaultMessage错误信息
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    //返回jsp页面只能被浏览器解析，返回json就可以被移动端接收，
    @RequestMapping(value = "/emps")
    @ResponseBody//响应体，返回json字符串
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //使用分页插件
        PageHelper.startPage(pn, 5);
        List<Employee> employees = employeeService.getAll();
        //封装查询结果，设置分页导航数
        PageInfo<Employee> pageInfo = new PageInfo<>(employees, 5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    //@RequestMapping(value = "/emps")
    public String getAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //使用分页插件
        PageHelper.startPage(pn, 5);
        List<Employee> employees = employeeService.getAll();
        //封装查询结果，设置分页导航数
        PageInfo<Employee> pageInfo = new PageInfo<>(employees, 5);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }

}
