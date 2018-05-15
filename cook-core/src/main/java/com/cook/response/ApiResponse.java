package com.cook.response;

/**
 * API格式封装
 */
public class ApiResponse {

    //编码
    private int code;

    //消息
    private String message;

    //数据
    private Object data;



    public ApiResponse(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ApiResponse() {
        this.code = Status.SUCCESS.getCode();
        this.message = Status.SUCCESS.getStandardMessage();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }


    /**
      * @Description: 成功后返回的api类型
      * @Author: ziHeng
      * @Date: 2018/5/9 上午11:32
      * @Param: [data]
      * @return: com.cook.response.ApiResponse
      */
    public static ApiResponse ofSuccess(Object data) {
        return new ApiResponse(Status.SUCCESS.getCode(), Status.SUCCESS.getStandardMessage(), data);
    }

    /**
      * @Description: 错误后返回的api类型
      * @Author: ziHeng
      * @Date: 2018/5/9 上午11:31
      * @Param: [status:传入枚举]
      * @return: com.cook.response.ApiResponse
      */
    public static ApiResponse ofError(Status status) {
        return new ApiResponse(status.getCode(), status.getStandardMessage(),null);
    }



    public enum Status {
        SUCCESS(200, "success"),
        BAD_REQUEST(400, "Bad Request"),
        NOT_FOUND(404, "Not Found"),
        INTERNAL_SERVER_ERROR(500, "未知的异常"),
        NOT_LOGIN(40001, "用户未登录"),
        NOT_SUPPORTED_OPERATION(40002, "违法的操作"),
        NOT_VALID_PARAM(40003, "不合法的参数");


        private int code;
        private String standardMessage;

        Status(int code, String standardMessage) {
            this.code = code;
            this.standardMessage = standardMessage;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getStandardMessage() {
            return standardMessage;
        }

        public void setStandardMessage(String standardMessage) {
            this.standardMessage = standardMessage;
        }
    }


}
