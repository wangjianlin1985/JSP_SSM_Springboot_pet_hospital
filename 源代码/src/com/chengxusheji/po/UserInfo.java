package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class UserInfo {
    /*用户名*/
    @NotEmpty(message="用户名不能为空")
    private String user_name;
    public String getUser_name(){
        return user_name;
    }
    public void setUser_name(String user_name){
        this.user_name = user_name;
    }

    /*登录密码*/
    @NotEmpty(message="登录密码不能为空")
    private String password;
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    /*宠物类别*/
    private PetClass petClassObj;
    public PetClass getPetClassObj() {
        return petClassObj;
    }
    public void setPetClassObj(PetClass petClassObj) {
        this.petClassObj = petClassObj;
    }

    /*宠物昵称*/
    @NotEmpty(message="宠物昵称不能为空")
    private String nicheng;
    public String getNicheng() {
        return nicheng;
    }
    public void setNicheng(String nicheng) {
        this.nicheng = nicheng;
    }

    /*宠物照片*/
    private String petPhoto;
    public String getPetPhoto() {
        return petPhoto;
    }
    public void setPetPhoto(String petPhoto) {
        this.petPhoto = petPhoto;
    }

    /*性别*/
    @NotEmpty(message="性别不能为空")
    private String gender;
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    /*体型*/
    @NotEmpty(message="体型不能为空")
    private String tixing;
    public String getTixing() {
        return tixing;
    }
    public void setTixing(String tixing) {
        this.tixing = tixing;
    }

    /*体重*/
    @NotEmpty(message="体重不能为空")
    private String weight;
    public String getWeight() {
        return weight;
    }
    public void setWeight(String weight) {
        this.weight = weight;
    }

    /*出生日期*/
    @NotEmpty(message="出生日期不能为空")
    private String birthDate;
    public String getBirthDate() {
        return birthDate;
    }
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    /*是否接种疫苗*/
    @NotEmpty(message="是否接种疫苗不能为空")
    private String sfym;
    public String getSfym() {
        return sfym;
    }
    public void setSfym(String sfym) {
        this.sfym = sfym;
    }

    /*主人姓名*/
    @NotEmpty(message="主人姓名不能为空")
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    /*联系电话*/
    @NotEmpty(message="联系电话不能为空")
    private String telephone;
    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /*邮件*/
    @NotEmpty(message="邮件不能为空")
    private String email;
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    /*备注信息*/
    private String memo;
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }

    /*注册时间*/
    private String regTime;
    public String getRegTime() {
        return regTime;
    }
    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonUserInfo=new JSONObject(); 
		jsonUserInfo.accumulate("user_name", this.getUser_name());
		jsonUserInfo.accumulate("password", this.getPassword());
		jsonUserInfo.accumulate("petClassObj", this.getPetClassObj().getPetClassName());
		jsonUserInfo.accumulate("petClassObjPri", this.getPetClassObj().getPetClassId());
		jsonUserInfo.accumulate("nicheng", this.getNicheng());
		jsonUserInfo.accumulate("petPhoto", this.getPetPhoto());
		jsonUserInfo.accumulate("gender", this.getGender());
		jsonUserInfo.accumulate("tixing", this.getTixing());
		jsonUserInfo.accumulate("weight", this.getWeight());
		jsonUserInfo.accumulate("birthDate", this.getBirthDate().length()>19?this.getBirthDate().substring(0,19):this.getBirthDate());
		jsonUserInfo.accumulate("sfym", this.getSfym());
		jsonUserInfo.accumulate("name", this.getName());
		jsonUserInfo.accumulate("telephone", this.getTelephone());
		jsonUserInfo.accumulate("email", this.getEmail());
		jsonUserInfo.accumulate("memo", this.getMemo());
		jsonUserInfo.accumulate("regTime", this.getRegTime().length()>19?this.getRegTime().substring(0,19):this.getRegTime());
		return jsonUserInfo;
    }}