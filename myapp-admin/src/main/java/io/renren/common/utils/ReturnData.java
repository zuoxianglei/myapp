package io.renren.common.utils;

import org.apache.http.HttpStatus;

import java.util.HashMap;
import java.util.Map;

/**
 * @ProjectName : renren-fast
 * @Author : Mr.Zuo
 * @Time : 2021.7.6 006 9:10
 * @Description : 返回数据
 */
public class ReturnData extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    public ReturnData() {
        put("code", 0);
        put("msg", "success");
    }

    public static ReturnData error() {
        return error(HttpStatus.SC_INTERNAL_SERVER_ERROR, "未知异常，请联系管理员");
    }

    public static ReturnData error(String msg) {
        return error(HttpStatus.SC_INTERNAL_SERVER_ERROR, msg);
    }

    public static ReturnData error(int code, String msg) {
        ReturnData returnData = new ReturnData();
        returnData.put("code", code);
        returnData.put("msg", msg);
        return returnData;
    }

    public static ReturnData ok(String msg) {
        ReturnData returnData = new ReturnData();
        returnData.put("msg", msg);
        return returnData;
    }

    public static ReturnData ok(Map<String, Object> map) {
        ReturnData returnData = new ReturnData();
        returnData.putAll(map);
        return returnData;
    }

    public static ReturnData ok() {
        return new ReturnData();
    }

    @Override
    public ReturnData put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
