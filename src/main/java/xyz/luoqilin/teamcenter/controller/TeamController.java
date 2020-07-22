package xyz.luoqilin.teamcenter.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TeamController {
	
	@GetMapping({"/","/index.html"})
	public ModelAndView mainSite() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index.html");
		return modelAndView;		
	}

}
