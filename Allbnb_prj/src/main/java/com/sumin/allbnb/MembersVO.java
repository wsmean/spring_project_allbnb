package com.sumin.allbnb;

import java.util.Date;
import java.time.LocalDate;

public class MembersVO {
	private String email;
    private String name;
    private String password;
    private Date join_date;
    private String admin;
    


    public MembersVO() {
        System.out.println("membersVO들어옴");
    }

    public MembersVO(String email, String name, int password, Date join_date, String admin) {
        this.email = email;
        this.name = name;
        this.password = String.valueOf(password);
        this.join_date = join_date;
        this.admin = admin;
    }



    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getJoin_date() {
        return join_date;
    }

    public void setJoin_date(Date join_date) {
        this.join_date = join_date;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "MembersVO{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", password=" + password +
                ", join_date=" + join_date +
                ", admin='" + admin + '\'' +
                '}';
    }
}
