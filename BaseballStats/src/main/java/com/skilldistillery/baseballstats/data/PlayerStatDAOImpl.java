package com.skilldistillery.baseballstats.data;

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
	public Player create(Player player) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Player update(int id, Player player) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
