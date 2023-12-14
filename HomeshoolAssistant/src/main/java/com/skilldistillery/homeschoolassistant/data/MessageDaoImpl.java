package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.homeschoolassistant.entities.Message;
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class MessageDaoImpl implements MessageDAO {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public Message sendMessage(Message message) {
		em.persist(message);
		em.flush();
		return message;
	}

	@Override
	public List<Message> getMessageBySender(int senderId) {
		String jpql = "SELECT m FROM Message m WHERE m.sender.id = :sender_id";
        List<Message> messages = em.createQuery(jpql, Message.class)
                                  .setParameter("senderId", senderId)
                                  .getResultList();
        return messages;
	}

	@Override
	public List<Message> getMessagesByReceiver(int receiverId) {
		String jpql = "SELECT m FROM Message m WHERE m.receiver.id = :receiver_id";
        List<Message> messages = em.createQuery(jpql, Message.class)
                                  .setParameter("receiverId", receiverId)
                                  .getResultList();
        return messages;
	}
	
	@Override
	public List<Message> getMessagesByReceiver(int senderId, int receiverId) {
	    String jpql = "SELECT m FROM Message m " +
	                  "WHERE (m.sender.id = :senderId AND m.receiver.id = :receiverId) " +
	                  "   OR (m.sender.id = :receiverId AND m.receiver.id = :senderId)";

	    List<Message> messages = em.createQuery(jpql, Message.class)
	                                .setParameter("senderId", senderId)
	                                .setParameter("receiverId", receiverId)
	                                .getResultList();
	    return messages;
	}


	@Override
	public List<Message> getAllMessages() {
		String jpql = "SELECT m FROM Message m";

		List<Message> messages = em.createQuery(jpql, Message.class).getResultList();

		return messages;
	}

	@Override
	public User getUserByUsername(String username) {
	    String jpql = "SELECT u FROM User u WHERE u.username = :username";
	    return em.createQuery(jpql, User.class)
	             .setParameter("username", username)
	             .getSingleResult();
	}


}
