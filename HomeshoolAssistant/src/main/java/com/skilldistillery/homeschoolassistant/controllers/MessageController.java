package com.skilldistillery.homeschoolassistant.controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.homeschoolassistant.data.MessageDAO;
import com.skilldistillery.homeschoolassistant.data.UserDAO;
import com.skilldistillery.homeschoolassistant.entities.Message;
import com.skilldistillery.homeschoolassistant.entities.User;

import jakarta.servlet.http.HttpSession;


@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messageDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path = "message.do", method = RequestMethod.GET)
	public String chatView(HttpSession session, Model model) {
		model.addAttribute("userList", userDAO.findAll());
		List<Message> messages = messageDAO.getAllMessages();
	    model.addAttribute("messages", messages);
		return "message/chat";
	}
	
	@RequestMapping(path = "history.do", method = RequestMethod.GET)
	public String historyView(HttpSession session, @RequestParam("senderId") int senderId,
            @RequestParam("receiverId") int receiverId, Model model) {

	    User sender = userDAO.findById(senderId);
	    User receiver = userDAO.findById(receiverId);
	    model.addAttribute("sender", sender);
	    model.addAttribute("receiver", receiver);
		
	    List<Message> messages = messageDAO.getMessagesByReceiver(senderId, receiverId);
	    model.addAttribute("messages", messages);
	    return "message/history";
	}
	
	@RequestMapping(path = "new_messageForm", method = RequestMethod.GET)
	public String newMessageForm(@RequestParam("senderId") int senderId,
	                             @RequestParam("receiverId") int receiverId,
	                             Model model) {
	    User sender = userDAO.findById(senderId);
	    User receiver = userDAO.findById(receiverId);

	    model.addAttribute("sender", sender);
	    model.addAttribute("receiver", receiver);

	    return "message/new_messageForm";
	}
	
	@RequestMapping(path = "sendMessage.do", method = RequestMethod.POST)
	public String sendMessage(@RequestParam("message") String message,
	                          @RequestParam("senderId") int senderId,
	                          @RequestParam("receiverId") int receiverId, Model model) {

	    User sender = userDAO.findById(senderId);
	    User receiver = userDAO.findById(receiverId);

	    if (sender != null && receiver != null) {
	        Message newMessage = new Message();
	        newMessage.setMessage(message);
	        newMessage.setSender(sender);
	        newMessage.setReceiver(receiver);
	        newMessage.setMessageDate(LocalDateTime.now());

	        // Save the message to the database
	        messageDAO.sendMessage(newMessage);
	    } else {
	    	System.out.println("nope");
	        // if receiver is not found
	    }
	    //return "redirect:/message.do";
	    return "redirect:/history.do?senderId=" + 
	    sender.getId() + "&receiverId=" + receiver.getId();
	}


	
	@RequestMapping(path = "getMessages.do", method = RequestMethod.GET)
	public String getMessages(@RequestParam("userId") int userId, Model model) {
	    List<Message> messages = messageDAO.getMessagesByReceiver(userId);
	    
	    model.addAttribute("messages", messages);
	    
	    return "message/chat";
	}
}
