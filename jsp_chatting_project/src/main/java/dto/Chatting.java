package dto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/chatting/{roomname}/{loginid}/{blocknames}") // 1.서버소켓[종작첨] ( 경로생성 )
public class Chatting {

	// * 접속된 세션(회원)을 저장하는 리스트 [ Arraylist vs Vector(동기화) ]
		static Map<String, Session> clients = new ConcurrentHashMap<String, Session>();
			
		// 2. 클라이언트가 서버로부터 접속 요청
		@OnOpen // 소켓 접속하는 어노테이션 
		public void onOpen( Session session ,@PathParam("roomname")String roomname,@PathParam("loginid")String loginid) throws IOException {
			//Set<Entry<String, Session>> entry = clients.entrySet();
			String enter =loginid+",time"+",enter";
			String out =loginid+",time"+",out";
			boolean check = false;
			boolean check2 = true;
			/*
			 * for(Entry<String, Session> ent : entry) { //방이름이 같으면서 아이디가 다르면 //로그인 아이디를
			 * 포함하는 클라이언트가 있으면 기존값 if(ent.getKey().contains(loginid)) {
			 * //clients.get(ent.getKey()).getBasicRemote().sendText(out);
			 * clients.remove(ent.getKey()); // 리스트에 제거 } }
			 */
			for(String key : clients.keySet()) {		
				if(key.split("@")[0].equals(roomname)&&key.split("@")[1].equals(loginid)) {
					clients.remove(key);
					check = true;
				}
			}
			if(check) {
				for(String key : clients.keySet()) {		
					if(key.split("@")[0].equals(roomname)) {
						clients.get(key).getBasicRemote().sendText(out);
					}
				}
			}
			
			String clientname = roomname+"@"+loginid;
			clients.put(clientname,session);	// 리스트에 추가
			if(check2) {
				for(String key : clients.keySet()) {
					if(key.split("@")[0].equals(roomname)&&!key.split("@")[1].equals(loginid)) {
						clients.get(key).getBasicRemote().sendText(enter);
						check2=false;
					}
				}
			}
			System.out.println("Onopen");
			//System.out.print( session.getId() ); // 세션 번호 확인 
			//System.out.print("현재 접속한 세션들 : " + clients ); // 현재 접속된 세션들 
		}
		
		// 3. 클라이언트가 서버로부터 접속 해지
		@OnClose // 소켓 닫는 어노테이션 
		public void onClose(Session session ,@PathParam("roomname")String roomname,@PathParam("loginid")String loginid) throws IOException {
			String out =loginid+",time"+",out";
			for(String key : clients.keySet()) {
				if(key.split("@")[0].equals(roomname)&&!key.split("@")[1].equals(loginid)) {
					clients.get(key).getBasicRemote().sendText(out);
				}else if(key.split("@")[0].equals(roomname)&&key.split("@")[1].equals(loginid)) {
					clients.remove(key);
				}
			}
		}
		
		// 4.서버가 클라이언트로부터 메시지 받는 메소드 
		@OnMessage	// 메시지를 받는 어노테이션 
		public void onMessage( String msg , Session session ,@PathParam("roomname")String roomname,@PathParam("loginid")String loginid, 
				@PathParam("blocknames")String blocknames)
		throws IOException {
			Random random = new Random();
			//차단 목록
			String[] blockarray = blocknames.split(",");
			//차단 언어
			String[] blockword = {"사랑해요","감사합니다","좋아해요"};
			for(int i =1; i<blockarray.length; i++) {
				System.out.println(blockarray[i]);
			}
			

			Set<Entry<String, Session>> entry = clients.entrySet();
			
//			for(Entry<String, Session> ent : entry)	{
//				if(ent.getKey().split("@")[0].equals(roomname)&&!ent.getKey().split("@")[1].equals(loginid)){
//							clients.get(ent.getKey()).getBasicRemote().sendText(msg);
//				}
//			}
			for(Entry<String, Session> ent : entry)	{
				if(ent.getKey().split("@")[0].equals(roomname)&&!ent.getKey().split("@")[1].equals(loginid)) {
					if(blocknames.equals(",")) {
						clients.get(ent.getKey()).getBasicRemote().sendText(msg);
					}
					for(int i =1; i<blockarray.length; i++) {
						int count =0;
						if(ent.getKey().split("@")[1].equals(blockarray[i])) {
							System.out.println("1");
							clients.get(ent.getKey()).getBasicRemote().sendText(msg+","+blockword[random.nextInt(blockword.length)]);
						}else if(count==1) {
							System.out.println("2");
							clients.get(ent.getKey()).getBasicRemote().sendText(msg);
							count++;
						}
					}
				}
			}
			
		}
}




























