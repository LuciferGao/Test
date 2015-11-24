命令：
1.date	显示时间  
	可以有:	date +%Y/%m/%d   
		date +%H:%M
2.cal	显示本月日历
	cal [month] [year]
	cal 年份	显示该年的日历
 	cal 2 2003	显示2003年2月的日历
3.bc	计算器
	bc默认只显示整数
	在bc中输入，scale=number ,显示number位小数
4.who	查看谁在线
5.netstat -a	查看网络联机状态
6.ps -aux	查看背景执行的程序	


7.chgrp 群组名称 文件或目录	改变文件的群组（群组信息在/etc/group）
8.chown [-R] 帐号名称 文件或目录	改变文件的所有者（所有者必须在/etc/owner中）（如果要将目录下的子文件一起更改就加-R）
9.chmod [-R] xyz 文件或目录 	(xyz是权限，r:4 w:2 x:1 )
		eg: chmod 777 .gase

chmod	| u	|+(加入)	|
	| g	|		| r
	| o	|-(除去)	| w		文件或目录
	| a	|=(设定)	| x
		
10.cp [-drsu] [源文件] [目标文件]	复制文件
	-d :进行复制时,如果是复制到链接文件,若不加任何参数,则默认情况下会将链接到的源文件
	复制到目的地,若加-d,则链接文件可原封不动地将链接这个快捷方式复制到目的地。
	-r :可以进行目录的复制。
	-s :做成链接文件,与ln指令功能相同。
	-u, --update:如果源文件较新,或者没有目标文件,才会进行复制动作。可用于备份操作。
	cp .bashrc bashrc
		将.bashrc复制成bashrc文件!
	cp -r /bin /tmp/bin
		这个功能用来复制整个目录的参数!
	cp -s .bashrc bashrc.cp
		建立一个链接文件,文件名为bashrc.cp
	cp -u /root/.bashrc /home/test/.bashrc
		先检查/home/.bashrc与.bashrc是否相同,如果不同就复制一份;如果相同则不做任何动作!
11.rm [-fir] [文件名]
	-i	:提供用户确认，是默认值
	-r	:循环删除，直到没有东西为止
	-f	:强制删除
	cp .bashrc testing
	rmdir testing
		rmdir: `testing': Directory not empty
		由于testing中有.bashrc,所以不能删除
 	rm -rf testing
		连续删除该目录下的所有文件与目录
12.mv [-u] [源文件] [目标文件]
	参数说明:
	-u :同样,为update的简写,当源文件比目标文件还新时才会动作!
	范例:
		cp .bashrc bashrc
		mv bashrc bashrc.old <==也可以用来更改文件名
		mv bashrc bashrc2 /tmp <==将bashrc与bashrc2移到/tmp目录
		下。请注意,最后一个才是最终的目标文件,其他的都是源文件

13.文件查看命令
cat	由第一行开始显示文件内容
tac	从最后一行开始显示,可以看出,tac是cat的倒写
more	一页一页地显示文件内容
less	与more类似,但其优点是,可以往前翻页
head	只看头几行
tail	只看末尾几行
nl	显示时同时输出行号
od	以二进制方式读取文件内容


14.umask umask用于指定当前用户在建立文件或目录时的属性默认值
	[root @test root]# umask
	0022
	[root@vbird test]# umask 002
	[root@vbird test]# umask
	0002
		(1)若用户建立的是“文件”,则默认没有可执行(x)项,即只有rw这两个项,也就
		是最大为666(-rw-rw-rw);
		(2)若用户建立的是“目录”,则由于x与是否可以进入此目录有关,因此默认为所有
		权限均开放,亦即777(drwxrwxrwx)。
	umask指定的是“该默认值需要取消的权限”
	· 建立文件时:666-002 ==> (-rw-rw-rw-) – (--------w-) ==> -rw-rw-r--
	· 建立目录时:777-002 ==> (drwxrwxrwx) – (--------w-) ==> drwxrwxr-x
15.chattr
	chattr [+-=][ASacdistu] [文件或目录名称]
	参数说明:
	+-= :分别为“+”(增加)、“-”(减少)、“=”(设定)属性
	A	:当设定了属性A,这个文件(或目录)的存取时间atime (access)将不可被修改,可避免
		诸如手提电脑容易产生磁盘I/O错误的情况
	S	:这个功能有点类似sync,是将数据同步写入磁盘中,可以有效避免数据流失
	a	:设定a后,这个文件将只能增加数据而不能删除,只有root才能设定这个属性。
	c	:设定这个属性之后,将会自动将此文件压缩,在读取时自动解压缩。但是在存储的时候,会
		先进行压缩再存储(对于大文件很有用)
	d	:当dump(备份)程序被执行,设定d属性将可使该文件(或目录)具有dump功效
	i	这个参数可以让一个文件“不能被删除、更名、设定链接也无法写入或新增数据”,对于系
	统安全性有相当大的助益
	j	:当使用ext3文件系统格式时,设定j属性将使文件在写入时先记录在日志中,但是当
		filesystem设定参数为data=journalled时,由于已经设定了日志,所以这个属性无效
	s	:当文件设定了s参数时,它会被完全移出这个硬盘空间
	u	:与s相反,当使用u配置文件时,数据内容其实还存在于磁盘中,可以用来取消删除
 
16.lsattr 语法:lsattr [-aR]
	参数说明:
		-a :将隐藏文件的属性也显示出来
		-R :连同子目录的数据一并显示出来



搜寻文件或目录
	which	查看可执行文件的位置
	whereis	查看文件的位置
	ocate	配合数据库查看文件位置
	find	实际搜寻硬盘查询文件名称
17.which 语法:	which [文件名称]
参数说明:
	范例:
	[root @test /root]# which passwd
	/usr/bin/passwd
	which的基本功能是通过PATH环境变量到该路径内寻找可执行文件,所以基本的功能
	在于寻找可执行文件。

18.whereis
	语法:	whereis [-bmsu] [目录名称]
	参数说明:
	-b	:只找二进制文件
	-m	:只找在说明文件manual路径下的文件
	-s	:只找source源文件
	-u	:没有说明文档的文件!
	范例:
	[root @test /root]# whereis passwd
	passwd:/usr/bin/passwd/etc/passwd /usr/share/man/man1/passwd.1.bz2
	将passwd相关字的文件或目录都列出来。
	
	[root @test /root]# whereis -b passwd
	passwd: /usr/bin/passwd /etc/passwd
	仅列出二进制文件。

	[root @test /root]# whereis -m passwd
	passwd: /usr/share/man/man1/passwd.1.bz2
	仅搜寻man page所在的目录。
19.locate
	语法:	locate [目录名称]
	参数说明:
	范例:
	[root @test /root]# locate root
	......一大堆带有root字符串的文件都会显示出来
	[root @test /root]# updatedb
	立刻更新数据库
20.find 语法： find [路径] [参数]
	参数说明:
	1. 时间:
	-atime n	:将n*24小时内被存取过的文件列出来
	-ctime n	:将n*24小时内被改变、新增的文件或目录列出来
	-mtime n	:将n*24小时内被修改过的文件列出来
	-newer file 	:把比file还要新的文件列出来
	2. 使用名称:
	-gid n		:寻找群组ID为n的文件
	-group name 	:寻找群组名称为name的文件
	-uid n		:寻找拥有者ID为n的文件
	-user name 	:寻找用户名称为name的文件
	-name file 	:寻找文件名为file的文件名称(可以使用通配符)
	-type type 	:寻找文件属性为type的文件,type包含了b, c, d, p, l, s,

	范例:
		[root @test /root]# find / -name testing
		<==寻找文件名为testing
		[root @test /root]# find / -name 'test*'
		<==寻找文件名包含test的
		[root @test /root]# find . -ctime 1
		寻找当前目录下一天内新增的目录或文件
		[root @test /root]# find /home/test –newer .bashrc
		寻找/home/test目录下比.bashrc还要新的文件
		[root @test /root]# find /home -user test
		寻找/home下拥有者为test的文件
		[root @test /root]# find /dev -type b
		寻找/dev目录下文件属性为b的文件

















		
		
				
						


