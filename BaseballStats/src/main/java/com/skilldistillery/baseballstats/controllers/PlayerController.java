package com.skilldistillery.baseballstats.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.baseballstats.data.PlayerStatDAO;
import com.skilldistillery.baseballstats.entities.Player;

@Controller
public class PlayerController {

	@Autowired
	private PlayerStatDAO playerDao;
	
	
	@RequestMapping(path = {"/", "home.do"})
	public String goHome(Model model) {
		model.addAttribute("players", playerDao.findAll());
		return "home";
	}
	
	@RequestMapping(path = "findPlayerDataById.do")
	public ModelAndView findPlayerById(int playerId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("player", playerDao.findById(playerId));
		mv.setViewName("viewPlayer");
		return mv;
		
	}
	
	@RequestMapping(path = "create.do", method = RequestMethod.POST)
	public ModelAndView createPlayer(Player player, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Player createdPlayer = null;
		createdPlayer = playerDao.create(player);
		if(createdPlayer == null) {
			mv.setViewName("createError");
		}else {
			redir.addFlashAttribute("player",createdPlayer);
			mv.setViewName("redirect:playerCreated.do");
		}
		return mv;
	}
	
	@RequestMapping(path="playerCreated.do", method= RequestMethod.GET)
	public String createdPlayer() {
		return "playerCreated";
		
	}
}
