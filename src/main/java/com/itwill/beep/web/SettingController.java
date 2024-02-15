package com.itwill.beep.web;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/settings")
public class SettingController {



    @GetMapping("/security")
    public String securitySettings(Authentication authentication, Model model) {
        model.addAttribute("active", "sercurity");
        return "settings/security";
    }

    @GetMapping("/notifications")
    public String notificationSettings(Authentication authentication, Model model) {
        model.addAttribute("active", "notifications");
        return "settings/notifications";
    }

    @GetMapping("/connections")
    public String connectionSettings(Authentication authentication, Model model) {
        model.addAttribute("active", "connections");
        return "settings/connections";
    }

    @GetMapping("/recommendations")
    public String recommendationSettings(Authentication authentication, Model model) {
        model.addAttribute("active", "recommendations");
        return "settings/recommendations";
    }
}
