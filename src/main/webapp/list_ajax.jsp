<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mrxjr
  Date: 2021/10/5
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <%--引入jQuery--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <%--引入bootstrap样式--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 添加员工模态框 -->
<div class="modal fade" id="addEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <%--模态框体--%>
            <div class="modal-body">
                <%--员工信息输入表单--%>
                <form class="form-horizontal">
                    <%--员工名输入--%>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input"
                                   placeholder="empName">
                            <%--校验错误信息提示行--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--员工邮箱输入--%>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_add_input"
                                   placeholder="woxingxu@guigu.com">
                            <%--错误信息提示行--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--性别复选框--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%--下拉列表--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_id">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%--按钮--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改员工模态框 -->
<div class="modal fade" id="updateEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" >员工添加</h4>
            </div>
            <%--模态框体--%>
            <div class="modal-body">
                <%--员工信息输入表单--%>
                <form class="form-horizontal">
                    <%--员工名输入--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <%--静态组件,不会被序列化--%>
                            <p class="form-control-static" id="empName_update_static"></p>
                            <%--校验错误信息提示行--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--员工邮箱输入--%>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_update_input"
                                   placeholder="woxingxu@guigu.com">
                            <%--错误信息提示行--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--性别复选框--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%--下拉列表--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" >
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%--按钮--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--标题行--%>
    <div class="row">
        <%--占满12列--%>
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮行--%>
    <div class="row">
        <%--占4列，往右偏移8列，即在最右边--%>
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="add_emp_btn">新增</button>
            <button class="btn btn-danger" id="delete_all_btn">删除</button>
        </div>
    </div>
    <%--表格行--%>
    <div class="row">
        <table class="table table-hover" id="emps_table">
            <thead>
            <tr>
                <th><input type="checkbox" id="check_all"/></th>
                <th>#</th>
                <th>empName</th>
                <th>gender</th>
                <th>email</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <%--分页行--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<%--************************************************--%>

<%--js代码--%>
<script type="text/javascript">

    var last_page;
    var current_page;

    //页面加载完，发送ajax请求，得到分页数据
    $(function () {
        to_page(1);
    });

    /*发起分页请求，并构建页面*/
    function to_page(pn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    //构建员工表函数
    function build_emps_table(result) {
        //构建前先清空之前的元素
        $("#emps_table tbody").empty();
        $("#check_all").prop("checked",false);
        var emps = result.extend.pageInfo.list;
        //emps遍历的集合，function回调函数，必须有两个参数，一个索引，一个对象，参数名自定义
        $.each(emps, function (index, item) {
            //创建td元素，并追加内容
            var checkboxTd = $("<td></td>").append($("<input type='checkbox' class='check_item' />"));
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
            var empEmailTd = $("<td></td>").append(item.email);
            var empDeptNameTd = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //给编辑按钮加上员工id属性
            editBtn.attr("emp_id",item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            //给删除按钮加上员工id属性
            deleteBtn.attr("emp_id",item.empId);
            /*将两个按钮放在一个单元格内*/
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);

            $("<tr></tr>")
                .append(checkboxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDeptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        })
    }

    //构建分页信息函数
    function build_page_info(result) {
        //构建前先清空之前的元素
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 " + result.extend.pageInfo.pageNum + " 页," +
            "总 " + result.extend.pageInfo.pages + " 页,总 " + result.extend.pageInfo.total + " 条记录");
        last_page = result.extend.pageInfo.pages + 1;
        current_page = result.extend.pageInfo.pageNum;
    }


    //构建分页导航函数
    function build_page_nav(result) {
        //构建前先清空之前的元素
        $("#page_nav_area").empty();

        var nav = $("<nav></nav>");
        var ul = $("<ul></ul>").addClass("pagination");
        var firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var lastLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        var preLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));

        //如果第一页禁用前一页和第一页按钮
        if (result.extend.pageInfo.isFirstPage) {
            firstLi.addClass("disabled");
            preLi.addClass("disabled");
        } else {
            //单击事件，使用分页请求函数发起ajax请求得到分页数据
            firstLi.click(function () {
                to_page(1);
            });
            preLi.click(function () {
                to_page(result.extend.pageInfo.prePage);
            });
        }

        //如果最后一页禁用下一页和最后一页按钮
        if (result.extend.pageInfo.isLastPage) {
            lastLi.addClass("disabled");
            nextLi.addClass("disabled");
        } else {
            //单击事件，使用分页请求函数发起ajax请求得到分页数据
            lastLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextLi.click(function () {
                to_page(result.extend.pageInfo.nextPage);
            });
        }


        //将首页和前一页加入ul中
        ul.append(firstLi).append(preLi);
        //遍历，将分页加入ul中
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            //单击事件，使用分页请求函数发起ajax请求得到分页数据
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //将下一页和末页加入ul中
        ul.append(nextLi).append(lastLi);
        nav.append(ul);
        $("#page_nav_area").append(nav);
    }

    //重置表单信息和样式
    function reset_form(ele){
        //每次弹出模态框前先重置表单信息（清空信息）,只有dom对象才有reset方法
        $(ele)[0].reset();
        //清空样式
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //添加按钮单击事件，弹出模态框
    $("#add_emp_btn").click(function () {
        //重置表单
        reset_form("#addEmpModal form");
        //先获取部门信息，并展示在部门下拉列表中
        get_dept("#addEmpModal select");
        //单击弹出模态框
        $("#addEmpModal").modal({
            //表示点击空白处不能关闭模态框
            backdrop: "static"
        });
    })

    //获取部门信息，放入新增表单的下拉条
    function get_dept(ele) {
        //清空部门信息下拉条
        $(ele).empty();
        $.ajax({
            //同步发送请求，避免同时发送两个ajax请求时出错
            async:false,
            url: "${pageContext.request.contextPath}/getDetps",
            type: "GET",
            success: function (result) {
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        });
    }

    //校验表单数据
    function validata_add_form() {
        //正则表达式,校验用户名
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            //格式错误，使用错误显示样式，并提示信息
            show_validata_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的结合");
            return false;
        } else {
            show_validata_msg("#empName_add_input", "success", "");
        }

        //校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            //格式错误，使用错误显示样式，并提示信息
            show_validata_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validata_msg("#email_add_input", "success", "");
        }
        return true;
    }

    //显示校验样式
    function show_validata_msg(ele, status, msg) {
        //每次都先 清空校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if (status == "error") {
            //给父元素加上class样式，显示效果
            $(ele).parent().addClass("has-error");
            //给错误信息提示添加内容
            $(ele).next("span").text(msg);
        } else if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }
    }

    //检查用户名是否可用
    $("#empName_add_input").change(function (){
        //获取输入框的值
        var empName = this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/checkUser",
            data: "empName="+empName,
            type: "POST",
            success: function (result) {
                if (result.code==100){
                    //给保存按钮增加一个属性，用来标记保存按钮是否可用
                    $("#emp_save_btn").attr("ajax_va","success");
                    show_validata_msg("#empName_add_input","success",result.extend.va_msg);
                }else if (result.code==200){
                    //给保存按钮增加一个属性，用来标记保存按钮是否可用
                    $("#emp_save_btn").attr("ajax_va","error");
                    show_validata_msg("#empName_add_input","error",result.extend.va_msg);
                }
            }
        });
    });

    //添加提交的单击事件
    $("#emp_save_btn").click(function () {
        //发送ajax请求前先进行表单校验
        if (!validata_add_form()) {
            return false;
        }
        //格式校验通过还要校验用户名是否重复
        if ($(this).attr("ajax_va")=="error"){
            return false;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/emp",
            //表单信息序列化
            data: $("#addEmpModal form").serialize(),
            type: "POST",
            success: function (result) {
                //获取后端校验的结果
                if (result.extend.code==100){
                    //alert(result.msg);
                    //保存完之后关闭模态框
                    $("#addEmpModal").modal("hide");
                    //跳转最后一页
                    to_page(last_page);
                }else{
                    //后端校验失败，返回错误信息
                    if (result.extend.errorFields.empName){
                        show_validata_msg("#empName_add_input","error",result.extend.errorFields.empName);
                    }
                    if (result.extend.errorFields.email){
                        show_validata_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                }
            }
        });
    });

    //编辑按钮单击事件
    //编辑按钮和删除按钮是在页面加载完之后才添加进来的，直接绑定事件是不行的，on元素可以给后来添加进来的元素绑定事件
    $(document).on("click",".edit_btn",function (){
        //重置表单
        reset_form("#updateEmpModal form");
        //先获取部门信息，并展示在部门下拉列表中，不可直接在页面取数据，可能有脏数据
        get_dept("#updateEmpModal select");
        //从数据库中获取员工信息，显示在表单中
        getEmp($(this).attr("emp_id"));
        //给更新按钮加上员工id属性
        $("#emp_update_btn").attr("emp_id",$(this).attr("emp_id"));
        //单击弹出模态框
        $("#updateEmpModal").modal({
            //表示点击空白处不能关闭模态框
            backdrop: "static"
        });
    })

    //单个删除单击事件
    $(document).on("click",".delete_btn",function (){
        var empName = $(this).parent().parent().find("td:eq(2)").text();
        var empId = $(this).attr("emp_id");
        if (confirm("是否要删除【"+ empName +"】?")){
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + empId,
                //data:"_method=DELETE",
                type:"DELETE",
                success:function (result){
                    alert(result.msg);
                    to_page(current_page);
                }
            })
        }
    })

    //根据id发送ajax请求获取员工信息
    function getEmp(id){
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/"+id,
            type:"GET",
            success:function (result){
                var empdata = result.extend.emp;
                //用户名赋值
                $("#empName_update_static").text(empdata.empName);
                //邮箱赋值
                $("#email_update_input").val(empdata.email);
                //单选框的赋值是一个数组，加上[]
                $("#updateEmpModal input[name=gender]").val([empdata.gender]);
                //下拉表赋值
                $("#updateEmpModal select").val([empdata.dId]);
            }
        })
    }

    //更新按钮的单击事件
    $("#emp_update_btn").click(function () {
        //校验邮箱
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            //格式错误，使用错误显示样式，并提示信息
            show_validata_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validata_msg("#email_update_input", "success", "");
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/"+$(this).attr("emp_id"),
            //表单信息序列化
            data: $("#updateEmpModal form").serialize(),
            type: "PUT",
            success: function (result) {
                //alert(result.msg);
                //更新完关闭模态框，回到当前页面
                $("#updateEmpModal").modal("hide");
                to_page(current_page);
            }
        });
    });

    //全选、全不选实现
    $("#check_all").click(function (){
        //attr只能用来取自定义的属性，原生的dom属性要用prop来取
        //alert($(this).attr("checked"));
        //alert($(this).prop("checked"));
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    $(document).on("click",".check_item",function (){
        //checkbox元素有checked选择器，可以筛选被选中的元素
        //判断是不是所有checkbox都被选中，是则让全选框变成选中状态
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    })

    $("#delete_all_btn").click(function (){

        var empName = "";
        var empId = "";
        $.each($(".check_item:checked"),function (){
            //将多个员工名拼成串
            empName += $(this).parent().parent().find("td:eq(2)").text() + ",";
            empId += $(this).parent().parent().find("td:eq(1)").text() + "-";
        })
        //将用户名拼串中最后一个多余的“，”去掉
        empName = empName.substr(0,empName.length-1);
        //将用户id拼串中最后一个多余的“-”去掉
        empId = empId.substr(0,empId.length-1);
        if (confirm("确定要删除【"+ empName +"】?")){
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/"+empId,
                type:"DELETE",
                success:function (result){
                    alert(result.msg);
                    to_page(current_page);
                }
            })
        }
    })

</script>
</body>
</html>
