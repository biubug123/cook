package com.cook.security.component;

import com.alibaba.fastjson.JSONObject;
import com.cook.response.ApiResponse;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @description: 绑定和解绑
 * @author: ziHeng
 * @create: 2018-06-05 14:23
 **/
public class ConnectionBindView extends AbstractView {
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("application/json;charset=UTF-8");
        if(model.get("connection") == null){
            response.getWriter().write(JSONObject.toJSONString(ApiResponse.ofSuccess("绑定成功")));
        }else {
            response.getWriter().write(JSONObject.toJSONString(ApiResponse.ofSuccess("解除绑定成功")));
        }

    }
}