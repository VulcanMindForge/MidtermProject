package com.skilldistillery.homeschoolassistant.data;

import java.util.List;

import com.skilldistillery.homeschoolassistant.entities.Message;
import com.skilldistillery.homeschoolassistant.entities.User;

public interface MessageDAO {
	Message sendMessage(Message message);
	List<Message> getMessageBySender(int senderId);
	List<Message> getMessagesByReceiver(int receiverId);
	List<Message> getAllMessages();
	User getUserByUsername(String senderId);
	List<User> findUsersByName(String name);
	List<Message> getMessagesByReceiver(int senderId, int receiverId);
	List<User> getUsersReceivedMessagesFromSender(int senderId);
}
