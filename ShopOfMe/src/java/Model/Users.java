/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author HauTran
 */
public class Users {
    private long userID;
    private String userEmail;
    private String userPassword;
    private boolean userRole;

    public Users() {
    }
    

    public Users(long userID, String userEmail, String userPassword, boolean userRole) {
        this.userID = userID;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userRole = userRole;
    }
    

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public boolean isUserRole() {
        return userRole;
    }

    public void setUserRole(boolean userRole) {
        this.userRole = userRole;
    }
}
