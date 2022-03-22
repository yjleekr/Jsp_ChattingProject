package dto;

public class Member {
	
	// 필드
	private int m_no;  
    private String m_id;  
    private String m_nickname;  
    private String m_password; 
    private String m_name; 
    private String m_email; 
    private String m_phone; 
    private int m_grade; 
    private int m_logincheck; 
    private String m_img;
    
    //빈생성자
    public Member() {}
    
    //풀생성자
    public Member(int m_no, String m_id, String m_nickname, String m_password, String m_name, String m_email,
    	String m_phone, int m_grade, int m_logincheck,String m_img) {
        this.m_no = m_no;
        this.m_id = m_id;
        this.m_nickname = m_nickname;
        this.m_password = m_password;
        this.m_name = m_name;
        this.m_email = m_email;
        this.m_phone = m_phone;
        this.m_grade = m_grade;
        this.m_logincheck = m_logincheck;
        this.m_img = m_img;
    }
    
    //회원가입 생성자
    public Member(String m_id, String m_nickname, String m_password, String m_name,
    		String m_email, String m_phone,
			int m_grade, int m_logincheck, String m_img) {
		this.m_id = m_id;
		this.m_nickname = m_nickname;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_grade = m_grade;
		this.m_logincheck = m_logincheck;
		this.m_img = m_img;
	}
    
    // 회원 수정시 생성자
    public Member(String m_id,String m_nickname, String m_password, String m_img) {
    	this.m_id = m_id;
		this.m_nickname = m_nickname;
		this.m_password = m_password;
		this.m_img = m_img;
	}
    
    // 로그인
    public Member(int m_no, String m_id) {
		this.m_no = m_no;
		this.m_id = m_id;
	}
    
    
    // get, set 메소드
	public int getM_no() {return m_no;}
	public void setM_no(int m_no) {this.m_no = m_no;}
	public String getM_id() {return m_id;}
    public void setM_id(String m_id) {this.m_id = m_id;}
    public String getM_nickname() {return m_nickname;}
    public void setM_nickname(String m_nickname) {this.m_nickname = m_nickname;}
    public String getM_password() {return m_password;}
    public void setM_password(String m_password) {this.m_password = m_password;}
    public String getM_name() {return m_name;}
    public void setM_name(String m_name) {this.m_name = m_name;}
    public String getM_email() {return m_email;}
    public void setM_email(String m_email) {this.m_email = m_email;}
    public String getM_phone() {return m_phone;}
    public void setM_phone(String m_phone) {this.m_phone = m_phone;}
    public int getM_grade() {return m_grade;}
    public void setM_grade(int m_grade) {this.m_grade = m_grade;}
    public int getM_logincheck() {return m_logincheck;}
    public void setM_logincheck(int m_logincheck) {this.m_logincheck = m_logincheck;}
    public String getM_img() {return m_img;}
	public void setM_img(String m_img) {this.m_img = m_img;}

}
