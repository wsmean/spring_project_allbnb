package com.sumin.allbnb.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.allbnb.MembersVO;

@Repository
public class MembersDAO {
	@Autowired
    private SqlSessionTemplate mybatis;
	
    public MembersDAO() {
		System.out.println("membersDAO들어옴 ");
	}

	public MembersDAO(SqlSessionTemplate mybatis) {
		System.out.println("membersDAO_Mybatis 들어옴 ");
		this.mybatis = mybatis;
	}

	public void insertMembers(MembersVO vo){
        System.out.println("dao insertMembers들어옴");
        mybatis.insert("com.sumin.allbnb.impl.MembersDAO.insertMembers",vo);
    }

    public List<MembersVO> loadMembersList(){
        System.out.println("dao loadMembersList 들어옴");
        List<MembersVO> list = mybatis.selectList("com.sumin.allbnb.impl.MembersDAO.loadMembersList");
        //System.out.println("list : "+list);
		return list;
        
    }

    public void deleteMembers(MembersVO vo){
        System.out.println("deleteMembersDAO 들어옴");
        mybatis.delete("com.sumin.allbnb.impl.MembersDAO.deleteMembers",vo);
        System.out.println(mybatis.delete("com.sumin.allbnb.impl.MembersDAO.deleteMembers",vo));
    }
    
    public String join_check(MembersVO vo) {
    	String result="not_use";
    	System.out.println("join_check들어옴");
    	System.out.println("들어온값 :"+vo.getEmail());
    	MembersVO member =  mybatis.selectOne("com.sumin.allbnb.impl.MembersDAO.join_check", vo);
//    	System.out.println("result: "+result);
    	if(member != null) {
    		result= "id_use";
    	}
    	
    	return result;		
    }

	public String login_check(MembersVO vo) {
		System.out.println("login_checkDAO들어옴");
		MembersVO member = mybatis.selectOne("com.sumin.allbnb.impl.MembersDAO.login_check",vo);
		if(member != null) {
			return "login_ok";
		}else {
			return "login_no";
		}
	}

}
