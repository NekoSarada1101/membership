package model;

import java.io.Serializable;

public class MemberBean implements Serializable {
    private int id;
    private String name;
    private String phone_addr;
    private String addr;
    private String auth;
    private String password;

    public MemberBean(int id, String name, String phone, String addr, String auth, String pass) {
        this.id = id;
        this.name = name;
        this.phone_addr = phone;
        this.addr = addr;
        this.auth = auth;
        this.password = pass;
    }

    public MemberBean(String name, String pass) {
        this.name = name;
        this.password = pass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone_addr() {
        return phone_addr;
    }

    public void setPhone_addr(String phone_addr) {
        this.phone_addr = phone_addr;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
