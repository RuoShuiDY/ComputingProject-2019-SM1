package com.txg.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	@RequestMapping(value="/dashboardUI")
	public String showDashboardUI() {
		return "dashboard";
	}
}
