package ezen.member.repository;

import java.sql.SQLException;
import java.util.List;

import ezen.member.entity.Member;

/**
 * 회원 관련 기능 명세
 * @author 김민영
 * @Date   2023. 3. 8.
 */
public interface MemberRepository { 
	// 회원 가입
	public void create(Member member) throws SQLException;
	// 회원 인증
	public Member isMember(Member member) throws SQLException;
	// 회원 목록 조회
	public List<Member> findAll() throws SQLException;
	// 회원 삭제
	// 회원 정보 수정
	
}
