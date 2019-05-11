/**
 * 这里放和异常相关的模型<br/>
 * 异常码需要继承通用异常码接口, {@link com.songpeng.common.lang.ex.CommonErrorCode}<br/>
 * 自定义异常需要继承通用异常接口, {@link com.songpeng.common.lang.ex.CommonException}<br/>
 * 非特别定制可以直接继承通用异常类, {@link com.songpeng.common.lang.ex.GenericException}<br/>
 * 如果想使用快速构造异常可以继承通用快速异常类, 但是会丢失异常堆栈信息, {@link com.songpeng.common.lang.ex.FastGenericException}<br/>
 * 自定义异常类需要配置<code> config/common.properties 中的 assertutil.exception.class.name项 </code>,
 * {@link com.songpeng.common.config.ConfigKeyEnum#ASSERTUTIL_EXCEPTION_CLASS_NAME}<br/>
 * 自定义异常与通用异常工具配合使用更佳, {@link com.songpeng.common.utils.AssertUtil}<br/>
 */
package com.songpeng.system;