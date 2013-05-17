package eu.droidit.blog.checkin.controller;

import eu.droidit.blog.checkin.model.CheckinUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/checkinusers")
@Controller
@RooWebScaffold(path = "checkinusers", formBackingObject = CheckinUser.class)
public class CheckinUserController {
}
