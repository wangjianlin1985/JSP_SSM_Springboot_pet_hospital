package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Expert;

public interface ExpertMapper {
	/*添加宠物专家信息*/
	public void addExpert(Expert expert) throws Exception;

	/*按照查询条件分页查询宠物专家记录*/
	public ArrayList<Expert> queryExpert(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有宠物专家记录*/
	public ArrayList<Expert> queryExpertList(@Param("where") String where) throws Exception;

	/*按照查询条件的宠物专家记录数*/
	public int queryExpertCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条宠物专家记录*/
	public Expert getExpert(String expertUserName) throws Exception;

	/*更新宠物专家记录*/
	public void updateExpert(Expert expert) throws Exception;

	/*删除宠物专家记录*/
	public void deleteExpert(String expertUserName) throws Exception;

}
