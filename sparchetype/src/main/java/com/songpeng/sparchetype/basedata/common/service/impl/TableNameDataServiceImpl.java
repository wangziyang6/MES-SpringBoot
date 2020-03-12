package com.songpeng.sparchetype.basedata.common.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.basedata.common.dto.CommonDto;
import com.songpeng.sparchetype.basedata.common.mapper.QueryTableNameDataMapper;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;
import com.songpeng.sparchetype.basedata.common.service.TableNameDataService;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;
import com.songpeng.sparchetype.basedata.service.ISpTableManagerItemService;
import com.songpeng.sparchetype.common.util.IdUtil;
import com.songpeng.sparchetype.system.entity.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        if(StringUtils.isEmpty(tableNameId))
        {
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
     * 基础数据通用保存
     *
     * @param request 通用数据传输
     */
    @Override
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
     * @param request 通用数据传输
     */
    @Override
    public void commonUpdate(HttpServletRequest request, SysUser user) {
        //拿到列
        String col = "";
        //拿到对应的值
        //拼接修改的SQL语句
        //执行mapper
    }
}
