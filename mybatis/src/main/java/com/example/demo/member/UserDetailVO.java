package com.example.demo.member;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



public class UserDetailVO implements UserDetails {
	private MemberVO memberVO;
	
	public UserDetailVO(MemberVO vo) {
		this.memberVO = vo;
	}
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> list = new ArrayList<>();
		list.add(new SimpleGrantedAuthority(memberVO.getResponsibility()));
		return list;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getPassword() {
		return memberVO.getPass();
	}

	@Override
	public String getUsername() {
		return memberVO.getMid();
	}
	
	
}