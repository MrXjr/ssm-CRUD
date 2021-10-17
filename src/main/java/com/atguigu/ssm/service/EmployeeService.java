package com.atguigu.ssm.service;

import com.atguigu.ssm.bean.Employee;
import com.atguigu.ssm.bean.EmployeeExample;
import com.atguigu.ssm.bean.Msg;
import com.atguigu.ssm.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: Mrxjr
 * @Date: 2021/10/5 11:48
 * @Description:
 */
@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     *
     * @date 2021/10/11 21:20
     * @author Mrxjr
     * @param
     * @return java.util.List<com.atguigu.ssm.bean.Employee>
     *     获取全部员工
     */
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }


    /**
     *
     * @date 2021/10/11 21:20
     * @author Mrxjr
     * @param employee
     * @return void
     * 保存员工信息
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }


    /**
     *
     * @date 2021/10/12 21:44
     * @author Mrxjr
     * @param empName
     * @return boolean
     * 检查用户名是否可用
     */
    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long l = employeeMapper.countByExample(example);
        return l == 0;
    }

    /**
     *
     * @date 2021/10/14 20:37
     * @author Mrxjr
     * @param id
     * @return com.atguigu.ssm.bean.Employee
     * 通过id查询员工
     */
    public Employee getEmpById(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     *
     * @date 2021/10/15 10:35
     * @author Mrxjr
     * @param employee
     * @return void
     * 更新员工信息
     */
    public void updateEmp(Employee employee) {
        System.out.println(employee);
       employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     *
     * @date 2021/10/15 10:35
     * @author Mrxjr
     * @param id
     * @return void
     * 删除员工
     */
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    /**
     *
     * @date 2021/10/15 16:27
     * @author Mrxjr
     * @param ids_list
     * @return void
     * 批量删除员工
     */
    public void batchDelete(List<Integer> ids_list) {
        //创建删除条件，delete ...  where emp_id in (1,2,3...)
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids_list);
        employeeMapper.deleteByExample(employeeExample);
        System.out.println("test git");
        System.out.println("test git1");
    }
}
