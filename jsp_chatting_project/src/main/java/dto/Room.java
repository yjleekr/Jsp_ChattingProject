package dto;

public class Room {

	private int r_no;
	private String r_name;
	private int r_count;
	
	public Room() {
		// TODO Auto-generated constructor stub
	}

	public Room(int r_no, String r_name, int r_count) {
		this.r_no = r_no;
		this.r_name = r_name;
		this.r_count = r_count;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	
}
