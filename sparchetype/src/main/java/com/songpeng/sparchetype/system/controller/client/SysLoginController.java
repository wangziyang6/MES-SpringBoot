package com.songpeng.sparchetype.system.controller.client;

import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.config.shiro.SpUsernamePasswordToken;
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

/**
 *
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Controller("clientSysLoginController")
public class SysLoginController {

	Logger log = LoggerFactory.getLogger(SysLoginController.class);

	/**
	 * 首页默认跳转到博客主页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping({"/", ""})
	public String welcomeUI(Model model) {
		return "redirect:/blog";
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
		// TODO loginType 字段用于后期拓展用
		UsernamePasswordToken token = new SpUsernamePasswordToken(username, password, "UserLogin");
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
			return Result.success();
		} catch (LockedAccountException e) {
			log.error("锁定的帐号", e);
			return Result.failure("锁定的帐号");
		} catch (DisabledAccountException e) {
			log.error("禁用的帐号", e);
			return Result.failure("禁用的帐号");
		} catch (UnknownAccountException e) {
			log.error("错误的帐号", e);
			return Result.failure("错误的帐号");
		} catch (ExcessiveAttemptsException e) {
			log.error("登录失败次数过多", e);
			return Result.failure("登录失败次数过多");
		}catch (IncorrectCredentialsException e) {
			log.error("错误的凭证", e);
			return Result.failure("错误的凭证");
		}catch (ExpiredCredentialsException e) {
			log.error("过期的凭证", e);
			return Result.failure("过期的凭证");
		}catch (AuthenticationException e) {
			log.error("用户或密码错误", e);
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
