// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.droidit.blog.checkin.model;

import eu.droidit.blog.checkin.model.CheckinUser;
import eu.droidit.blog.checkin.model.Profile;

privileged aspect CheckinUser_Roo_JavaBean {
    
    public String CheckinUser.getUsername() {
        return this.username;
    }
    
    public void CheckinUser.setUsername(String username) {
        this.username = username;
    }
    
    public String CheckinUser.getPassword() {
        return this.password;
    }
    
    public void CheckinUser.setPassword(String password) {
        this.password = password;
    }
    
    public Profile CheckinUser.getProfile() {
        return this.profile;
    }
    
    public void CheckinUser.setProfile(Profile profile) {
        this.profile = profile;
    }
    
}