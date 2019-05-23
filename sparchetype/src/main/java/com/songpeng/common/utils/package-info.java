/**
 在应用程序中，经常需要全局唯一的ID作为数据库主键。如何生成全局唯一ID？

 首先，需要确定全局唯一ID是整型还是字符串？如果是字符串，那么现有的UUID就完全满足需求，不需要额外的工作。缺点是字符串作为ID占用空间大，索引效率比整型低。

 如果采用整型作为ID，那么首先排除掉32位int类型，因为范围太小，必须使用64位long型。

 采用整型作为ID时，如何生成自增、全局唯一且不重复的ID？

 方案一：利用数据库的自增ID，从1开始，基本可以做到连续递增。Oracle可以用SEQUENCE，MySQL可以用主键的AUTO_INCREMENT，虽然不能保证全局唯一，但每个表唯一，也基本满足需求。

 数据库自增ID的缺点是数据在插入前，无法获得ID。数据在插入后，获取的ID虽然是唯一的，但一定要等到事务提交后，ID才算是有效的。有些双向引用的数据，不得不插入后再做一次更新，比较麻烦。

 第二种方式是采用一个集中式ID生成器，它可以是Redis，也可以是ZooKeeper，也可以利用数据库的表记录最后分配的ID。

 这种方式最大的缺点是复杂性太高，需要严重依赖第三方服务，而且代码配置繁琐。一般来说，越是复杂的方案，越不可靠，并且测试越痛苦。

 第三种方式是类似Twitter的Snowflake算法，它给每台机器分配一个唯一标识，然后通过时间戳+标识+自增实现全局唯一ID。这种方式好处在于ID生成算法完全是一个无状态机，无网络调用，高效可靠。缺点是如果唯一标识有重复，会造成ID冲突。

 Snowflake算法采用41bit毫秒时间戳，加上10bit机器ID，加上12bit序列号，理论上最多支持1024台机器每秒生成4096000个序列号，对于Twitter的规模来说够用了。

 但是对于绝大部分普通应用程序来说，根本不需要每秒超过400万的ID，机器数量也达不到1024台，所以，我们可以改进一下，使用更短的ID生成方式：

 53bitID由32bit秒级时间戳+16bit自增+5bit机器标识组成，累积32台机器，每秒可以生成65万个序列号，核心代码：

 private static synchronized long nextId(long epochSecond) {
 if (epochSecond < lastEpoch) {
 // warning: clock is turn back:
 logger.warn("clock is back: " + epochSecond + " from previous:" + lastEpoch);
 epochSecond = lastEpoch;
 }
 if (lastEpoch != epochSecond) {
 lastEpoch = epochSecond;
 reset();
 }
 offset++;
 long next = offset & MAX_NEXT;
 if (next == 0) {
 logger.warn("maximum id reached in 1 second in epoch: " + epochSecond);
 return nextId(epochSecond + 1);
 }
 return generateId(epochSecond, next, SHARD_ID);
 }
 时间戳减去一个固定值，此方案最高可支持到2106年。

 如果每秒65万个序列号不够怎么办？没关系，可以继续递增时间戳，向前“借”下一秒的65万个序列号。

 同时还解决了时间回拨的问题。

 机器标识采用简单的主机名方案，只要主机名符合host-1，host-2就可以自动提取机器标识，无需配置。

 最后，为什么采用最多53位整型，而不是64位整型？这是因为考虑到大部分应用程序是Web应用，如果要和JavaScript打交道，由于JavaScript支持的最大整型就是53位，超过这个位数，JavaScript将丢失精度。因此，使用53位整数可以直接由JavaScript读取，而超过53位时，就必须转换成字符串才能保证JavaScript处理正确，这会给API接口带来额外的复杂度。这也是为什么新浪微博的API接口会同时返回id和idstr的原因。
 */
package com.songpeng.common.utils;