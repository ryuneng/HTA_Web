package utils; //20231228

import java.time.LocalDate;
import java.util.Date;

public class DateUtils {
	public static Date toDate(String text) {
		// 날짜 형식의 텍스트를 파싱해서 LocalDate객체를 획득한다.
		LocalDate localDate = LocalDate.parse(text);
		// java.sql.Date의 valueOf(LocalDate localDate)를 실행해서
		// LocalDate객체로 java.sql.Date객체를 획득한다.
		// java.sql.Date는 java.util.Date의 하위 클래스이므로
		// java.util.Date로 클래스 형변환되어 반환된다.
		return java.sql.Date.valueOf(localDate);
	}
}
