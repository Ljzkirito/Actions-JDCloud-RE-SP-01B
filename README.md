# Github Actions Padavan JDCloud_RE-SP-01B

- Padavan源码是[MeIsReallyBa/padavan-4.4](https://github.com/MeIsReallyBa/padavan-4.4)，[恩山介绍](https://www.right.com.cn/FORUM/thread-8287691-1-1.html)。
- Github Actions参考自[P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)&[hanwckf/scut_padavan_build](https://github.com/hanwckf/scut_padavan_build)。
- 编译目标为JDCLOUD-RE-SP-01B
- 默认登陆地址[192.168.5.1](http://192.168.5.1),登录名admin/admin


### 防火墙ipv6配置参考
- 关闭ipv6防火墙
```
ip6tables -F
ip6tables -X
ip6tables -P INPUT ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -P FORWARD ACCEPT
```
- 允许ipv6防火墙特定端口转发
```
ip6tables -A FORWARD -p tcp --dport 11899 -j ACCEPT
ip6tables -A FORWARD -p udp --dport 11899 -j ACCEPT
```
- 开放ipv6防火墙特定端口80/443
```
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 80 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 443 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 443 -j ACCEPT
```
按需选择，添加在`自定义设置——脚本——在防火墙规则启动后执行`
