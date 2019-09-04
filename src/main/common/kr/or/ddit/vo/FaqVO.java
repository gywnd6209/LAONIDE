package kr.or.ddit.vo;

public class FaqVO {
	private String bo_no;
	private String bo_que_title;
	private String bo_que_cont;
	private String bo_ans_cont;
	private String bo_date;
	private String bo_hit;
	private String bo_status;
	private String bo_writer;
	private String rnum;
	private String mem_id;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getBo_no() {
		return bo_no;
	}
	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}
	public String getBo_que_title() {
		return bo_que_title;
	}
	public void setBo_que_title(String bo_que_title) {
		this.bo_que_title = bo_que_title;
	}
	public String getBo_que_cont() {
		return bo_que_cont;
	}
	public void setBo_que_cont(String bo_que_cont) {
		this.bo_que_cont = bo_que_cont;
	}
	public String getBo_ans_cont() {
		return bo_ans_cont;
	}
	public void setBo_ans_cont(String bo_ans_cont) {
		this.bo_ans_cont = bo_ans_cont;
	}
	public String getBo_date() {
		return bo_date;
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}
	public String getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(String bo_hit) {
		this.bo_hit = bo_hit;
	}
	public String getBo_status() {
		return bo_status;
	}
	public void setBo_status(String bo_status) {
		this.bo_status = bo_status;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
}
