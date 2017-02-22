package com.peace.ostp.util;

import java.util.UUID;

import org.springframework.security.crypto.password.PasswordEncoder;

public class TestUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*	UUID uuid = UUID.randomUUID();
	String a = uuid.toString();
	a = a.toUpperCase();
	a = a.replaceAll("-", "");
	
	System.out.println(a);*/
		String password = "1234";
		String username = "admin";
		String sh1Password = password + "{" + username + "}";
		PasswordEncoder passwordEncoder = new StandardPasswordEncoderForSha1();
		String result = passwordEncoder.encode(sh1Password);
		System.out.println(result);
	}

}
