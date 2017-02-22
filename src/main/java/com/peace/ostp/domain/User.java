package com.peace.ostp.domain;

import java.util.List;

public class User {
    private String userid;

    private String username;

    private String usersex;

    private String useremail;

    private String userphone;

    private String userauthority;

    private String userdesc;

    private String userpsw;

    private String userhobby;

    private String userjob;

    private String useredu;

    private String usertag;

    private String enabled;
    
    private List<Role> roleListStack;
    

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsersex() {
        return usersex;
    }

    public void setUsersex(String usersex) {
        this.usersex = usersex;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public String getUserauthority() {
        return userauthority;
    }

    public void setUserauthority(String userauthority) {
        this.userauthority = userauthority;
    }

    public String getUserdesc() {
        return userdesc;
    }

    public void setUserdesc(String userdesc) {
        this.userdesc = userdesc;
    }

    public String getUserpsw() {
        return userpsw;
    }

    public void setUserpsw(String userpsw) {
        this.userpsw = userpsw;
    }

    public String getUserhobby() {
        return userhobby;
    }

    public void setUserhobby(String userhobby) {
        this.userhobby = userhobby;
    }

    public String getUserjob() {
        return userjob;
    }

    public void setUserjob(String userjob) {
        this.userjob = userjob;
    }

    public String getUseredu() {
        return useredu;
    }

    public void setUseredu(String useredu) {
        this.useredu = useredu;
    }

    public String getUsertag() {
        return usertag;
    }

    public void setUsertag(String usertag) {
        this.usertag = usertag;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

	public List<Role> getRoleListStack() {
		return roleListStack;
	}

	public void setRoleListStack(List<Role> roleListStack) {
		this.roleListStack = roleListStack;
	}


}