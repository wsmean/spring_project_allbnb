package com.sumin.allbnb;

import java.util.List;

public interface MembersService {
	
	List<MembersVO> loadMembersList();
    void insertMembers(MembersVO vo);
	void deleteMembers(MembersVO vo);
	String join_check(MembersVO vo);
	String login_check(MembersVO vo);

}
