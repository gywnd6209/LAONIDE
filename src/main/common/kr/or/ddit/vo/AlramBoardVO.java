package kr.or.ddit.vo;

public class AlramBoardVO {

	private String alram_no      ;
	private String alram_content ;
	private String alram_date    ;
	private String pro_code      ;
	private String mem_id        ;
	private String alram_code    ;
	private String bo_writer    ;
	private String rnum    ;
	private String pri_code;
	private String bo_no;
	
	public String getBo_no() {
		return bo_no;
	}
	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}
	public String getPri_code() {
		return pri_code;
	}
	public void setPri_code(String pri_code) {
		this.pri_code = pri_code;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
	public String getAlram_no() {
		return alram_no;
	}
	public void setAlram_no(String alram_no) {
		this.alram_no = alram_no;
	}
	public String getAlram_content() {
		return alram_content;
	}
	public void setAlram_content(String alram_content) {
		this.alram_content = alram_content;
	}
	public String getAlram_date() {
		return alram_date;
	}
	public void setAlram_date(String alram_date) {
		this.alram_date = alram_date;
	}
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAlram_code() {
		return alram_code;
	}
	public void setAlram_code(String alram_code) {
		this.alram_code = alram_code;
	}
}
