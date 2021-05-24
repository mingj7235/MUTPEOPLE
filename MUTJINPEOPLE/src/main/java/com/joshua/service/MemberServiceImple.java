package com.joshua.service;

import org.springframework.stereotype.Service;

import com.joshua.domain.MemberVO;
import com.joshua.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImple implements MemberService{
	private MemberMapper mapper;
	
	@Override
	public int join(MemberVO member) {
		log.info("join .....");
		return mapper.join(member);
	}
	
	@Override
	public int checkId(String memberId) {
		return mapper.checkId(memberId);
	}
	
}