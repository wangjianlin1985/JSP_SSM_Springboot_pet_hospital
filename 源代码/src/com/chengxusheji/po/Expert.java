package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Expert {
    /*专家账号*/
    @NotEmpty(message="专家账号不能为空")
    private String expertUserName;
    public String getExpertUserName(){
        return expertUserName;
    }
    public void setExpertUserName(String expertUserName){
        this.expertUserName = expertUserName;
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

    /*姓名*/
    @NotEmpty(message="姓名不能为空")
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
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

    /*出生日期*/
    @NotEmpty(message="出生日期不能为空")
    private String birthDate;
    public String getBirthDate() {
        return birthDate;
    }
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    /*专家照片*/
    private String expertPhoto;
    public String getExpertPhoto() {
        return expertPhoto;
    }
    public void setExpertPhoto(String expertPhoto) {
        this.expertPhoto = expertPhoto;
    }

    /*毕业学校*/
    @NotEmpty(message="毕业学校不能为空")
    private String school;
    public String getSchool() {
        return school;
    }
    public void setSchool(String school) {
        this.school = school;
    }

    /*工作经验*/
    @NotEmpty(message="工作经验不能为空")
    private String workExperience;
    public String getWorkExperience() {
        return workExperience;
    }
    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
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

    /*专家详情*/
    @NotEmpty(message="专家详情不能为空")
    private String expertDesc;
    public String getExpertDesc() {
        return expertDesc;
    }
    public void setExpertDesc(String expertDesc) {
        this.expertDesc = expertDesc;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonExpert=new JSONObject(); 
		jsonExpert.accumulate("expertUserName", this.getExpertUserName());
		jsonExpert.accumulate("password", this.getPassword());
		jsonExpert.accumulate("name", this.getName());
		jsonExpert.accumulate("gender", this.getGender());
		jsonExpert.accumulate("birthDate", this.getBirthDate().length()>19?this.getBirthDate().substring(0,19):this.getBirthDate());
		jsonExpert.accumulate("expertPhoto", this.getExpertPhoto());
		jsonExpert.accumulate("school", this.getSchool());
		jsonExpert.accumulate("workExperience", this.getWorkExperience());
		jsonExpert.accumulate("telephone", this.getTelephone());
		jsonExpert.accumulate("expertDesc", this.getExpertDesc());
		return jsonExpert;
    }}