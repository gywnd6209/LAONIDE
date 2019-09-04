package kr.or.ddit.vo;

public class CrewInfoVO {
	private String crew_no;
	private String team_join_date;
	private String grand_code;
	private String mem_id;
	private String pro_code;
	private String mem_nick;
	private String pro_name;
	private String pro_link;
	
	public String getPro_link() {
		return pro_link;
	}
	public void setPro_link(String pro_link) {
		this.pro_link = pro_link;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getCrew_no() {
		return crew_no;
	}
	public void setCrew_no(String crew_no) {
		this.crew_no = crew_no;
	}
	public String getTeam_join_date() {
		return team_join_date;
	}
	public void setTeam_join_date(String team_join_date) {
		this.team_join_date = team_join_date;
	}
	public String getGrand_code() {
		return grand_code;
	}
	public void setGrand_code(String grand_code) {
		this.grand_code = grand_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
}
