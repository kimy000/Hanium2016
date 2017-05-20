package store;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
  
@ServerEndpoint("/websocket")
public class MyWebsocket {
    
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	/***
     * �쎒 �냼耳볦씠 �뿰寃곕릺硫� �샇異쒕릺�뒗 �씠踰ㅽ듃
     */
    @OnOpen
    public void handleOpen(Session session){
        System.out.println("client is now connected...");
        clients.add(session);
    }
    /**
     * �쎒 �냼耳볦쑝濡쒕��꽣 硫붿떆吏�媛� �삤硫� �샇異쒕릺�뒗 �씠踰ㅽ듃
     * @param message
     * @return
     */
    @OnMessage
    public void handleMessage(String message, Session session) throws IOException{
//        System.out.println("receive from client : "+message);
        String replymessage = "websocket.java echo "+message;
        System.out.println("websocket.java send to client : "+replymessage);
//        return replymessage;
    	System.out.println(message);
    	
    	synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
    }
    /**
     * �쎒 �냼耳볦씠 �떕�엳硫� �샇異쒕릺�뒗 �씠踰ㅽ듃
     */
    @OnClose
    public void handleClose(Session session){
        System.out.println("client is now disconnected...");
        clients.remove(session);
    }
    /**
     * �쎒 �냼耳볦씠 �뿉�윭媛� �굹硫� �샇異쒕릺�뒗 �씠踰ㅽ듃
     * @param t
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
}