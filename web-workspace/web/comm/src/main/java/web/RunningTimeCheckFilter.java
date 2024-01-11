package web; //20240111

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class RunningTimeCheckFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {
		
		// 서블릿/JSP 실행 전 시간 조회
		long startUnixTime = System.currentTimeMillis();
		
		filterChain.doFilter(req, res);
		
		// 서블릿/JSP 실행 후 시간 조회
		long endUnixTime = System.currentTimeMillis();
		
		// 두 시간 간의 간격 계산
		long runningTime = endUnixTime - startUnixTime;
		System.out.println("실행시간: " + runningTime + " 밀리초");
	}
}
