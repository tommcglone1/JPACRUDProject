package com.skilldistillery.baseballstats.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.baseballstats.entities.Player;

@Service
@Transactional
public class PlayerStatDAOImpl implements PlayerStatDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Player findById(int id) {
		return em.find(Player.class, id);
	}

	@Override
	public List<Player> findAll() {
		String jpql = "SELECT player FROM Player player";
		return em.createQuery(jpql, Player.class).getResultList();
	}
	
	@Override
	public List<Player> findPlayerByLastName(String lastName){
		
		String jpql = "SELECT player FROM Player player "
				+ "WHERE player.lastName LIKE :lastName";
		List<Player> playerList = em.createQuery(jpql, Player.class)
				.setParameter("lastName","%" + lastName + "%")
				.getResultList();
		
		return playerList;
	}

	@Override
	public Player create(Player player) {

		em.persist(player);
		em.flush();

		return player;
	}

	@Override
	public Player update(int id, Player player) {

		Player updatedPlayer = em.find(Player.class, id);
		updatedPlayer.setFirstName(player.getFirstName());
		updatedPlayer.setLastName(player.getLastName());
		updatedPlayer.setTeam(player.getTeam());
		updatedPlayer.setPosition(player.getPosition());
		updatedPlayer.setHits(player.getHits());
		updatedPlayer.setHomeruns(player.getHomeruns());
		updatedPlayer.setBattingAverage(player.getBattingAverage());
		updatedPlayer.setWAR(player.getWAR());
		updatedPlayer.setImgUrl(player.getImgUrl());
		return updatedPlayer;
	}

	@Override
	public boolean deleteById(int id) {
		boolean success = false;

		Player player = em.find(Player.class, id);
		if (em.contains(player)) {
			em.remove(player);
			success = true;
		}
		return success;
	}

}
