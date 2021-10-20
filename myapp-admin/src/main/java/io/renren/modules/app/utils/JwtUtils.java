package io.renren.modules.app.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * jwt工具类
 * @author Administrator
 */
@ConfigurationProperties(prefix = "renren.jwt")
@Component
public class JwtUtils {

    // APP模块，是通过jwt认证的，如果要使用APP模块，则需要修改【加密秘钥】
    private Logger logger = LoggerFactory.getLogger(getClass());

    /** token秘钥，加密秘钥,请勿泄露，请勿随便修改 */
    private String secret = "VAK8DIevO9NijJVCfoC6PSBzmRJyCQYlI2fC8owh";
    // token有效时长，1小时，单位秒
    private long expire = 3600L;
    private String header = "token";

    /**
     * 生成jwt token
     */
    public String generateToken(long userId) {
        Date nowDate = new Date();
        //过期时间
        Date expireDate = new Date(nowDate.getTime() + expire * 1000);
        final String token = Jwts.builder()
                .setHeaderParam("typ", "JWT")
                .setSubject(userId + "")
                .setIssuedAt(nowDate)
                .setExpiration(expireDate)
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
        return token;
    }

    public Claims getClaimByToken(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        }catch (Exception e){
            logger.debug("validate is token error ", e);
            return null;
        }
    }

    /**
     * token是否过期
     * @return  true：过期
     */
    public boolean isTokenExpired(Date expiration) {
        return expiration.before(new Date());
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public long getExpire() {
        return expire;
    }

    public void setExpire(long expire) {
        this.expire = expire;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public static void main(String[] args) {
        final String s = RandomStringUtils.randomAlphanumeric(40);
        System.out.println("随机数" + s);
    }
}
