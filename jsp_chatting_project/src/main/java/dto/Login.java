package dto;

public class Login {

	private int m_no;
	private String m_id;
	
	public Login(int m_no, String m_id) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
}
