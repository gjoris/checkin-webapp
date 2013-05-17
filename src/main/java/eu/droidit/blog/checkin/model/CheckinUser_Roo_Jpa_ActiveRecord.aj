// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.droidit.blog.checkin.model;

import eu.droidit.blog.checkin.model.CheckinUser;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CheckinUser_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CheckinUser.entityManager;
    
    public static final EntityManager CheckinUser.entityManager() {
        EntityManager em = new CheckinUser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CheckinUser.countCheckinUsers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CheckinUser o", Long.class).getSingleResult();
    }
    
    public static List<CheckinUser> CheckinUser.findAllCheckinUsers() {
        return entityManager().createQuery("SELECT o FROM CheckinUser o", CheckinUser.class).getResultList();
    }
    
    public static CheckinUser CheckinUser.findCheckinUser(Long id) {
        if (id == null) return null;
        return entityManager().find(CheckinUser.class, id);
    }
    
    public static List<CheckinUser> CheckinUser.findCheckinUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CheckinUser o", CheckinUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CheckinUser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CheckinUser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CheckinUser attached = CheckinUser.findCheckinUser(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CheckinUser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CheckinUser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CheckinUser CheckinUser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CheckinUser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}