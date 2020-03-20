#初始化下拉框数据
```
var data = [
    {name: 'a', value: '1'},
    {name: 'b', value: '2'},
    {name: 'c', value: '3'}
];

$.each(data, function (index, item) {
    $('#js-id').append(new Option(item.name, item.value));
});
```