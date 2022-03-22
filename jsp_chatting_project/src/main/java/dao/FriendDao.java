package dao;

import java.util.ArrayList;

import dto.Friend;

public class FriendDao extends DB {
	
	public FriendDao() {
		super();
	}
	
	public static FriendDao friendDao = new FriendDao();
	public static FriendDao getFriendDao() {
		return friendDao;
	}
	
	//친구 목록 불러오기
	public ArrayList<Friend> getfriendelist(int m_no ,int type) {
		ArrayList<Friend> arrayList = new ArrayList<Friend>();
		
			String sql = "select * from friend where f_type=1 and (m_no1="+m_no+" or m_no2="+m_no+")";
			if(type==2) {
				//나를 차단한 사람
				sql = "select * from friend where f_type=2 and m_no2="+m_no;
			}else if(type==3) {
				sql = "select * from friend where f_type=3 and m_no2="+m_no;
			}else if(type==4) {
				//내가 차단한 사람
				sql = "select * from friend where f_type=2 and m_no1="+m_no;
			}
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Friend friend = new Friend(resultSet.getInt(1),resultSet.getInt(2),
						resultSet.getInt(3),resultSet.getInt(4));
						arrayList.add(friend);
			}
			return arrayList;
		} catch (Exception e) {
			System.out.println("getfriendelist db 오류");
		}
		return arrayList;
	}
	
	//친구 목록 삭제
	public boolean deletefriende(int f_no) {
		String sql = "delete from friend where f_no="+f_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(" deletefriende db 오류");
		}
			return false;
	}
	
	//친구 요청하기 
	public boolean friendinvite(int from, int to) {
		String sql = "insert into friend(m_no1,m_no2,f_type) value("+from+","+to+",3)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("friendinvite db 오류");
		}return false;
	}
	
	//친구 요청 수락
	
	public boolean friendaccept(int type , int f_no) {
		String sql = null;
		try {
		if(type==1) {
			sql = "update friend set f_type=1 where f_no="+f_no;
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		}else {
			sql = "delete from friend where f_no="+f_no;
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return false;
		}
		} catch (Exception e) {
			System.out.println("friendaccept db 오류");
		}
		return false;
	}
	//친구요청수
	public int countinvite(int m_no) {
		String sql = "select count(*) from friend where f_type=3 and m_no2="+m_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet= preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("countinvite db 오류");
		}
		return 0;
	}
	
	// 차단하기
	public boolean blockid(int from, int to) {
		String sql = "insert into friend(m_no1,m_no2,f_type) value("+from+","+to+",2)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("blockid db 오류");
		}return false;
	}
	
	//친구번호 불러오기
	public int getf_no(int m_no1 , int m_no2) {
		String sql ="select f_no from friend where f_type=1 and m_no1="+m_no1+" and m_no2="+m_no2;
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}else {
				sql ="select f_no from friend where f_type=1 and m_no2="+m_no1+" and m_no1="+m_no2;
				preparedStatement=connection.prepareStatement(sql);
				resultSet=preparedStatement.executeQuery();
				if(resultSet.next()) {
					return resultSet.getInt(1);
				}
			}
		} catch (Exception e) {
			System.out.println("getf_no db 오류");
		}
		return 0;
	}
	

}


















