package com.jcm.highlight.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcm.highlight.post.bo.PostBO;
import com.jcm.highlight.post.model.Post;
import com.jcm.highlight.post.model.PostDetail;

@Controller

@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	
	@GetMapping("/timeline_view")
	public String timelineView(Model model,
			HttpServletRequest request) {
		
		
		HttpSession session = request.getSession(); 
		int userId =(Integer)session.getAttribute("userId");
		  
		List<PostDetail> postList = postBO.getPostList(userId);
		model.addAttribute("postList",postList);
		
		
		 
	
		
		return "post/timelineView";
	}
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/createView";
	}
	
	//jsp로 전달할 수 있는 controller에서만 model사용가능(jstl을 사용하기 위해)
	@GetMapping("/mypage_view")
	public String mypage() {
		return "post/mypage";
	}
	
	/*
	근로계약서
	연봉, 근로시간, 업무
	
	연봉으로 퇴직금 결정 그리고 이직했을 때 내 연봉의 기준이됨 
	1/12 12개월로 연봉을 나누어 줌
	1/14 설, 추석 보너스로 연봉을 나눠줌(*로)
	퇴직금 포함 연봉(무조건 걸러)
	
	인센티브(보너스)
	
	연봉협상(통보)
	
	야근수당, 야간수당
	
	포괄임금제
	
	4대보험
	
	-건강보험
	-국민연금
	-고용보험
	-산재보험
	
	회사에서 반, 내가 반 지불
	
	 연차- 휴일을 연차로 치면 이제 불법
	 후가사유- 기한, 휴가사유:개인사유 
	 연차 사용할 때 사유를 물을 이유없음
	 
	퇴직
	 
	  이직할 회사가 있을 때
	  -갈데가 정해졌습니다
	  
	  이직할 회사가 없을 때
	  
	  인수인계 핑계로 퇴사일을 미루는 경우
	  한달 4주 전에 퇴사를 말하면  한달 후에 나가도 관계없음
	  
	  
	  퇴사메일 보내면 증거가 됨
	  
	  퇴직금
	  - 입사하자마자 퇴직연금
	  근속 연수*월급(최근3개월 평균)
	  해지하면 돈 받을 수 있고 아니면 퇴직 연금을 쌓는 것
	  
	  남은 휴가일을 돈으로 줌(날짜 꼭 세세요 몇일 빼서 계산할 수 있음)
	  
	 권고사직
	  
	  권고사직 처리해 주세요
	  업무내용 보고 거부
	  
	 실업급여
	  
	   회사망함
	   임금채불
	   계약불이행- 근로자가 증명해야함 너무 상이할 경우만
	   출퇴근 거리 멈 - 회사가 이동하는 경우
	   차별대우
	   
	  
	   
	   
	   
	  
	 */
	
	/*
	 포트 폴리오 
	 
	 5주
	 기획 설계 빨리해서 구상은 끝났어야 함 oven.app
	 로그인, 회원가입 데이터베이스 저장, 페이지 화면
	 메인 페이지 화면 , 기능
	 ****디테일 페이지 화면, 디테일 기능*****(가장 오래 걸릴 것)
	 *
	 포트폴리오롤 무엇을 할 수 있는지가 아니라 얼마나 이해하고 있고 얼마나 알고있는지에 대해 평가함
	 발전가능성이 좋은 사람 개념이 탄탄한 사람을 원함
	 
	 */
	
	
	
}
