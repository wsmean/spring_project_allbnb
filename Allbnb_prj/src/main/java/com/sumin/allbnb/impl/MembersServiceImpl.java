package com.sumin.allbnb.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumin.allbnb.MembersService;
import com.sumin.allbnb.MembersVO;

@Service("membersService")
public class MembersServiceImpl implements MembersService{
	@Autowired
    private MembersDAO membersDAO;

    public MembersServiceImpl(){
        System.out.println("memberserviceimpl들어옴");
    }

    public List<MembersVO> loadMembersList(){
    	System.out.println("serviceimpl값 :"+membersDAO.loadMembersList());
        return membersDAO.loadMembersList();
    }

    public void insertMembers(MembersVO vo) {
        membersDAO.insertMembers(vo);
    }

	@Override
	public void deleteMembers(MembersVO vo) {
		membersDAO.deleteMembers(vo);
		
	}
	
	public String join_check(MembersVO vo) {
		System.out.println("join_checked_impl들어옴");
		String user = membersDAO.join_check(vo);
		System.out.println("user:"+user);
		return user;
	}

	public String login_check(MembersVO vo) {
		System.out.println("login_check들어옴");
		String user= membersDAO.login_check(vo);
		System.out.println("user:"+user);
		return user;
	}

}
