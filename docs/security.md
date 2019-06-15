```
<!--搜索框-->
<div class="row">
<th:block sec:authorize="hasAuthority('sys:user:query')">
    <div class="col-lg-12">
        <div class="form-inline" id="query">
            <div class="form-group">
                <label class="control-label">表名：</label>
                <input type="text" placeholder="请输入表名" name="name"
                       class="form-control iform-control">
            </div>
            <div class="form-group">
                <label class="control-label">表说明：</label>
                <input type="text" placeholder="请输入表说明" name="username"
                       class="form-control iform-control">
            </div>
            <div class="form-group">
                <label class="control-label">父表名：</label>
                <input type="text" placeholder="请输入父表名" name="username"
                       class="form-control iform-control">
            </div>
        </div>
    </div>
</th:block>
```