package dto;

import dao.MemberDao;

public class Reply {

	// 필드
    private int r_no;  
    private String r_contents; 
    private int m_no;  
    private String r_date;  
    private int b_no;
    private String r_writer;
    
    // 빈 생성자
    public Reply() { }
    
    // 풀생성자
	public Reply(int r_no, String r_contents, int m_no, String r_date, int b_no) {
		this.r_no = r_no;
		this.r_contents = r_contents;
		this.m_no = m_no;
		this.r_date = r_date;
		this.b_no = b_no;
		this.r_writer=MemberDao.getmMemberDao().getmemberid(m_no);
	}
	
	// 등록받는 생성자
	public Reply(String r_contents, int m_no, int b_no) {
		this.r_contents = r_contents;
		this.m_no = m_no;
		this.b_no = b_no;
	}
	
	// get set 메소드
	public int getR_no() {return r_no;}
	public void setR_no(int r_no) {this.r_no = r_no;}
	public String getR_contents() {return r_contents;}
	public void setR_contents(String r_contents) {this.r_contents = r_contents;}
	public int getM_no() {return m_no;}
	public void setM_no(int m_no) {this.m_no = m_no;}
	public String getR_date() {return r_date;}
	public void setR_date(String r_date) {this.r_date = r_date;}
	public int getB_no() {return b_no;}
	public void setB_no(int b_no) {this.b_no = b_no;}
	public String getR_writer() {return r_writer;}
	public void setR_writer(String r_writer) {this.r_writer = r_writer;} 
}
