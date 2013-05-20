package eu.droidit.blog.checkin.model;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.Column;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class CheckinUser {

    @NotNull
    @Column(unique = true)
    @Size(min = 3)
    private String userName;

    @NotNull
    @Size(min = 3)
    private String password;

    @OneToOne
    private Profile profile;
}
