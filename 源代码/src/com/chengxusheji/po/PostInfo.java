package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class PostInfo {
    /*帖子id*/
    private Integer postInfoId;
    public Integer getPostInfoId(){
        return postInfoId;
    }
    public void setPostInfoId(Integer postInfoId){
        this.postInfoId = postInfoId;
    }

    /*帖子标题*/
    @NotEmpty(message="帖子标题不能为空")
    private String title;
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    /*宠物分类*/
    private PetClass petClassObj;
    public PetClass getPetClassObj() {
        return petClassObj;
    }
    public void setPetClassObj(PetClass petClassObj) {
        this.petClassObj = petClassObj;
    }

    /*帖子内容*/
    @NotEmpty(message="帖子内容不能为空")
    private String content;
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    /*浏览量*/
    @NotNull(message="必须输入浏览量")
    private Integer hitNum;
    public Integer getHitNum() {
        return hitNum;
    }
    public void setHitNum(Integer hitNum) {
        this.hitNum = hitNum;
    }

    /*发帖人*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    /*发帖时间*/
    private String addTime;
    public String getAddTime() {
        return addTime;
    }
    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    /*是否精华帖*/
    @NotEmpty(message="是否精华帖不能为空")
    private String jinghuaFlag;
    public String getJinghuaFlag() {
        return jinghuaFlag;
    }
    public void setJinghuaFlag(String jinghuaFlag) {
        this.jinghuaFlag = jinghuaFlag;
    }
    
    /*审核状态*/
    private String shenHeState; 
    public String getShenHeState() {
		return shenHeState;
	}
	public void setShenHeState(String shenHeState) {
		this.shenHeState = shenHeState;
	}
	
	
	public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonPostInfo=new JSONObject(); 
		jsonPostInfo.accumulate("postInfoId", this.getPostInfoId());
		jsonPostInfo.accumulate("title", this.getTitle());
		jsonPostInfo.accumulate("petClassObj", this.getPetClassObj().getPetClassName());
		jsonPostInfo.accumulate("petClassObjPri", this.getPetClassObj().getPetClassId());
		jsonPostInfo.accumulate("content", this.getContent());
		jsonPostInfo.accumulate("hitNum", this.getHitNum());
		jsonPostInfo.accumulate("userObj", this.getUserObj().getNicheng());
		jsonPostInfo.accumulate("userObjPri", this.getUserObj().getUser_name());
		jsonPostInfo.accumulate("addTime", this.getAddTime().length()>19?this.getAddTime().substring(0,19):this.getAddTime());
		jsonPostInfo.accumulate("jinghuaFlag", this.getJinghuaFlag());
		jsonPostInfo.accumulate("shenHeState", this.getShenHeState());
		return jsonPostInfo;
    }}