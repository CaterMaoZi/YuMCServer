@ECHO OFF
setlocal ENABLEDELAYEDEXPANSION
set v=1.0.0
set v2=6
ver | findstr /i "10." > nul
if %errorlevel% equ 0 (
    set sysver=true
) else (
    set sysver=false
)
title 软件升级中.. %wjj% By:创想纪元 Version: %v%
if %sysver% == false (
	if not exist %systemdrive%\Windows\System32\wget.exe (
		echo 检测到系统为Windows 8.1/Server 2016以下版本，正在下载WGET引擎...
		PowerShell -Command "(new-object System.Net.WebClient).DownloadFile('http://x.x.x.x/wget.exe','%systemdrive%\Windows\System32\wget.exe')"
	))
set "name=%~p0"
set "name=%name:\= %"
for %%a in (%name%) do set wjj=%%a
if not exist Svst\MD.go (
	md Svst
	echo.>Svst\MD.go )
::=============
set oldcd=!cd!
cd Svst
echo 检查更新中...
if %sysver% == true (
curl -O -# http://x.x.x.x/up.html) else (
wget -q -O up.html http://x.x.x.x/up.html)
for /f "delims=" %%a in (up.html) do (
set ups=%%~a
)
	if %ups% gtr %v2% (
		set load=!cd!\call.bat
		if %sysver% == true (
		PowerShell -Command "wget -O %systemdrive%\御服开服器.exe http://x.x.x.x/御服开服器.exe") else (
		wget -q -O %systemdrive%\御服开服器.exe http://x.x.x.x/御服开服器.exe)
		echo @echo off>!load!
		echo del /f /s /q "!oldcd!\御服开服器.exe">>!load!
		echo copy %systemdrive%\御服开服器.exe "!oldcd!">>!load!
		echo exit>>!load!
		start !load!&exit)
title MC服务器启动: %wjj% By:创想纪元 Version: %v%
color 17
cd !oldcd!
if not exist Svst\Go.ini (
    goto :first ) else (
    goto :start ) 
:first
cls 
color ce
echo 检测到您是第一次在此目录下使用此开服器！
echo.
echo 进入新手教程并设置基础参数，请输入"Go"后按Enter!
echo.
echo 跳过新手教程和参数设置直接开始使用，请输入"Pass"后按Enter！
echo.
set fr=go
set /p fr=→
if %fr% == Go goto :jc
if %fr% == go goto :jc
if %fr% == Pass ( 
goto fpass
)
if %fr% == pass ( 
goto fpass
)
    cls
	color 47
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 2
	goto :first
:jc
cls 
color 5f
echo 欢迎来到新手教程！
echo 我将介绍这款开服器并带领你进行设置基础的参数！
pint -n 4 127.1>nul
cls
echo 这是一款由创想纪元开发的MC开服器！
echo.
echo 创想纪元服务器地址: Wdsj.Work
echo.
echo 创想纪元B站官方账号: uid510152186
echo.
ping -n 4 127.1>nul
cls
echo 接下来，让我们设置一下基础的参数！
ping -n 2 127.1>nul
echo 首先，让我们来设置内存符
echo.
:ssss
echo 请设置你的内存符，1G=1024M，要注意以后内存设置时不能使用小数,默认为M
echo.
set ncf=M
echo 请输入你要使用的内存符：(M/G)
echo.
set /p ncf=→
if %ncf% == M goto :ncm
if %ncf% == G goto :ncg
if %ncf% == m (
set ncf=M
goto :ncm )
if %ncf% == g (
set ncf=G
goto :ncg )
cls
    color 4f
	echo 您输入的内存符不存在！
	ping -n 3 127.1>nul
	color 56
    cls
	goto :ssss 
:ncg
set neicun=1
set jc1e=检测到您刚才使用的内存符为G，则此次设置的内存符也使用G。
goto :jc1
:ncm
set neicun=1024
set jc1e=检测到您刚才使用的内存符为M，则此次设置的内存符也使用M。
goto :jc1
:jc1
color 5f
cls 
echo 接下来，让我们来设置一下最大运行内存！
echo.
echo 默认的最大运行内存为%neicun%%ncf%(1G=1024M)
echo.
echo %jc1e%
echo.
echo 请不要让最大运行内存超过你电脑的总运行内存！
echo 您当前电脑的运行内存为:&systeminfo |findstr "物理内存"
echo.
set ncc1=%neicun%
echo 请输入你所需的 "最大运行内存" 如果不改变请直接按"Enter"
set /p ncc1=→
if %ncc1% == Pass goto :jc2
if %ncc1% == pass goto :jc2
	echo %ncc1%|findstr "[^0-9]">nul&&goto jc1f||goto jc1t
	:jc1t
	cls
    set neicun=%ncc1%
	echo 设置成功！您已将最大运行内存设置为：%neicun%%ncf%
	ping -n 3 127.1>nul
	goto :jxx
	:jc1f
	cls
	color 4f
	echo 错误:
	echo 这不是一个有效的数字！
	ping -n 4 127.0.0.1>nul
	goto jc1
:jxx
color 5f
echo.
set startneicun=0
cls
echo 接着，让我们来设置一下初始运行内存！
echo.
echo 默认的初始运行内存为0%ncf%
echo.
echo 请注意！不要让你的初始运行内存大于最大运行内存(!neicun!!ncf!)！
echo.
echo 请输入你开服所需的 "初始运行内存" 如果不改变请直接按"Enter"
echo.
set ncc=0
set /p ncc=→
if %ncc% == pass goto :jc1
if %ncc% == Pass goto :jc1
	echo %ncc%|findstr "[^0-9]">nul&&goto jc2f||goto jc2t
	:jc2t
    if %ncc% GEQ %neicun% ( goto :wearsetjxx ) else ( goto :jxxstsc )
	   :wearsetjxx
	    echo 警告！您设置的初始运行内存超过或等于你设置的最大运行内存！这样可能会导致服务器无法运行！
		echo.
		echo 继续设置请输入"Y",取消设置请输入"N"
		echo.
		set /p yn=→
		if %yn% == Y goto :jxxstsc
		if %yn% == y goto :jxxstsc
		if %yn% == N goto :jxx
		if %yn% == n goto :jxx
            color 47 
			cls
			echo 您的指令有误，我无法完成QwQ!
			timeout /t 3
		    goto :wearsetjxx
	:jc2f
	cls
	color 4f
	echo 错误:
	echo 这不是一个有效的数字！
	ping -n 4 127.0.0.1>nul
	goto jxx
	:jxxstsc
    set startneicun=%ncc%
	cls 
	echo 设置成功！您已将初始运行内存设置为：%startneicun%%ncf%
	ping -n 3 127.1>nul
	goto :jc2
:jc2
cls
dir *.jar /o-d /tc /B >Svst\core.ini do(
    goto :c )
:c
for /f "delims=" %%a in (Svst\core.ini) do (
set core=%%~a 
goto :jx
)
:jx
color 5f
cls
echo 然后，让我们来设置一下开服所需的核心！
echo.
echo 检测到您文件夹里所存在的核心为:%core% (如果为空或检测错误请手动填写)
echo.
echo 如要更改请输入要使用的核心(后缀为.jar)
echo.
echo 如果使用检测到的核心请直接按"Enter"
echo.
set jc1=%core%
echo 如果你还没有下载开服核心，请输入 Download 进行下载！
set /p jc1=→
if %jc1% == Pass goto :jc3
if %jc1% == pass goto :jc3
if %jc1% == Download goto :coredownload
if %jc1% == download goto :coredownload
    cls
	set core=%jc1%
	echo 设置成功！当前核心为%core%
	echo.>Svst\coredl.go
	ping -n 3 127.1>nul
	goto :jc3 
:coredownload
if %sysver% == true (set iio=CURL[Windows 10+]) else (set iio=WGET[Windows8.1-])
cls
echo		开服核心下载
echo.
echo ====================================
echo 输入选项编号后按Enter即可
echo [1]Spigot系列:老牌插件服务端，兼容性好，插件众多，优化性能高
echo [2]Paper系列:Spigot分支，高性能，兼容Spigot插件
echo [3]CatServer系列:高性能Bukkit与Forge混合的Minecraft服务端
echo.
echo [9]返回菜单
echo ====================================
echo 当前下载引擎模式: %iio%
echo.
set dlyc=kk
:dlk
set /p dlyc=→
if %dlyc% == 1 goto spigotdl
if %dlyc% == 2 goto paperdl
if %dlyc% == 3 goto catdl
if %dlyc% == 9 (
	if not exist Svst\coredl.go (
	goto jx) else (
	goto start))
if %dlyc% == kk goto coredownload
    cls
	color 47
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 2
	goto :coredownload
:catdl
cls
echo		开服核心下载 CatServer系列
echo.
echo ====================================
echo [1]CatServer 1.12.2
echo [2]CatServer 1.16.5[已合并至LoliServer进行开发]
echo [9]返回上一页
echo ====================================
set ctlk=kk
:ctlk
set /p ctlk=→
if %ctlk% == 1 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://catdl.rbqcloud.cn:8002/serverjar/CatServer-ab28211f-universal.jar) else (
		wget -O yufu-catserver-1.12.2.jar https://catdl.rbqcloud.cn:8002/serverjar/CatServer-ab28211f-universal.jar
		)
goto enddl )
if %ctlk% == 2 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://jenkins.rbqcloud.cn:30011/job/CatServer-1.16.5/lastSuccessfulBuild/artifact/projects/forge/build/libs/CatServer-1.16.5-7e2679e9-server.jar) else (
		wget -O yufu-catserver-1.16.5.jar https://jenkins.rbqcloud.cn:30011/job/CatServer-1.16.5/lastSuccessfulBuild/artifact/projects/forge/build/libs/CatServer-1.16.5-7e2679e9-server.jar
		)
goto enddl )
if %pplk% == 9 goto coredownload
if %pplk% == kk goto paperdl
    cls
	color 47
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 2
	goto :paperdl
:paperdl
cls
echo		开服核心下载 Paper系列
echo.
echo ====================================
echo 输入选项编号后按Enter即可
echo [1]Paper 1.8.8
echo [2]Paper 1.12.2
echo [3]Paper 1.14.2
echo [4]Paper 1.15
echo [9]返回上一页
echo ====================================
set pplk=kk
:pplk
set /p pplk=→
if %pplk% == 1 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar) else (
		wget -O yufu-paper-1.8.8.jar https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
		)
goto enddl )
if %pplk% == 2 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar) else (
		wget -O yufu-paper-1.12.2.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
		)
goto enddl )
if %pplk% == 3 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://api.papermc.io/v2/projects/paper/versions/1.14.2/builds/107/downloads/paper-1.14.2-107.jar) else (
		wget -O yufu-paper-1.14.2.jar https://api.papermc.io/v2/projects/paper/versions/1.14.2/builds/107/downloads/paper-1.14.2-107.jar
		)
goto enddl )
if %pplk% == 4 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://api.papermc.io/v2/projects/paper/versions/1.15/builds/21/downloads/paper-1.15-21.jar) else (
		wget -O yufu-paper-1.15.jar https://api.papermc.io/v2/projects/paper/versions/1.15/builds/21/downloads/paper-1.15-21.jar
		)
goto enddl )
if %pplk% == 9 goto coredownload
if %pplk% == kk goto paperdl
    cls
	color 47
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 2
	goto :paperdl
:spigotdl
cls
echo		开服核心下载 Spigot系列
echo.
echo ====================================
echo 输入选项编号后按Enter即可
echo [1]Spigot 1.16.5
echo [2]Spigot 1.17.1
echo [3]Spigot 1.18.2
echo [4]Spigot 1.19.3
echo [9]返回上一页
echo ====================================
set splk=kk
:splk
set /p splk=→
if %splk% == 9 goto :coredownload
if %splk% == 1 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://download.getbukkit.org/spigot/spigot-1.16.5.jar) else (
		wget -O yufu-spigot-1.16.5.jar https://download.getbukkit.org/spigot/spigot-1.16.5.jar
		)
goto enddl )
if %splk% == 2 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://download.getbukkit.org/spigot/spigot-1.17.1.jar) else (
		wget -O yufu-spigot-1.17.1.jar https://download.getbukkit.org/spigot/spigot-1.17.1.jar
		)
if %splk% == 3 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://download.getbukkit.org/spigot/spigot-1.18.2.jar) else (
		wget -O yufu-spigot-1.18.2.jar https://download.getbukkit.org/spigot/spigot-1.18.2.jar
		)
goto enddl )
if %splk% == 4 (
cd !cd!
	if %sysver% == true (
		curl -O -f https://download.getbukkit.org/spigot/spigot-1.19.3.jar) else (
		wget -O yufu-spigot-1.19.3.jar https://download.getbukkit.org/spigot/spigot-1.19.3.jar
		)
goto enddl )
if %splk% == kk goto spigotdl
    cls
	color 47
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 2
	goto :spigotdl
:enddl
cls
echo.
title MC服务器启动: %wjj% By:创想纪元 Version: %v%
echo 下载结束！
echo 您的核心已被下载至 !cd!\
echo.
echo.
echo 按任意键返回菜单！&pause
if not exist Svst\coredl.go (
	goto jc2) else (
	goto start)
:jc3
cls
color 5f
echo 服务器遇到问题要进行自动重启是很重要的！
echo.
echo 现在，让我们来设置一下关服后自动重启的时间(多少秒后自动重启)
echo.
echo 默认的时间为10秒，如果改变请输入数字，如果不改变请直接按"Enter"
echo.
set tm=reload
set /p tm=→
if %tm% == Pass goto :jc4
if %tm% == pass goto :jc4
if %tm% == reload (
set tmm=10
	echo 设置成功！您已将自动重启时间设置为!tmm!秒！
	ping -n 3 127.0.0.1>nul
	goto :jc4)
echo !tm!|findstr "[^0-9]">nul&&goto jc3er||goto jcj
:jcj
    cls
    set tmm=%tm%
	echo 设置成功！您已将自动重启时间设置为!tmm!秒！
	ping -n 3 127.0.0.1>nul
	goto :jc4
:jc3er
	cls
	color 4f
	echo 错误:
	echo 这不是一个有效的数字！
	ping -n 4 127.0.0.1>nul
	goto jc3
:jc4
cls
echo 正在从注册表获取Java路径中...
set dn=Java
set rp=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
for /f "tokens=*" %%l in ('reg query "%rp%\%%~na" /v "DisplayName"^|findstr /i "%dn%"') do (
call :show %%~na
)
)
::读取Java路径
:show
cls
for /f "tokens=* delims=:" %%b in ('reg query "%rp%\%1" /v "InstallLocation"^|findstr /i "InstallLocation"') do (set bb=%%b)
setlocal enabledelayedexpansion
for /f "delims=" %%a in ("%bb%") do (
  set "str=%%a"
  set "str=!str:*reg_sz=!"
  for /f "tokens=*" %%b in ("!str!") do set Java=%%~dpb
)
::分割Java路径
echo 接下来，让我们来设置你开服使用的Java路径
echo.
echo 检测到您电脑内Java.exe的路径为:%Java%bin\java.exe
echo.
echo 请输入要使用的Java所在的路径，如果使用检测到的路径请直接按"Enter"
echo.
set ss=air
set /p ss=→
if %ss% == Pass goto :setjava
if %ss% == pass goto :setjava
if %ss% == air goto setjava
    set Java=%ss%
	cls
	echo 设置成功！您已成功将Java路径设置为%Java%
	goto :over 
:setjava
cls
set Java=%Java%bin\java.exe
goto :over 
:over
cls 
color 2f 
echo 好了！你已经顺利通过了新手教程！
echo.
echo 你设置的初始运行内存为:!startneicun!!ncf!
echo.
echo 你设置的最大运行内存为:!neicun!!ncf!
echo.
echo 你设置的开服核心为:!core!
echo.
echo 您的自动重启时间为:!tmm!
echo.
echo 您的Java路径为:!Java!
echo !startneicun!>Svst\stnc.ini
echo !neicun!>Svst\nc.ini
echo !core!>Svst\core.ini
echo !tmm!>Svst\time.ini
echo !ncf!>Svst\ncf.ini
echo !Java!>Svst\Java.ini
ping -n 6 127.1.1.1>nul
echo.>Svst\Go.ini
goto :start
:start
echo eula=true>eula.txt
setlocal EnableDelayedExpansion
for /f "delims=" %%a in (Svst\core.ini) do (
set core=%%~a
)
for /f "delims=" %%a in (Svst\time.ini) do (
set tmm=%%~a
)
for /f "delims=" %%a in (Svst\stnc.ini) do (
set startneicun=%%~a
)
for /f "delims=" %%a in (Svst\nc.ini) do (
set neicun=%%~a
)
for /f "delims=" %%a in (Svst\ncf.ini) do (
set ncf=%%~a
)
for /f "delims=" %%a in (Svst\Java.ini) do (
set Java=%%~a
)
:fkm
cls
color 17
echo    菜单[输入选项编号后按Enter]
echo ====================================
echo                  ^|
echo [1]开服参数设置  ^|  [2]开启服务器
echo                  ^|
echo [3]下载          ^|  [4]其他设置
echo                  ^|               
echo ====================================
echo.
echo.
set in=air
set /p in=输入编号:
if %in% == 2 goto :server
if %in% == 1 goto :menuset
if %in% == 3 goto :downloadmenu
if %in% == 4 goto :setqt
if %in% == air goto fkm
    color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :start
:setqt
cls
color 17
echo   其他设置[输入选项编号后按Enter]
echo ====================================
echo                  ^|
echo [1]软件更新日志  ^|  [2]关于作者
echo                  ^|               
echo ====================================
echo.
echo 直接按Enter返回菜单
echo.
set in=back
set /p in=输入编号:
if %in% == 2 goto :zz
if %in% == 1 goto :updatalogs
if %in% == back goto fkm
    color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :start
:menuset
cls
color 17
echo  开服参数设置[输入选项编号后按Enter]
echo ====================================
echo                  ^|
echo [1]设置运行内存  ^|  [2]设置启动核心
echo                  ^|
echo [3]设置Java路径  ^|  [4]设置自动重启时间
echo                  ^|               
echo [5]返回菜单      ^|
echo                  ^|
echo ====================================
echo.
echo.
set /p in=输入编号:
if %in% == 1 goto :M
if %in% == 2 goto :Core
if %in% == 3 goto :Javaset
if %in% == 4 goto :settime
if %in% == 5 goto start
    color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :start
:downloadmenu
cls
color 17
echo    下载[输入选项编号后按Enter]
echo ====================================
echo                  ^|
echo [1]下载服务端    ^|  [2]下载启动核心
echo                  ^|
echo [3]返回菜单      ^|
echo                  ^|
echo ====================================
echo.
echo.
set /p in=输入编号:
if %in% == 1 goto :serverdownload
if %in% == 2 goto :coredownload
if %in% == 3 goto start
    color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :start
:serverdownload
cls
color 17
echo  服务端下载[输入选项编号后按Enter]
echo ====================================
echo                  ^|
echo 阿哦！暂无可用授权服务端┗^|｀O′^|┛ 
echo 如果您愿意，您可以将您的原创服务端提供给我们
echo 经过审核后，您的服务端将公开给大家使用！
echo 投稿地址: E-Mail:admin@cmcmc.icu
echo                  ^|
echo [1]返回菜单      ^|
echo                  ^|
echo ====================================
echo.
echo.
set /p in=输入编号:
if %in% == 1 goto :start
    color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :start
:zz
cls
color 16
echo ======================================
echo                御服
echo 作者:创想纪元
echo B站账号:uid510152186
echo QQ:3600873229
echo 当前版本:%v%
echo 喜欢的话就支持一下作者吧~
echo ======================================
echo.
echo 按任意键返回菜单
echo.
pause>nul
goto :start
:tc
cls 
color 4f
echo 正在保存所有设置中...
echo %startneicun%>Svst\stnc.ini
echo %neicun%>Svst\nc.ini
echo %core%>Svst\core.ini
echo %tmm%>Svst\time.ini
echo %ncf%>Svst\ncf.ini
echo %Java%>Svst\Java.ini
ping -n 2 127.1>nul
exit
:Javaset
cls
echo          设置Java路径
echo 您当前的Java路径为: %Java%
echo.
echo 如需更换路径请输入任意字符 但不要有空格
echo.
echo 如不改变请输入"Pass"
echo.
echo 如要使用自动扫描功能请输入Bot
echo.
set /p setc=→
if %setc% == Pass goto :start
if %setc% == pass goto :start
if %setc% == Bot goto :sao
if %setc% == bot goto :sao
cls
:qr
echo 设置新的路径之前,请确认你要设置的Java路径之中是否有空格?[Y/N]
set /p ynyn=→
if %ynyn% == n goto :js
if %ynyn% == N goto :js
if %ynyn% == Y goto :wejs
if %ynyn% == y goto :wejs
    color 47 
	cls
	echo 您的指令有误，请输入Y(是) / N(否) QwQ！
	timeout /t 3
	goto :qr
	:js
    cls 
	echo 请输入新的Java核心路径
	set /p newjava=→
	set Java=%newjava:"=%
	echo %Java%>Svst\Java.ini
	echo 设置成功！您已将路径设置为:%Java%
	ping -n 4 127.1>nul
	goto :start
	:wejs
	cls 
	color 4f
	echo 如果您的路径中含有空格！
	echo.
	echo 请在输入的路径前后加上  ”  ！
	echo.
	echo 如:  ”C:\Program Files\Java\jre6\bin\java.exe”
	echo.
	echo 按任意键开始设置路径! & pause
	goto :js
:settime
cls
echo          设置自动重启时间
echo 您当前的自动重启时间为%tmm%秒
echo.
echo 如需更换请输入,如不改变请输入"Pass"
echo.
set /p sstm=→
if %sstm% == Pass goto :M
if %sstm% == Pass goto :M
echo !sstm!|findstr "[^0-9]">nul&&goto timeer||goto settime
echo !sstm!>Svst\time.ini
echo 设置成功！您已将自动重启时间设置为%sstm%秒 
	set tmm=!sstm!
	echo %stt%>Svst\time.ini
	ping -n 3 127.1>nul
	goto :start 
	:timeer
	cls
	color 4f
	echo 错误:
	echo 这不是一个有效的数字！
	ping -n 4 127.0.0.1>nul
	goto settime
:Core
cls
echo          设置开服核心
echo.
echo 您当前使用的核心为%core%
echo.
echo 如需更换请输入核心名.jar,如不改变输入"Pass"
echo.
set /p cset=→
if %cset% == Pass goto :start
if %cset% == pass goto :start
    cls
    set core=%cset%
	echo %core%>Svst\core.ini
	echo 设置成功！您已将开服核心设置为%core%
	ping -n 3 127.1>nul
	goto :start
:M
color 97
cls
echo 当前初始运行内存为:%startneicun%%ncf%
echo.
echo 当前最大运行内存为:%neicun%%ncf%
echo.
echo [1]设置内存符 [2]设置初始运行内存 [3]设置最大运行内存 [4]查看当前计算机内存总量 [5]返回
echo.
set /p mm=→
if %mm% == 1 goto :setncf
if %mm% == 2 goto :setstnc
if %mm% == 3 goto :setnc
if %mm% == 4 goto :looknc
if %mm% == 5 goto :Mfh
color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :M 
:Mfh
goto :start
:looknc
cls
systeminfo |findstr "物理内存"
ping -n 5 127.1.1.1>nul
goto :M
:setnc
color 17
cls
echo                    最大运行内存设置
echo 您当前的最大运行内存为:%neicun%%ncf%
echo.
echo 请输入新的最大运行内存，如果不改变输入"Pass"
echo.
set /p setnc=→
if %setnc% == Pass goto :M
if %setnc% == pass goto :m
echo %setnc%|findstr "[^0-9]">nul&&goto ncer||goto ncjx
:ncjx
    cls
    set neicun=%setnc%
	echo !neicun!>Svst\nc.ini
	echo 您已成功将最大运行内存设置为%neicun%%ncf%
	ping -n 3 127.1>nul
	goto :M
	:ncer
	cls
	color 4f
	echo 错误:
	echo 这不是一个有效的数字！
	ping -n 4 127.0.0.1>nul
	goto setnc
:setstnc
color 17
cls
echo                    初始运行内存设置
echo 您当前的输入运行内存为:%startneicun%%ncf%
echo.
echo 您当前的最大运行内存为%neicun%%ncf%,请不要让初始运行内存超过或等于他
echo.
echo 请输入新的初始运行内存，如果不改变输入"Pass"
echo.
set /p setstnc=→
set aaa=%setstnc%
if %setstnc% == Pass goto :M
if %setstnc% == pass ( 
goto :M 
)
set ready=%setstnc%
set rd=%startneicun%
    cls
	echo %setstnc%|findstr "[^0-9]">nul&&goto ncer2||goto ncjx2
	:ncjx2
    if %ready% GEQ %neicun% ( goto :wearset ) else ( goto :jxset )
	   :wearset
	    echo 警告！您设置的初始运行内存超过或等于最大运行内存！这样可能会导致服务器无法运行！
		echo.
		echo 继续设置请输入"Y",取消设置请输入"N"
		echo.
		set /p yn=→
		if %yn% == Y goto :jxset
		if %yn% == y goto :jxset 
		if %yn% == N goto :rd
		if %yn% == n goto :rd
            color 47 
			cls
			echo 您的指令有误，我无法完成QwQ!
			timeout /t 3
		    goto :wearset 
	:jxset
	echo 您已成功将初始运行内存设置为%setstnc%%ncf%
	set tmd=%setstnc%
	set startneicun=%tmd%
	echo !startneicun!>Svst\stnc.ini
	ping -n 3 127.1>nul
	goto :M 
:ncer2
	cls
	color 4f
	echo 错误:
	echo 这不是一个有效的数字！
	ping -n 4 127.0.0.1>nul
	goto setstnc
:rd
set startneicun=%rd%
goto :M
:setncf
color 17
cls
echo                     内存符设置
echo 您当前使用的内存符为:%ncf%
echo.
echo 单位换算: 1G = 1024M
echo.
echo 请输入您要使用的内存符:(M/G)
echo.
set /p setncf=→
if %setncf% == M goto :setm
if %setncf% == m goto :setm
if %setncf% == G goto :setg
if %setncf% == g goto :setg
    color 47 
	cls
	echo 您的指令有误，我无法完成QwQ！
	timeout /t 3
	goto :setncf 
:setm
cls
set ncf=M
echo 您已成功将内存符设置为M!
ping -n 3 127.1>nul
echo %ncf%>Svst\ncf.ini
goto :M
:setg
cls
set ncf=G
echo %ncf%>Svst\ncf.ini
echo 您已成功将内存符设置为G！
ping -n 3 127.1>nul
goto :M
:server
cls
@echo.
@echo.                      MineCraft Server     
@echo.   Server Name: %name%
@echo. 
@echo.   注意:关闭服务器请输入 stop ，直接关闭窗口可能会丢失数据
@echo.  
@echo.   服务器日志: logs/latest.txt
@echo.

echo -  服务端初始内存/最大内存：%startneicun%%ncf%/%neicun%%ncf%  
@echo. 
echo -  Java路径:%Java%
@echo.
echo -  服务端核心:%core%  
@echo. 
"%Java%" -Xms%startneicun%%ncf% -Xmx%neicun%%ncf% -Dlog4j2.formatMsgNoLookups=true -jar %core% nogui
:sts
@echo.                    MineCraft Server Stop!   
@echo. 
echo  服务器将在%tmm%秒后自动重启  
@echo. 
@echo.   注意:等待时间过后或按任意键会自动重启，直接关掉窗口则为关服
@echo.  
@echo.   服务器日志: logs/latest.txt
@echo.
timeout %tmm%
goto server







:sao
cls
echo               Java路径自动扫描
echo 三秒后开始
ping -n 3 127.1>nul
echo 正在从注册表获取Java路径中...
set dn=Java
set rp=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
for /f "tokens=*" %%l in ('reg query "%rp%\%%~na" /v "DisplayName"^|findstr /i "%dn%"') do (
call :jss %%~na
)
)
:jss
cls
for /f "tokens=* delims=:" %%b in ('reg query "%rp%\%1" /v "InstallLocation"^|findstr /i "InstallLocation"') do (set bb=%%b)
setlocal enabledelayedexpansion
for /f "delims=" %%a in ("%bb%") do (
  set "str=%%a"
  set "str=!str:*reg_sz=!"
  for /f "tokens=*" %%b in ("!str!") do set jte=%%~dpb
)
echo.
echo 扫描完成！检测到您的Java路径为: %jte%bin\java.exe
echo.
echo 警告：如果上方检测到的路径为bin\java.exe,那就是注册表没有找到Java，请手动更换
echo.
echo 使用此路径请输入Y 返回请输入N
echo.
set /p jve=→
if %jve% == Y goto :jvgh
if %jve% == y goto :jvgh
if %jve% == N goto :Javaset
if %jve% == n goto :Javaset
:jvgh
cls
set Java=%jte%bin\java.exe
echo !Java!>Svst\Java.ini
echo 成功！您的Java路径已被更换为!Java!
ping -n 3 127.1>nul
goto :start
:fpass
cls
echo 正在扫描Java路径。。
set dn=Java
set rp=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
cls
for /f "tokens=*" %%l in ('reg query "%rp%\%%~na" /v "DisplayName"^|findstr /i "%dn%"') do (
cls
call :fjava %%~na
)
)
:fjava
cls
for /f "tokens=* delims=:" %%b in ('reg query "%rp%\%1" /v "InstallLocation"^|findstr /i "InstallLocation"') do (
cls
set bb=%%b)
for /f "delims=" %%a in ("%bb%") do (
cls
  set "str=%%a"
  cls
  set "str=!str:*reg_sz=!"
  cls
  for /f "tokens=*" %%b in ("!str!") do set jte=%%~dpb
  cls
)
cls
echo 10>Svst\stnc.ini
echo.>Svst\Go.ini
echo 1024>Svst\nc.ini
echo M>Svst\ncf.ini
echo.>Svst\coredl.go
echo 10>Svst\time.ini
echo !jte!bin\java.exe>Svst\Java.ini
dir *.jar /o-d /tc /B >Svst\core.ini do(
goto :fcore )
:fcore
for /f "delims=" %%a in (Svst\core.ini) do (
set core=%%~a 
echo !core!>Svst\core.ini
)
goto start
:updatalogs
cls
echo    软件更新日志[当前版本:%v%]
echo ==============================================
echo   版本号     更新日期         更新内容          
echo                  ^|
echo   1.0.0      2023/4/7        正式版发布
echo                  ^|               
echo                  ^|
echo ==============================================
echo.
echo 按Enter键返回菜单
echo.
pause>nul
goto start