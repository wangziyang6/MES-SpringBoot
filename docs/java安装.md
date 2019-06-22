### Centos7

1. 更新
    * `yum update`
2. 系统上搜索任何版本的已安装的JDK组件
    * `rpm -qa | grep -E '^open[jre|jdk]|j[re|dk]'`
3. 查看已安装的JAVA版本
    * `java -version`
4. 之前已经安装了JAVA ，请执行下列命令，将他们卸载
    * `yum remove java-1.6.0-openjdk`
    * `yum remove java-1.7.0-openjdk`
5. 查找java相关得列表
    * `yum -y list java`
6. 安装需要的版本
    * `yum install java-1.8.0-openjdk.x86_64`

### Windows
