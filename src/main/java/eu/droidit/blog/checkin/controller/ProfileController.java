package eu.droidit.blog.checkin.controller;

import eu.droidit.blog.checkin.model.Profile;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/profiles")
@Controller
@RooWebScaffold(path = "profiles", formBackingObject = Profile.class)
public class ProfileController {
}
