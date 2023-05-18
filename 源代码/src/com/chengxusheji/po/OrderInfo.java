package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class OrderInfo {
    /*预约id*/
    private Integer orderId;
    public Integer getOrderId(){
        return orderId;
    }
    public void setOrderId(Integer orderId){
        this.orderId = orderId;
    }

    /*预约专家*/
    private Expert expertObj;
    public Expert getExpertObj() {
        return expertObj;
    }
    public void setExpertObj(Expert expertObj) {
        this.expertObj = expertObj;
    }

    /*预约日期*/
    @NotEmpty(message="预约日期不能为空")
    private String orderDate;
    public String getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    /*预约时间*/
    @NotEmpty(message="预约时间不能为空")
    private String orderTime;
    public String getOrderTime() {
        return orderTime;
    }
    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    /*预约内容*/
    @NotEmpty(message="预约内容不能为空")
    private String orderContent;
    public String getOrderContent() {
        return orderContent;
    }
    public void setOrderContent(String orderContent) {
        this.orderContent = orderContent;
    }

    /*预约用户*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    /*处理状态*/
    @NotEmpty(message="处理状态不能为空")
    private String handleState;
    public String getHandleState() {
        return handleState;
    }
    public void setHandleState(String handleState) {
        this.handleState = handleState;
    }

    /*处理结果*/
    private String handleResult;
    public String getHandleResult() {
        return handleResult;
    }
    public void setHandleResult(String handleResult) {
        this.handleResult = handleResult;
    }

    /*预约备注*/
    private String memo;
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonOrderInfo=new JSONObject(); 
		jsonOrderInfo.accumulate("orderId", this.getOrderId());
		jsonOrderInfo.accumulate("expertObj", this.getExpertObj().getName());
		jsonOrderInfo.accumulate("expertObjPri", this.getExpertObj().getExpertUserName());
		jsonOrderInfo.accumulate("orderDate", this.getOrderDate().length()>19?this.getOrderDate().substring(0,19):this.getOrderDate());
		jsonOrderInfo.accumulate("orderTime", this.getOrderTime());
		jsonOrderInfo.accumulate("orderContent", this.getOrderContent());
		jsonOrderInfo.accumulate("userObj", this.getUserObj().getNicheng());
		jsonOrderInfo.accumulate("userObjPri", this.getUserObj().getUser_name());
		jsonOrderInfo.accumulate("handleState", this.getHandleState());
		jsonOrderInfo.accumulate("handleResult", this.getHandleResult());
		jsonOrderInfo.accumulate("memo", this.getMemo());
		return jsonOrderInfo;
    }}