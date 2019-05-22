package com.songpeng.system.mapper;

import com.songpeng.system.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    List<User> getPage(Map<String, Object> params);
}
