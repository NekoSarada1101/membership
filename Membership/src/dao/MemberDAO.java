package dao;

import model.LoginBean;
import model.MemberBean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO extends DaoBase {
    public LoginBean findMember(String name, String password) {

        LoginBean loginBean = null;
        try {
            super.DbOpen();

            String sql = "SELECT * FROM member, password WHERE member.memberName=? AND password.password=? AND member.memberId = password.id";
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, password);

            rs = this.stmt.executeQuery();
            rs.next();

            loginBean = new LoginBean(this.rs.getString("memberName"), this.rs.getString("password"));

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                super.DbClose();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return loginBean;
    }

    public boolean insertMember(MemberBean memberBean) {
        try {
            super.DbOpen();

            super.stmt = con.prepareStatement("SELECT memberId FROM member WHERE memberId = ?");
            stmt.setInt(1, memberBean.getId());
            rs = stmt.executeQuery();

            if (rs.next()) {
                throw new Exception("既に存在するIDです");
            }

            super.stmt = con.prepareStatement("INSERT INTO member (memberId,memberName,authority,address,phone) VALUES (?,?,?,?,?)");

            stmt.setInt(1, memberBean.getId());
            stmt.setString(2, memberBean.getName());
            stmt.setString(3, memberBean.getAuth());
            stmt.setString(4, memberBean.getAddr());
            stmt.setString(5, memberBean.getPhone_addr());
            stmt.executeUpdate();

            super.stmt = con.prepareStatement("INSERT INTO password (id, password) VALUES (?,?)");

            stmt.setInt(1, memberBean.getId());
            stmt.setString(2, memberBean.getPassword());
            stmt.executeUpdate();
            stmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                super.DbClose();
            } catch (Exception e) {
            }
        }
        return true;
    }

    public List<MemberBean> MemberInfo() {
        List<MemberBean> list = new ArrayList<MemberBean>();
        try {
            MemberBean memberBean = null;
            super.DbOpen();
            super.stmt = con.prepareStatement("SELECT * FROM member");
            rs = this.stmt.executeQuery();
            while (rs.next()) {
                memberBean = new MemberBean();
                memberBean.setId(this.rs.getInt("memberId"));
                memberBean.setName(this.rs.getString("memberName"));
                memberBean.setAuth(this.rs.getString("authority"));
                memberBean.setAddr(this.rs.getString("address"));
                memberBean.setPhone_addr(this.rs.getString("phone"));
                list.add(memberBean);
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                super.DbClose();
            } catch (Exception e) {
            }
        }
        return list;
    }
}
