package common;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

//@component를 포함하고 있는 annotation
//@controller annotation 포함 되있는 객체에서 에러발생했을때 처리하는 annotation
@ControllerAdvice
public class ErrorUtil {
	//500
	@ExceptionHandler(Exception.class)
	public String handlException(Exception e) {
		System.err.println("에러발생");
		System.err.println(e.getMessage());
		return "error/error1";
	}
	//404
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String notFound(NoHandlerFoundException e) {
		System.out.println("RequestMapping 오류");
		System.out.println(e.getMessage());
		return "error/error2";
	}
}