package kr.or.ddit.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

@Component("logPrintAspect")
public class LogPrintUtil {
	@Loggable
	private static Logger logger;
	
	// Advice : 시점(언제) + pointcut(어디에)
	// pointcut : joinpoint(공통 코드에 관심을 가지는 빈클래스 내 메서드) 패키징
	public void theWholeJoinpointCallBefore(JoinPoint joinpoint){
		// pointcut으로 패키징된 개별 joinpoint(메서드) 호출 전에 weaving되는 aspect(분리된 공통코드) 정의
		// joinpoint(메서드)를 포함하는 빈클래스 정보
		// joinpoint.getTarget() : 조인포인트가 있는 클래스
		// 패키지 명 알아내기
		String beanClassName = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		this.logger.debug("target bean class : {} | joinpoint : {} 호출",
							beanClassName,
							joinpointName);
	
	}
	
	// joinpoint 종료 후 weaving되는 aspect
	public void theWholeJoinpointCallAfter(JoinPoint joinpoint){
		String beanClassName = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		this.logger.debug("target bean class : {} | joinpoint : {} 종료",
				beanClassName,
				joinpointName);
	}
	// joinpoint 호출 후 익셉션 발생시 weaving되는 aspect
	public void theWholeJoinpointCallThrowing(JoinPoint joinpoint, Exception ex){
		String beanClassName = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		this.logger.debug("target bean class : {} | joinpoint : {} 호출 후 {} 익셉션이 발생되었습니다.",
				beanClassName,
				joinpointName,
				ex.getMessage());
		
	}
	
	// joinpoint 호출 및 종료 후 weaving되는 aspect : 마치 필터처럼 작용하게 됨, 호출한번, 종료 후 한번
	public Object theWholeJoinpointCallAround(ProceedingJoinPoint joinpoint) throws Throwable{
		String beanClassName = joinpoint.getTarget().getClass().getName();
		String joinpointName = joinpoint.getSignature().getName();
		
		this.logger.debug("target bean class : {} | joinpoint : {} 호출되었고",
							beanClassName,
							joinpointName);
		
		Object returnValue =  joinpoint.proceed();
		
		this.logger.debug("target bean class : {} | joinpoint : {} 종료되었습니다.",
				beanClassName,
				joinpointName);
		
		return returnValue;
	}
}
