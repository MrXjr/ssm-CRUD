import com.atguigu.ssm.bean.Employee;
import com.atguigu.ssm.dao.DepartmentMapper;
import com.atguigu.ssm.dao.EmployeeMapper;
import com.atguigu.ssm.service.EmployeeService;
import org.apache.ibatis.session.SqlSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author: Mrxjr
 * @Date: 2021/10/4 16:42
 * @Description:
 */
//指定@Test注解使用spring提供的测试
@RunWith(SpringJUnit4ClassRunner.class)
//指定spring测试的配置文件
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testCRUD() {
//        ApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext(
//                "src/main/resources/applicationContext.xml");

//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

//        employeeMapper.insertSelective(new Employee(null, "tom", "M", "tom@atguigu.com", 1));

//        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 1000; i++) {
//            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
//            employeeMapper.insertSelective(new Employee(null, uid, "M", uid + "@atguigu.com", 2));
//        }
    }

}
