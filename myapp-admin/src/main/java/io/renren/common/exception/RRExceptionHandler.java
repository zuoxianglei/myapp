package io.renren.common.exception;

import io.renren.common.utils.ReturnData;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

/**
 * 异常处理器
 *
 * @author Administrator
 */
@RestControllerAdvice
public class RRExceptionHandler {

	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(RRException.class)
	public ReturnData handleRRException(RRException e){
		ReturnData returnData = new ReturnData();
		returnData.put("code", e.getCode());
		returnData.put("msg", e.getMessage());

		return returnData;
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	public ReturnData handlerNoFoundException(Exception e) {
		logger.error(e.getMessage(), e);
		return ReturnData.error(404, "路径不存在，请检查路径是否正确");
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public ReturnData handleDuplicateKeyException(DuplicateKeyException e){
		logger.error(e.getMessage(), e);
		return ReturnData.error("数据库中已存在该记录");
	}

	@ExceptionHandler(AuthorizationException.class)
	public ReturnData handleAuthorizationException(AuthorizationException e){
		logger.error(e.getMessage(), e);
		return ReturnData.error("没有权限，请联系管理员授权");
	}

	@ExceptionHandler(Exception.class)
	public ReturnData handleException(Exception e){
		logger.error(e.getMessage(), e);
		return ReturnData.error();
	}
}
