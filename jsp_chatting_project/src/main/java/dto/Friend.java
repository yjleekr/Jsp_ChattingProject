package dto;

public class Friend {

	private int f_no;
	private int m_no1;
	private int m_no2;
	private int f_type;
	
	public Friend() {
		// TODO Auto-generated constructor stub
	}

	public Friend(int f_no, int m_no1, int m_no2, int f_type) {
		this.f_no = f_no;
		this.m_no1 = m_no1;
		this.m_no2 = m_no2;
		this.f_type = f_type;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public int getM_no1() {
		return m_no1;
	}

	public void setM_no1(int m_no1) {
		this.m_no1 = m_no1;
	}

	public int getM_no2() {
		return m_no2;
	}

	public void setM_no2(int m_no2) {
		this.m_no2 = m_no2;
	}

	public int getF_type() {
		return f_type;
	}

	public void setF_type(int f_type) {
		this.f_type = f_type;
	}
	
	
}
