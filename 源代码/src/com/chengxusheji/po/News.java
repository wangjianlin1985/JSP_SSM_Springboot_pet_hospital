package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class News {
    /*资讯id*/
    private Integer newsId;
    public Integer getNewsId(){
        return newsId;
    }
    public void setNewsId(Integer newsId){
        this.newsId = newsId;
    }

    /*资讯分类*/
    private NewsClass newsClassObj;
    public NewsClass getNewsClassObj() {
        return newsClassObj;
    }
    public void setNewsClassObj(NewsClass newsClassObj) {
        this.newsClassObj = newsClassObj;
    }

    /*资讯标题*/
    @NotEmpty(message="资讯标题不能为空")
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

    /*宠物体型*/
    @NotEmpty(message="宠物体型不能为空")
    private String tixing;
    public String getTixing() {
        return tixing;
    }
    public void setTixing(String tixing) {
        this.tixing = tixing;
    }

    /*资讯内容*/
    @NotEmpty(message="资讯内容不能为空")
    private String content;
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    /*发布时间*/
    @NotEmpty(message="发布时间不能为空")
    private String publishDate;
    public String getPublishDate() {
        return publishDate;
    }
    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonNews=new JSONObject(); 
		jsonNews.accumulate("newsId", this.getNewsId());
		jsonNews.accumulate("newsClassObj", this.getNewsClassObj().getNewsClassName());
		jsonNews.accumulate("newsClassObjPri", this.getNewsClassObj().getNewsClassId());
		jsonNews.accumulate("title", this.getTitle());
		jsonNews.accumulate("petClassObj", this.getPetClassObj().getPetClassName());
		jsonNews.accumulate("petClassObjPri", this.getPetClassObj().getPetClassId());
		jsonNews.accumulate("tixing", this.getTixing());
		jsonNews.accumulate("content", this.getContent());
		jsonNews.accumulate("publishDate", this.getPublishDate().length()>19?this.getPublishDate().substring(0,19):this.getPublishDate());
		return jsonNews;
    }}