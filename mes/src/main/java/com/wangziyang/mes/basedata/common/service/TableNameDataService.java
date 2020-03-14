package com.wangziyang.mes.basedata.common.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.common.dto.CommonDto;
import com.wangziyang.mes.basedata.common.request.QueryTableNameDataReq;
import com.wangziyang.mes.system.entity.SysUser;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author wangziyang
 * @since 2020/03/11
 * 基础数据通用CURD服务接口
 */
public interface TableNameDataService {
    /**
     * 基础数据通用分页查询服务
     *
     * @param req 列组合
     * @return 数据集合
     */
    IPage<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq req) throws Exception;

    /**
     * 根据前台传来的ID 查询数据
     *
     * @param commonDto 通用查询对象
     * @return 单行数据集合
     */
    List<Map<String, String>> queryTableNameById(CommonDto commonDto) throws Exception;

    /**
     * 拼接列功能
     *
     * @return 列
     */
    String buildCol(String tableNameId) throws Exception;

    /**
     * 基础数据通用存
     *
     * @param request 请求数据
     * @param user    用户对象
     * @throws Exception 异常
     */
    void commonSave(HttpServletRequest request, SysUser user) throws Exception;

    /**
     * 基础数据通用修改
     *
     * @param request 请求数据
     * @param user    用户对象
     * @throws Exception 异常
     */
    void commonUpdate(HttpServletRequest request, SysUser user) throws Exception;

    /**
     * 基础数据通用删除
     *
     * @param commonDto 通用对象
     * @throws Exception 异常
     */
    void commonDelete(CommonDto commonDto) throws Exception;
}
