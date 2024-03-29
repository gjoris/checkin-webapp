// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.droidit.blog.checkin.model;

import eu.droidit.blog.checkin.model.CheckinUser;
import eu.droidit.blog.checkin.model.CheckinUserDataOnDemand;
import eu.droidit.blog.checkin.model.ProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CheckinUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CheckinUserDataOnDemand: @Component;
    
    private Random CheckinUserDataOnDemand.rnd = new SecureRandom();
    
    private List<CheckinUser> CheckinUserDataOnDemand.data;
    
    @Autowired
    ProfileDataOnDemand CheckinUserDataOnDemand.profileDataOnDemand;
    
    public CheckinUser CheckinUserDataOnDemand.getNewTransientCheckinUser(int index) {
        CheckinUser obj = new CheckinUser();
        setPassword(obj, index);
        setUserName(obj, index);
        return obj;
    }
    
    public void CheckinUserDataOnDemand.setPassword(CheckinUser obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void CheckinUserDataOnDemand.setUserName(CheckinUser obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public CheckinUser CheckinUserDataOnDemand.getSpecificCheckinUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CheckinUser obj = data.get(index);
        Long id = obj.getId();
        return CheckinUser.findCheckinUser(id);
    }
    
    public CheckinUser CheckinUserDataOnDemand.getRandomCheckinUser() {
        init();
        CheckinUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return CheckinUser.findCheckinUser(id);
    }
    
    public boolean CheckinUserDataOnDemand.modifyCheckinUser(CheckinUser obj) {
        return false;
    }
    
    public void CheckinUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CheckinUser.findCheckinUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CheckinUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CheckinUser>();
        for (int i = 0; i < 10; i++) {
            CheckinUser obj = getNewTransientCheckinUser(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
