package io.renren.modules.app.annotation;

import java.lang.annotation.*;

/**
 * app登录效验
 * @author Administrator
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
}