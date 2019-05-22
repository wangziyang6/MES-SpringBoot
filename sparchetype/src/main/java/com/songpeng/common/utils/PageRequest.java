package com.songpeng.common.utils;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Controller
 * Created by songpeng on 2019/5/21
 */
public class PageRequest implements Serializable {

    private static final long serialVersionUID = -8202259155259850600L;

    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String order;
    private String sort;
    private Map<String, Object> params = new HashMap();

    public PageRequest() {
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrder() {
        return this.order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return this.sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Map<String, Object> getParams() {
        String key;
        if (StringUtils.isNotEmpty(this.order)) {
            String[] orders = this.order.split(",");
            String[] sorts = this.sort.split(",");
            key = "";
            int i = 0;

            for (int j = orders.length; i < j; ++i) {
                key = StringUtils.assemblyString(new String[]{key, orders[i], " ", sorts[i], ","});
            }

            this.params.put("orderByClause", key.substring(0, key.length() - 1));
        }

        Iterator var6 = this.params.entrySet().iterator();

        while (true) {
            Object value;
            do {
                do {
                    do {
                        if (!var6.hasNext()) {
                            return this.params;
                        }

                        Map.Entry<String, Object> entry = (Map.Entry) var6.next();
                        key = (String) entry.getKey();
                        value = entry.getValue();
                    } while (value == null);
                } while (StringUtils.isBlank(String.valueOf(value)));

                if ((key.endsWith("IN") || key.endsWith("NI")) && value instanceof String) {
                    this.params.put(key, Arrays.asList(value.toString().split(",")));
                }
            } while (!key.endsWith("TimeEnd") && !key.endsWith("DateEnd"));

            if (String.valueOf(value).length() == 10) {
                this.params.put(key, DateUtils.formatDateTime(DateUtils.getDateEnd(DateUtils.parseDate(value))));
            }
        }
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
