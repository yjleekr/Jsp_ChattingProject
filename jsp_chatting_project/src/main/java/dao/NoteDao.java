package dao;

import java.util.ArrayList;

import dto.Note;

public class NoteDao extends DB {

	
	public NoteDao() {
		super();
	}
	public static NoteDao noteDao = new NoteDao();
	public static NoteDao getNoteDao() {
		return noteDao;
	}
	
	// 쪽지 보내기
	public boolean notewrite(Note note) {
		String sql = "insert into note(n_contents,n_from,n_to,n_check) value(?,?,?,?)";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, note.getN_contents());
			preparedStatement.setInt(2, note.getN_from());
			preparedStatement.setInt(3, note.getN_to());
			preparedStatement.setInt(4, note.getN_check());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("notewrite db 오류");
		}
		return false;
	}
	
	//쪽지 총 개수 반환 
	public int notecount(int n_from ,int n_to) {
		String sql ;
		if(n_from==0) {
			sql="select count(*) from note where n_to="+n_to;
		}else {
			sql="select count(*) from note where n_from="+n_from+" and n_to="+n_to;
		}
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet= preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}else {
				return 0;
			}
		} catch (Exception e) {
			System.out.println("notecount db 오류");
		}
		return 0;
	}
	
	// 쪽지 출력
	public ArrayList<Note> notelist(int startrow, int listsize ,int m_no ,int n_from){
		
		ArrayList<Note> notes = new ArrayList<Note>();
		String sql=null;
		if(n_from==0) {
			sql ="select * from note where n_to="+m_no+" order by n_no DESC limit ? , ?";
		}else {
			sql ="select * from note where n_from="+n_from+" and n_to="+m_no+" order by n_no DESC limit ? , ?";
		}
		
		
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, startrow);
			preparedStatement.setInt(2, listsize);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Note note = new Note(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4), resultSet.getInt(5), resultSet.getString(6));
				notes.add(note);
			}
			return notes;
		} catch (Exception e) {
			System.out.println("notelist db 출력");
		}
		return notes;
	}
	
	//쪽지 삭제
	public boolean notedelete(int n_no) {
		String sql = "delete from note where n_no="+n_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	//쪽지 번호로 찾기
	public Note getnote(int n_no) {
		String sql = "select * from note where n_no="+n_no;
		Note note = new Note();
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()) {
				note = new Note(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3), 
						resultSet.getInt(4),resultSet.getInt(5), resultSet.getString(6));
				return note;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return note;
	}
	//쪽지 체크 업데이트 
	public void updaten_check(int n_no) {
		String sql = "update note set n_check=2 where n_no="+n_no;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println("updaten_check db 오류");
		}
	}
	
	//읽지않은 쪽지 개수 
	public int countN_check(int n_from , int n_to) {
		String sql = "SELECT count(n_check) from note where n_check=1 and n_from="+n_from+" and n_to="+n_to;
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet= preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("countN_check db 오류");
		}
		return 0;
	}
	
	
	
}
































