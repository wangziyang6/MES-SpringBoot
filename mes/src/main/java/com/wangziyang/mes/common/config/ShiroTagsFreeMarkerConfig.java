package com.wangziyang.mes.common.config;

import com.jagregory.shiro.freemarker.ShiroTags;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.PostConstruct;

/**
 * @author SongPeng
 * @date 2019/10/28 17:15
 */
@Component
public class ShiroTagsFreeMarkerConfig {

	@Autowired
	private FreeMarkerConfigurer freeMarkerConfigurer;

	@PostConstruct
	public void setSharedVariable() throws Exception {
		freeMarkerConfigurer.getConfiguration().setSharedVariable("shiro", new ShiroTags());
	}
}
