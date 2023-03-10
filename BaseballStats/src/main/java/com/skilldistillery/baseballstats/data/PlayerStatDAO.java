package com.skilldistillery.baseballstats.data;

import java.util.List;

import com.skilldistillery.baseballstats.entities.Player;

public interface PlayerStatDAO {
	Player findById(int id);
	List<Player> findAll();
	Player create(Player player);
	Player update(int id, Player player);
	boolean deleteById(int id);
	
}
