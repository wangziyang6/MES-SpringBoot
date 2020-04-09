package com.wangziyang.mes.basedata.common.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.common.dto.CommonDto;
import com.wangziyang.mes.basedata.common.mapper.QueryTableNameDataMapper;
import com.wangziyang.mes.basedata.common.request.QueryTableNameDataReq;
import com.wangziyang.mes.basedata.common.service.TableNameDataService;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;
import com.wangziyang.mes.basedata.service.ISpTableManagerItemService;
import com.wangziyang.mes.common.util.IdUtil;
import com.wangziyang.mes.system.entity.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 基础数据通用查询service
 *
 * @author wangziyang
 * @since 2020/03/11
 */
@Service
public class TableNameDataServiceImpl implements TableNameDataService {
    /**
     * 基础数据通用查询mpapper
     */
    @Autowired
    public QueryTableNameDataMapper queryTableNameDataMapper;
    /**
     * 查询配置表明细服务
     */
    @Autowired
    public ISpTableManagerItemService iSpTableManagerItemService;

    /**
     * 基础数据通用分页查询服务
     *
     * @param page 分页对象
     * @return 数据集合
     */
    @Override
    public IPage<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq page) throws Exception {
        page.setCol(buildCol(page.getTableNameId()));
        page.setRecords(queryTableNameDataMapper.queryTableNameDataList(page));
        return page;
    }

    /**
     * 根据前台传来的ID 查询数据
     *
     * @param commonDto 通用查询对象
     * @return 单行数据集合
     */
    @Override
    public List<Map<String, String>> queryTableNameById(CommonDto commonDto) throws Exception {
        commonDto.setCol(buildCol(commonDto.getTableNameId()));
        return queryTableNameDataMapper.queryTableNameById(commonDto);
    }

    /**
     * 根据表ID构建对应的查询列
     *
     * @param tableNameId 表明细关联ID
     * @return 构造好的列
     */
    @Override
    public String buildCol(String tableNameId) throws Exception {
        if (StringUtils.isEmpty(tableNameId)) {
            throw new Exception("表关联ID不能为空");
        }
        List<SpTableManagerItem> spTableManagerItems = iSpTableManagerItemService.queryItemBytableNameId(tableNameId);
        StringBuilder col = new StringBuilder();
        for (SpTableManagerItem spTableManagerItem : spTableManagerItems) {
            col.append(spTableManagerItem.getField() + ",");
        }
        //剔除拼接最后的一个逗号
        String lastCol = col.substring(0, col.length() - 1);
        return lastCol;
    }

    /**
     * 基础数据通用删除
     *
     * @param commonDto 通用数据传输
     * @throws Exception 异常
     */
    @Override
    public void commonDelete(CommonDto commonDto) throws Exception {
        queryTableNameDataMapper.commonDelete(commonDto);
    }

    /**
     * 基础数据通用新增
     *
     * @param request 请求数据
     * @param user    用户对象
     * @throws Exception 异常
     */
    @Override
    @Transactional
    public void commonSave(HttpServletRequest request, SysUser user) throws Exception {
        CommonDto commonDto = new CommonDto();
        //拼接插入的SQL语句
        String jsTableName = request.getParameter("jsTableName");
        String jsTableNameId = request.getParameter("jsTableNameId");
        //构造维护的列
        String colBuilds = buildCol(jsTableNameId);
        //构造通用的列
        colBuilds = colBuilds + ",id, create_username, create_time, update_username,update_time";
        //设置列
        commonDto.setCol(colBuilds);
        //拿到对应的值
        StringBuilder valueBuilder = new StringBuilder();
        List<SpTableManagerItem> spTableManagerItems = iSpTableManagerItemService.queryItemBytableNameId(jsTableNameId);
        for (SpTableManagerItem spTableManagerItem : spTableManagerItems) {
            String values = "'" + request.getParameter(spTableManagerItem.getField()) + "',";
            valueBuilder.append(values);
        }
        //设置通用的值
        String idVaule = "'" + IdUtil.nextId() + "'";
        String createUsername = ",'" + user.getUsername() + "'";
        String createTime = "," + "SYSDATE()";
        String updateUsername = ",'" + user.getUsername() + "'";
        String updateTime = "," + "SYSDATE()";
        valueBuilder.append(idVaule).append(createUsername).append(createTime).append(updateUsername).append(updateTime);
        commonDto.setValues(valueBuilder.toString());
        commonDto.setTableName(jsTableName);
        //执行mapper
        queryTableNameDataMapper.commonSave(commonDto);
    }

    /**
     * 基础数据通用修改
     *
     * @param request 请求数据
     * @param user    用户对象
     * @throws Exception 异常
     */
    @Override
    public void commonUpdate(HttpServletRequest request, SysUser user) throws Exception {
        //拿到列
        CommonDto commonDto = new CommonDto();
        String jsTableName = request.getParameter("jsTableName");
        String id = request.getParameter("id");
        String jsTableNameId = request.getParameter("jsTableNameId");
        //拼接修改的SQL语句
        //拿到对应的修改列和值
        StringBuilder valueBuilder = new StringBuilder();
        List<SpTableManagerItem> spTableManagerItems = iSpTableManagerItemService.queryItemBytableNameId(jsTableNameId);
        for (SpTableManagerItem spTableManagerItem : spTableManagerItems) {
            String values = spTableManagerItem.getField() + "=" + "'" + request.getParameter(spTableManagerItem.getField()) + "',";
            valueBuilder.append(values);
        }
        String updateUsername = "update_username=" + "'" + user.getUsername() + "',";
        String updateTime = "update_time=" + "SYSDATE()";
        valueBuilder.append(updateUsername).append(updateTime);
        commonDto.setTableName(jsTableName);
        commonDto.setCol(valueBuilder.toString());
        commonDto.setId(id);
        //执行mapper
        queryTableNameDataMapper.commonUpdate(commonDto);

    }
}
