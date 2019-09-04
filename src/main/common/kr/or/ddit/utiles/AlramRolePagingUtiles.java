package kr.or.ddit.utiles;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class AlramRolePagingUtiles {
	private int currentPage;			
	private int totalCount;				
	private int totalPage;				
	private int blockCount = 30;		
	private int blockPage = 10;			
	private int startPage;				
	private int endPage;				
	private int startCount;				
	private int endCount;				
	

	private String params = "";			
	private StringBuffer pageHtmls;		
	private HttpServletRequest request;
	
	public AlramRolePagingUtiles(int currentPage, int totalCount,
			HttpServletRequest request) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		
		pageHtmls = new StringBuffer();
		
		makePagenation();
	}

	 private void makePagenation() {
	      // 1. 전체 페이지 수
	      this.totalPage = (int) Math.ceil(this.totalCount / (double)this.blockCount);
	      if(this.totalPage == 0){
	         this.totalPage = 1;
	      }
	      
	      // 2. 해당 페이지의 시작 게시글 번호
	      //    해당 페이지의 끝 게시글 번호
	      this.startCount = this.totalCount - (this.currentPage - 1) * this.blockCount;
	      this.endCount = this.startCount - this.blockCount + 1;
	      if(this.endCount < 0){
	         this.endCount = 1;
	      }
	      
	      // 이전|1|2|3|4|5|다음
	      this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
	      this.endPage = this.startPage + this.blockPage - 1;
	      if(this.endPage > this.totalPage){
	         this.endPage = this.totalPage;
	      }
	      
	      String requestURI = request.getRequestURI();
	      
	      Enumeration<String> keys = request.getParameterNames();
	      while(keys.hasMoreElements()){
	        
	         String key = keys.nextElement();
	         if("currentPage".intern() != key.intern()){
	            String[] values = request.getParameterValues(key);
	            for(String value : values){
	               this.params += key + "=" + value + "&";
	            }
	         }
	      }
	      
	      this.pageHtmls.append("<div style='margin-top:10px;' class='d-flex justify-content-center'>");
	      this.pageHtmls.append("<ul class='pagination pagination-sm'>");
	      
	      // 이전|1|2|3|4|5|다음
	      
	      // 이전
	      if((this.currentPage - 1) == 0){
	         this.pageHtmls.append("<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>");
	      }else{                     //   /12/main.jsp?search_keycode=a&search_keyword=2&currentPage=1
	         this.pageHtmls.append("<li class ='page-item'><a class='page-link'  href='" + requestURI + "?" + params + "currentPage=" +
	                                       (this.currentPage - 1) + "'>이전</a></li>");
	      }
	      
	      // |1|2|3|4|5|
	      for(int i = this.startPage; i <= this.endPage; i++){
	         if(this.currentPage == i){
	            this.pageHtmls.append("<li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li>");
	         }else{
	            this.pageHtmls.append("<li  class ='page-item'><a class='page-link' href='" + requestURI + "?" + params + "currentPage=" + i + "'>" + i + "</a></li>");
	         }
	      }
	      
	      // 다음
	      if(this.currentPage < this.totalPage){
	         this.pageHtmls.append("<li class ='page-item'><a class='page-link'  href='" + requestURI + "?" + params + "currentPage=" +
	               (this.currentPage + 1) + "'>다음</a></li>");
	      }else{                     
	         this.pageHtmls.append("<li class ='page-item disabled'><a class='page-link'  href='#'>다음</a></li>");
	      }
	      
	      this.pageHtmls.append("</ul>");
	      this.pageHtmls.append("</div>");
	      
	   }

	public String getStartCount() {
		return String.valueOf(startCount);
	}

	public String getEndCount() {
		return String.valueOf(endCount);
	}

	public String getPageHtmls() {
		return pageHtmls.toString();
	}
	
	
}
