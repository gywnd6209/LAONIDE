package kr.or.ddit.aop;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.ReflectionUtils.FieldCallback;

/*
	BeanPostProcessor : 스프링 프레임워크는 설정 파일에 등록된 빈 클래스, 
						어노테이션 선언을 기초로 자동 빈 클래스를 인스턴스화하고
						default 싱글톤 패턴으로 인스턴스를 관리.
						==> 빈 클래스의 인스턴스화를 담당하는 자원(default DefaultBeanPostProcessor 활용)
						
	LogbackLoggerInjector : 사용자가 정의한 BeanPostProcessor
							스프링 프레임워크 내 빈 클래스 인스턴스화 과정에 참여.
*/
@Component
public class LogbackLoggerInjector implements BeanPostProcessor {

	@Override
	public Object postProcessAfterInitialization(Object bean, String beanName)
			throws BeansException {
		// 빈 클래스의 인스턴스화 직후 콜백.
		// 파라메터 1. 금번에 인스턴스화가 완료된 bean클래스의 인스턴스
		//		 2. 해당 bean클래스의 빈 등록시의 name속성
		return bean;
	}

	@Override
	public Object postProcessBeforeInitialization(final Object bean, String beanName)
			throws BeansException {
		// 이번에 빈으로 등록되는 전역변수 중에.....
		// declaresException : 특정 메소드가 익셉션하는 거에 접근가능 
		// field : 인스턴스화하려는 클래스의 전역변수
		// method : 인스턴스화하려는 클래스의 메서드들
		// invoke : 실제 메서드 호출시
		// bean.getClass() : 현재 인스턴스화 되고 있는 빈 클래스의 타입
		
		// 인스턴스 대상 빈의 인스턴스 직전 콜백
		ReflectionUtils.doWithFields(bean.getClass(), new FieldCallback(){
			// 해당 빈의 전체 필드에 접근
			@Override
			public void doWith(Field field) throws IllegalArgumentException,
					IllegalAccessException {
				// 해당 빈 클래스 내 선언된 전역 변수의 개수만큼
				// FieldCallback. doWith() 메서드가 매번 콜백 첫번쨰 전역변수에도 두위드콜백, 두번째도 두위드 콜백...
				// 빈클래스 내 private 전역변수더라도 접근가능하다. public아닌 것도
				ReflectionUtils.makeAccessible(field);
				// 이번에 콜백되는 dowith에 로거블이선언되어있는지 확인하기
				if(field.getAnnotation(Loggable.class) != null){
					// 빈 클래스 내 선언된 전역변수 중 @Loggable이 선언된 전역변수가 존재시
					Logger logger = LoggerFactory.getLogger(bean.getClass());
					field.set(bean, logger);
					
				}
			}
		});
		return bean;
	}

}
