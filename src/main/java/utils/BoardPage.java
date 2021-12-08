package utils;

//게시판 목록 하단에 페이지 번호를 출력하기 위한 클래스
public class BoardPage {
	
	//매개변수(전체게시물갯수, 한페이지출력갯수, 한블럭당출력페이지수, 현재페이지번호, 현재페이지명)
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		
		String pagingStr ="";
		
		//전체페이지 수 계산
		int totalPages = (int)(Math.ceil(((double) totalCount / pageSize))); //전체 페이지수
		//int totalPages = ((totalCount / pageSize) + 1); //전체 페이지수
		
		//페이지 블럭의 첫번째 수를 계산
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		
		//이전 블럭으로 바로가기 링크 (첫번째 블럭에서는 숨김처리)
		//항상 바뀌는 파일명을 가져오기 위해 reqUrl
		if(pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>"; //1인 경우 이전 블록 안나옴
		}
		
		//각 페이지로 바로 가기 링크 (blockPage 수 만큼 출력됨)
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;"; //여기서 하이퍼링크를 없애는 것 같음
			}
			else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		//다음 블럭으로 바로가기 링크
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl +"?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
