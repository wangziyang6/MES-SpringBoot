package com.wangziyang.mes.system.controller.client;

import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.common.util.RandomVerificationCodeUtil;
import com.wangziyang.mes.system.config.shiro.SpUsernamePasswordToken;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Controller("clientSysLoginController")
public class SysLoginController {

    Logger logger = LoggerFactory.getLogger(SysLoginController.class);

	/**
	 * 首页默认
	 *
	 * @param model
	 * @return
	 */
	@GetMapping({"/", ""})
	public String welcomeUI(Model model) {
		return "redirect:/admin/index";
	}

    /**
     * 生成验证码
     */
    @GetMapping(value = "/verification/code")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 设置相应类型,告诉浏览器输出的内容为图片
            response.setContentType("image/jpeg");
            // 设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomVerificationCodeUtil randomValidateCode = new RandomVerificationCodeUtil();
            // 输出验证码图片方法
            randomValidateCode.getRandcode(request, response);
        } catch (Exception e) {
            logger.error("获取验证码失败", e);
        }
    }

    /**
     * 登录页面
     *
     * @param model
     * @return
     */
    @GetMapping("/login-ui")
    public String loginUI(Model model) {
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(String username, String password, String captcha, String rememberMe, HttpServletRequest request) {
        //从session中获取随机数
        String random = (String) request.getSession().getAttribute(RandomVerificationCodeUtil.RANDOM_CODE_KEY);
        if (StringUtils.isBlank(captcha)) {
            return Result.failure("请输入验证码");
        }

        if (!random.equals(captcha)) {
            return Result.failure("请输入正确的验证码");
        }

        // TODO loginType 字段用于后期拓展用
        UsernamePasswordToken token = new SpUsernamePasswordToken(username, password, "UserLogin");
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return Result.success();
        } catch (LockedAccountException e) {
            logger.error("锁定的帐号", e);
            return Result.failure("锁定的帐号");
        } catch (DisabledAccountException e) {
            logger.error("禁用的帐号", e);
            return Result.failure("禁用的帐号");
        } catch (UnknownAccountException e) {
            logger.error("错误的帐号", e);
            return Result.failure("错误的帐号");
        } catch (ExcessiveAttemptsException e) {
            logger.error("登录失败次数过多", e);
            return Result.failure("登录失败次数过多");
        } catch (IncorrectCredentialsException e) {
            logger.error("密码错误", e);
            return Result.failure("密码错误");
        } catch (ExpiredCredentialsException e) {
            logger.error("过期的凭证", e);
            return Result.failure("过期的凭证");
        } catch (AuthenticationException e) {
            logger.error("用户或密码错误", e);
            return Result.failure("用户或密码错误");
        }
    }

    /**
     * 404页面
     *
     * @param model
     * @return
     */
    @GetMapping("/404-ui")
    public String error404UI(Model model) {
        return "404";
    }

    public static void main(String[] args) {
        String pwd = new Md5Hash("123", "admin", 3).toString();
        System.out.println(pwd);
    }
}
