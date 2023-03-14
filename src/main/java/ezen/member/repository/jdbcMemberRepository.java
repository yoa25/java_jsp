package ezen.member.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ezen.member.entity.Member;

public class jdbcMemberRepository implements MemberRepository {
	// DB 연결정보 상수
	private static final String driver = "oracle.jdbc.driver.OracleDriver" ;
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String user = "hr";
	private static final String password= "hr";
	
	private Connection con;

	public jdbcMemberRepository() throws SQLException, ClassNotFoundException {
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,password);
	}

	@Override
	public void create(Member member) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		sb.append(" INSERT INTO member")
		.append(" VALUES(?, ?, ?, ?, ?, SYSDATE)");
		try {
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt. setString(4, member.getEmail());
			pstmt. setInt(5, member.getAge());
			int count = pstmt.executeUpdate();
			con.commit(); // 규모가 커질 수록 오토 커밋이 아니라 직접 해주는 것이 좋다.
		}catch (Exception e) { //데이터가 입력이 되지 않았다.
			con.rollback();
		}finally {
			if(pstmt != null) pstmt.close();
		}
				
	}

	@Override
	public Member isMember(Member member) throws SQLException {
		Member loginMember;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT member_id, name, email, age, regdate")
		.append(" FROM member")
		.append(" WHERE member_id = ? AND password = ?");
		try {
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginMember = makeMember(rs);
				return loginMember;
			}
		}catch (Exception e) { 
		}finally {
			if(pstmt != null) pstmt.close();
			rs.close();
		}
		return null;
	}

	@Override
	public List<Member> findAll() throws SQLException {
		List<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT member_id, name, email, age, regdate")
		.append(" FROM member")
		.append(" ORDER BY regdate DESC");
		try {
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member member = makeMember(rs);
				list.add(member);
			}
		}catch (Exception e) { 
		}finally {
			if(pstmt != null) pstmt.close();
			rs.close();
		}

		return null;
	}
	
	//헬퍼 메소드
	private Member makeMember(ResultSet rs) throws SQLException {
		Member member = new Member();
		member.setId(rs.getString("member_id"));
		member. setName(rs. getString("name"));
		member.setEmail(rs.getString("email"));
		member.setAge(rs.getInt("age"));
		member. setRegdate(rs.getDate("regdate"));
		return member;
	}
	
	//테스트를 위한 임시 main
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		MemberRepository repository = new jdbcMemberRepository();
		Member member = new Member();
		member.setId("momo");
		member.setPassword("1111");
		Member loginMember = repository.isMember(member);
		//비회원인 경우
		if(loginMember == null){
			System.out.println("회원 아님");
		}else {
			System.out.println(loginMember.toString());
		}
		// 전체 목록 조회
		repository.findAll(); 
	}

}
