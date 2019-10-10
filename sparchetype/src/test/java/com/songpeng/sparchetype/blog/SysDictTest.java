package com.songpeng.sparchetype.blog;

import com.songpeng.sparchetype.common.entity.SysDict;
import com.songpeng.sparchetype.common.mapper.SysDictMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SysDictTest {

	private static final Logger LOGGER = LoggerFactory.getLogger(SysDictTest.class);

	@Autowired
	private SysDictMapper sysDictMapper;

	@Test
	public void testSelect() {
		LOGGER.info("----- selectAll method test ------");
		List<SysDict> sysDicts = sysDictMapper.selectList(null);
		//Assert.assertEquals(5, sysDicts.size());
		sysDicts.forEach(System.out::println);
	}
}
