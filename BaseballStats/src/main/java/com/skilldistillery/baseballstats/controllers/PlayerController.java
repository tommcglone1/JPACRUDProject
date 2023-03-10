package com.skilldistillery.baseballstats.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.baseballstats.data.PlayerStatDAO;

@Controller
public class PlayerController {

	@Autowired
	private PlayerStatDAO playerDao;
	
	
	@RequestMapping(path = {"/", "home.do"})
	public String goHome(Model model) {
		model.addAttribute("players", playerDao.findAll());
		return "home";
	}
}
