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

	@RequestMapping(path = { "/", "home.do" })
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
		if (createdPlayer == null) {
			mv.setViewName("createError");
		} else {
			redir.addFlashAttribute("player", createdPlayer);
			mv.setViewName("redirect:playerCreated.do");
		}
		return mv;
	}

	@RequestMapping(path = "playerCreated.do", method = RequestMethod.GET)
	public String createdPlayer() {
		return "playerCreated";

	}

	@RequestMapping(path = "beginUpdate.do", method = RequestMethod.GET)
	public ModelAndView beignUpdate(int playerId) {
		ModelAndView mv = new ModelAndView();
		Player player = playerDao.findById(playerId);
		mv.addObject("player", player);
		mv.setViewName("update");
		return mv;

	}

	@RequestMapping(path = "update.do", method = RequestMethod.POST)
	public ModelAndView updatePlayer(int playerId, Player player, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Player updatedPlayer = playerDao.update(playerId, player);
		if (updatedPlayer == null) {
			mv.setViewName("updateError");
		} else {
			redir.addFlashAttribute("player", updatedPlayer);
			mv.setViewName("redirect:updatedPlayer.do");
		}
		return mv;
	}

	@RequestMapping(path = "updatedPlayer.do", method = RequestMethod.GET)
	public String playerUpdated() {
		return "updateSuccesful";
	}

	@RequestMapping(path = "delete.do", method = RequestMethod.POST)
	public ModelAndView deletePlayer(int playerId, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = playerDao.deleteById(playerId);
		if (deleted) {

			redir.addFlashAttribute("player", playerId);
			mv.setViewName("redirect:playerDeleted.do");
		} else {
			mv.setViewName("deleteError");

		}
		return mv;
	}
	@RequestMapping(path= "playerDeleted.do", method = RequestMethod.GET)
	public String deletedPlayer() {
		return "deleteSuccessful";
	}
}
