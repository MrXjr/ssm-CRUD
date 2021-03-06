package com.atguigu.ssm.bean;

import com.alibaba.druid.support.spring.stat.annotation.Stat;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Mrxjr
 * @Date: 2021/10/9 16:52
 * @Description:
 * 通用的返回类
 */
public class Msg {
    //100-成功，200-失败
    private int code;

    //提示信息
    private String msg;

    //用户要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("成功");
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("失败");
        return result;
    }

    public Msg add(String key , Object value){
        this.extend.put(key,value);
        return this;
    }
}
