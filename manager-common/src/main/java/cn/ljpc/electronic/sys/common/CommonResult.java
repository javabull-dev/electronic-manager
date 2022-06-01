package cn.ljpc.electronic.sys.common;

import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@Data
public class CommonResult implements Serializable {

    private Map<String, Object> data = new HashMap<>();

    private String msg = "";

    private Integer code = 200;

    public Map<String, Object> getData() {
        return data;
    }

    public CommonResult data(String key, Object value) {
        data.put(key, value);
        return this;
    }

    public static CommonResult success() {
        CommonResult commonResult = new CommonResult();
        commonResult.msg = "请求成功";
        return commonResult;
    }

    public static CommonResult error() {
        CommonResult commonResult = new CommonResult();
        commonResult.msg = "请求失败";
        commonResult.code = 300;
        return commonResult;
    }
}