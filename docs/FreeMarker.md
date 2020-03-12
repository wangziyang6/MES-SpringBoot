### FreeMarker 文档

* html 或者 js 中遍历 model 中的 `List<Map<String, Object>> result`

```
<#list result as map>
    <#list map?keys as key> //关键点
        console.log('${key}')
        console.log('${map[key]}')
    </#list>
</#list>
```