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
title ���������.. %wjj% By:�����Ԫ Version: %v%
if %sysver% == false (
	if not exist %systemdrive%\Windows\System32\wget.exe (
		echo ��⵽ϵͳΪWindows 8.1/Server 2016���°汾����������WGET����...
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
echo ��������...
if %sysver% == true (
curl -O -# http://x.x.x.x/up.html) else (
wget -q -O up.html http://x.x.x.x/up.html)
for /f "delims=" %%a in (up.html) do (
set ups=%%~a
)
	if %ups% gtr %v2% (
		set load=!cd!\call.bat
		if %sysver% == true (
		PowerShell -Command "wget -O %systemdrive%\����������.exe http://x.x.x.x/����������.exe") else (
		wget -q -O %systemdrive%\����������.exe http://x.x.x.x/����������.exe)
		echo @echo off>!load!
		echo del /f /s /q "!oldcd!\����������.exe">>!load!
		echo copy %systemdrive%\����������.exe "!oldcd!">>!load!
		echo exit>>!load!
		start !load!&exit)
title MC����������: %wjj% By:�����Ԫ Version: %v%
color 17
cd !oldcd!
if not exist Svst\Go.ini (
    goto :first ) else (
    goto :start ) 
:first
cls 
color ce
echo ��⵽���ǵ�һ���ڴ�Ŀ¼��ʹ�ô˿�������
echo.
echo �������ֽ̳̲����û���������������"Go"��Enter!
echo.
echo �������ֽ̳̺Ͳ�������ֱ�ӿ�ʼʹ�ã�������"Pass"��Enter��
echo.
set fr=go
set /p fr=��
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
	echo ����ָ���������޷����QwQ��
	timeout /t 2
	goto :first
:jc
cls 
color 5f
echo ��ӭ�������ֽ̳̣�
echo �ҽ�������������������������û����Ĳ�����
pint -n 4 127.1>nul
cls
echo ����һ���ɴ����Ԫ������MC��������
echo.
echo �����Ԫ��������ַ: Wdsj.Work
echo.
echo �����ԪBվ�ٷ��˺�: uid510152186
echo.
ping -n 4 127.1>nul
cls
echo ������������������һ�»����Ĳ�����
ping -n 2 127.1>nul
echo ���ȣ��������������ڴ��
echo.
:ssss
echo ����������ڴ����1G=1024M��Ҫע���Ժ��ڴ�����ʱ����ʹ��С��,Ĭ��ΪM
echo.
set ncf=M
echo ��������Ҫʹ�õ��ڴ����(M/G)
echo.
set /p ncf=��
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
	echo ��������ڴ�������ڣ�
	ping -n 3 127.1>nul
	color 56
    cls
	goto :ssss 
:ncg
set neicun=1
set jc1e=��⵽���ղ�ʹ�õ��ڴ��ΪG����˴����õ��ڴ��Ҳʹ��G��
goto :jc1
:ncm
set neicun=1024
set jc1e=��⵽���ղ�ʹ�õ��ڴ��ΪM����˴����õ��ڴ��Ҳʹ��M��
goto :jc1
:jc1
color 5f
cls 
echo ��������������������һ����������ڴ棡
echo.
echo Ĭ�ϵ���������ڴ�Ϊ%neicun%%ncf%(1G=1024M)
echo.
echo %jc1e%
echo.
echo �벻Ҫ����������ڴ泬������Ե��������ڴ棡
echo ����ǰ���Ե������ڴ�Ϊ:&systeminfo |findstr "�����ڴ�"
echo.
set ncc1=%neicun%
echo ������������� "��������ڴ�" ������ı���ֱ�Ӱ�"Enter"
set /p ncc1=��
if %ncc1% == Pass goto :jc2
if %ncc1% == pass goto :jc2
	echo %ncc1%|findstr "[^0-9]">nul&&goto jc1f||goto jc1t
	:jc1t
	cls
    set neicun=%ncc1%
	echo ���óɹ������ѽ���������ڴ�����Ϊ��%neicun%%ncf%
	ping -n 3 127.1>nul
	goto :jxx
	:jc1f
	cls
	color 4f
	echo ����:
	echo �ⲻ��һ����Ч�����֣�
	ping -n 4 127.0.0.1>nul
	goto jc1
:jxx
color 5f
echo.
set startneicun=0
cls
echo ���ţ�������������һ�³�ʼ�����ڴ棡
echo.
echo Ĭ�ϵĳ�ʼ�����ڴ�Ϊ0%ncf%
echo.
echo ��ע�⣡��Ҫ����ĳ�ʼ�����ڴ������������ڴ�(!neicun!!ncf!)��
echo.
echo �������㿪������� "��ʼ�����ڴ�" ������ı���ֱ�Ӱ�"Enter"
echo.
set ncc=0
set /p ncc=��
if %ncc% == pass goto :jc1
if %ncc% == Pass goto :jc1
	echo %ncc%|findstr "[^0-9]">nul&&goto jc2f||goto jc2t
	:jc2t
    if %ncc% GEQ %neicun% ( goto :wearsetjxx ) else ( goto :jxxstsc )
	   :wearsetjxx
	    echo ���棡�����õĳ�ʼ�����ڴ泬������������õ���������ڴ棡�������ܻᵼ�·������޷����У�
		echo.
		echo ��������������"Y",ȡ������������"N"
		echo.
		set /p yn=��
		if %yn% == Y goto :jxxstsc
		if %yn% == y goto :jxxstsc
		if %yn% == N goto :jxx
		if %yn% == n goto :jxx
            color 47 
			cls
			echo ����ָ���������޷����QwQ!
			timeout /t 3
		    goto :wearsetjxx
	:jc2f
	cls
	color 4f
	echo ����:
	echo �ⲻ��һ����Ч�����֣�
	ping -n 4 127.0.0.1>nul
	goto jxx
	:jxxstsc
    set startneicun=%ncc%
	cls 
	echo ���óɹ������ѽ���ʼ�����ڴ�����Ϊ��%startneicun%%ncf%
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
echo Ȼ��������������һ�¿�������ĺ��ģ�
echo.
echo ��⵽���ļ����������ڵĺ���Ϊ:%core% (���Ϊ�ջ���������ֶ���д)
echo.
echo ��Ҫ����������Ҫʹ�õĺ���(��׺Ϊ.jar)
echo.
echo ���ʹ�ü�⵽�ĺ�����ֱ�Ӱ�"Enter"
echo.
set jc1=%core%
echo ����㻹û�����ؿ������ģ������� Download �������أ�
set /p jc1=��
if %jc1% == Pass goto :jc3
if %jc1% == pass goto :jc3
if %jc1% == Download goto :coredownload
if %jc1% == download goto :coredownload
    cls
	set core=%jc1%
	echo ���óɹ�����ǰ����Ϊ%core%
	echo.>Svst\coredl.go
	ping -n 3 127.1>nul
	goto :jc3 
:coredownload
if %sysver% == true (set iio=CURL[Windows 10+]) else (set iio=WGET[Windows8.1-])
cls
echo		������������
echo.
echo ====================================
echo ����ѡ���ź�Enter����
echo [1]Spigotϵ��:���Ʋ������ˣ������Ժã�����ڶ࣬�Ż����ܸ�
echo [2]Paperϵ��:Spigot��֧�������ܣ�����Spigot���
echo [3]CatServerϵ��:������Bukkit��Forge��ϵ�Minecraft�����
echo.
echo [9]���ز˵�
echo ====================================
echo ��ǰ��������ģʽ: %iio%
echo.
set dlyc=kk
:dlk
set /p dlyc=��
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
	echo ����ָ���������޷����QwQ��
	timeout /t 2
	goto :coredownload
:catdl
cls
echo		������������ CatServerϵ��
echo.
echo ====================================
echo [1]CatServer 1.12.2
echo [2]CatServer 1.16.5[�Ѻϲ���LoliServer���п���]
echo [9]������һҳ
echo ====================================
set ctlk=kk
:ctlk
set /p ctlk=��
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
	echo ����ָ���������޷����QwQ��
	timeout /t 2
	goto :paperdl
:paperdl
cls
echo		������������ Paperϵ��
echo.
echo ====================================
echo ����ѡ���ź�Enter����
echo [1]Paper 1.8.8
echo [2]Paper 1.12.2
echo [3]Paper 1.14.2
echo [4]Paper 1.15
echo [9]������һҳ
echo ====================================
set pplk=kk
:pplk
set /p pplk=��
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
	echo ����ָ���������޷����QwQ��
	timeout /t 2
	goto :paperdl
:spigotdl
cls
echo		������������ Spigotϵ��
echo.
echo ====================================
echo ����ѡ���ź�Enter����
echo [1]Spigot 1.16.5
echo [2]Spigot 1.17.1
echo [3]Spigot 1.18.2
echo [4]Spigot 1.19.3
echo [9]������һҳ
echo ====================================
set splk=kk
:splk
set /p splk=��
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
	echo ����ָ���������޷����QwQ��
	timeout /t 2
	goto :spigotdl
:enddl
cls
echo.
title MC����������: %wjj% By:�����Ԫ Version: %v%
echo ���ؽ�����
echo ���ĺ����ѱ������� !cd!\
echo.
echo.
echo ����������ز˵���&pause
if not exist Svst\coredl.go (
	goto jc2) else (
	goto start)
:jc3
cls
color 5f
echo ��������������Ҫ�����Զ������Ǻ���Ҫ�ģ�
echo.
echo ���ڣ�������������һ�¹ط����Զ�������ʱ��(��������Զ�����)
echo.
echo Ĭ�ϵ�ʱ��Ϊ10�룬����ı����������֣�������ı���ֱ�Ӱ�"Enter"
echo.
set tm=reload
set /p tm=��
if %tm% == Pass goto :jc4
if %tm% == pass goto :jc4
if %tm% == reload (
set tmm=10
	echo ���óɹ������ѽ��Զ�����ʱ������Ϊ!tmm!�룡
	ping -n 3 127.0.0.1>nul
	goto :jc4)
echo !tm!|findstr "[^0-9]">nul&&goto jc3er||goto jcj
:jcj
    cls
    set tmm=%tm%
	echo ���óɹ������ѽ��Զ�����ʱ������Ϊ!tmm!�룡
	ping -n 3 127.0.0.1>nul
	goto :jc4
:jc3er
	cls
	color 4f
	echo ����:
	echo �ⲻ��һ����Ч�����֣�
	ping -n 4 127.0.0.1>nul
	goto jc3
:jc4
cls
echo ���ڴ�ע����ȡJava·����...
set dn=Java
set rp=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
for /f "tokens=*" %%l in ('reg query "%rp%\%%~na" /v "DisplayName"^|findstr /i "%dn%"') do (
call :show %%~na
)
)
::��ȡJava·��
:show
cls
for /f "tokens=* delims=:" %%b in ('reg query "%rp%\%1" /v "InstallLocation"^|findstr /i "InstallLocation"') do (set bb=%%b)
setlocal enabledelayedexpansion
for /f "delims=" %%a in ("%bb%") do (
  set "str=%%a"
  set "str=!str:*reg_sz=!"
  for /f "tokens=*" %%b in ("!str!") do set Java=%%~dpb
)
::�ָ�Java·��
echo ���������������������㿪��ʹ�õ�Java·��
echo.
echo ��⵽��������Java.exe��·��Ϊ:%Java%bin\java.exe
echo.
echo ������Ҫʹ�õ�Java���ڵ�·�������ʹ�ü�⵽��·����ֱ�Ӱ�"Enter"
echo.
set ss=air
set /p ss=��
if %ss% == Pass goto :setjava
if %ss% == pass goto :setjava
if %ss% == air goto setjava
    set Java=%ss%
	cls
	echo ���óɹ������ѳɹ���Java·������Ϊ%Java%
	goto :over 
:setjava
cls
set Java=%Java%bin\java.exe
goto :over 
:over
cls 
color 2f 
echo ���ˣ����Ѿ�˳��ͨ�������ֽ̳̣�
echo.
echo �����õĳ�ʼ�����ڴ�Ϊ:!startneicun!!ncf!
echo.
echo �����õ���������ڴ�Ϊ:!neicun!!ncf!
echo.
echo �����õĿ�������Ϊ:!core!
echo.
echo �����Զ�����ʱ��Ϊ:!tmm!
echo.
echo ����Java·��Ϊ:!Java!
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
echo    �˵�[����ѡ���ź�Enter]
echo ====================================
echo                  ^|
echo [1]������������  ^|  [2]����������
echo                  ^|
echo [3]����          ^|  [4]��������
echo                  ^|               
echo ====================================
echo.
echo.
set in=air
set /p in=������:
if %in% == 2 goto :server
if %in% == 1 goto :menuset
if %in% == 3 goto :downloadmenu
if %in% == 4 goto :setqt
if %in% == air goto fkm
    color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :start
:setqt
cls
color 17
echo   ��������[����ѡ���ź�Enter]
echo ====================================
echo                  ^|
echo [1]���������־  ^|  [2]��������
echo                  ^|               
echo ====================================
echo.
echo ֱ�Ӱ�Enter���ز˵�
echo.
set in=back
set /p in=������:
if %in% == 2 goto :zz
if %in% == 1 goto :updatalogs
if %in% == back goto fkm
    color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :start
:menuset
cls
color 17
echo  ������������[����ѡ���ź�Enter]
echo ====================================
echo                  ^|
echo [1]���������ڴ�  ^|  [2]������������
echo                  ^|
echo [3]����Java·��  ^|  [4]�����Զ�����ʱ��
echo                  ^|               
echo [5]���ز˵�      ^|
echo                  ^|
echo ====================================
echo.
echo.
set /p in=������:
if %in% == 1 goto :M
if %in% == 2 goto :Core
if %in% == 3 goto :Javaset
if %in% == 4 goto :settime
if %in% == 5 goto start
    color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :start
:downloadmenu
cls
color 17
echo    ����[����ѡ���ź�Enter]
echo ====================================
echo                  ^|
echo [1]���ط����    ^|  [2]������������
echo                  ^|
echo [3]���ز˵�      ^|
echo                  ^|
echo ====================================
echo.
echo.
set /p in=������:
if %in% == 1 goto :serverdownload
if %in% == 2 goto :coredownload
if %in% == 3 goto start
    color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :start
:serverdownload
cls
color 17
echo  ���������[����ѡ���ź�Enter]
echo ====================================
echo                  ^|
echo ��Ŷ�����޿�����Ȩ����˩�^|��O��^|�� 
echo �����Ը�⣬�����Խ�����ԭ��������ṩ������
echo ������˺����ķ���˽����������ʹ�ã�
echo Ͷ���ַ: E-Mail:admin@cmcmc.icu
echo                  ^|
echo [1]���ز˵�      ^|
echo                  ^|
echo ====================================
echo.
echo.
set /p in=������:
if %in% == 1 goto :start
    color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :start
:zz
cls
color 16
echo ======================================
echo                ����
echo ����:�����Ԫ
echo Bվ�˺�:uid510152186
echo QQ:3600873229
echo ��ǰ�汾:%v%
echo ϲ���Ļ���֧��һ�����߰�~
echo ======================================
echo.
echo ����������ز˵�
echo.
pause>nul
goto :start
:tc
cls 
color 4f
echo ���ڱ�������������...
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
echo          ����Java·��
echo ����ǰ��Java·��Ϊ: %Java%
echo.
echo �������·�������������ַ� ����Ҫ�пո�
echo.
echo �粻�ı�������"Pass"
echo.
echo ��Ҫʹ���Զ�ɨ�蹦��������Bot
echo.
set /p setc=��
if %setc% == Pass goto :start
if %setc% == pass goto :start
if %setc% == Bot goto :sao
if %setc% == bot goto :sao
cls
:qr
echo �����µ�·��֮ǰ,��ȷ����Ҫ���õ�Java·��֮���Ƿ��пո�?[Y/N]
set /p ynyn=��
if %ynyn% == n goto :js
if %ynyn% == N goto :js
if %ynyn% == Y goto :wejs
if %ynyn% == y goto :wejs
    color 47 
	cls
	echo ����ָ������������Y(��) / N(��) QwQ��
	timeout /t 3
	goto :qr
	:js
    cls 
	echo �������µ�Java����·��
	set /p newjava=��
	set Java=%newjava:"=%
	echo %Java%>Svst\Java.ini
	echo ���óɹ������ѽ�·������Ϊ:%Java%
	ping -n 4 127.1>nul
	goto :start
	:wejs
	cls 
	color 4f
	echo �������·���к��пո�
	echo.
	echo ���������·��ǰ�����  ��  ��
	echo.
	echo ��:  ��C:\Program Files\Java\jre6\bin\java.exe��
	echo.
	echo ���������ʼ����·��! & pause
	goto :js
:settime
cls
echo          �����Զ�����ʱ��
echo ����ǰ���Զ�����ʱ��Ϊ%tmm%��
echo.
echo �������������,�粻�ı�������"Pass"
echo.
set /p sstm=��
if %sstm% == Pass goto :M
if %sstm% == Pass goto :M
echo !sstm!|findstr "[^0-9]">nul&&goto timeer||goto settime
echo !sstm!>Svst\time.ini
echo ���óɹ������ѽ��Զ�����ʱ������Ϊ%sstm%�� 
	set tmm=!sstm!
	echo %stt%>Svst\time.ini
	ping -n 3 127.1>nul
	goto :start 
	:timeer
	cls
	color 4f
	echo ����:
	echo �ⲻ��һ����Ч�����֣�
	ping -n 4 127.0.0.1>nul
	goto settime
:Core
cls
echo          ���ÿ�������
echo.
echo ����ǰʹ�õĺ���Ϊ%core%
echo.
echo ������������������.jar,�粻�ı�����"Pass"
echo.
set /p cset=��
if %cset% == Pass goto :start
if %cset% == pass goto :start
    cls
    set core=%cset%
	echo %core%>Svst\core.ini
	echo ���óɹ������ѽ�������������Ϊ%core%
	ping -n 3 127.1>nul
	goto :start
:M
color 97
cls
echo ��ǰ��ʼ�����ڴ�Ϊ:%startneicun%%ncf%
echo.
echo ��ǰ��������ڴ�Ϊ:%neicun%%ncf%
echo.
echo [1]�����ڴ�� [2]���ó�ʼ�����ڴ� [3]������������ڴ� [4]�鿴��ǰ������ڴ����� [5]����
echo.
set /p mm=��
if %mm% == 1 goto :setncf
if %mm% == 2 goto :setstnc
if %mm% == 3 goto :setnc
if %mm% == 4 goto :looknc
if %mm% == 5 goto :Mfh
color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :M 
:Mfh
goto :start
:looknc
cls
systeminfo |findstr "�����ڴ�"
ping -n 5 127.1.1.1>nul
goto :M
:setnc
color 17
cls
echo                    ��������ڴ�����
echo ����ǰ����������ڴ�Ϊ:%neicun%%ncf%
echo.
echo �������µ���������ڴ棬������ı�����"Pass"
echo.
set /p setnc=��
if %setnc% == Pass goto :M
if %setnc% == pass goto :m
echo %setnc%|findstr "[^0-9]">nul&&goto ncer||goto ncjx
:ncjx
    cls
    set neicun=%setnc%
	echo !neicun!>Svst\nc.ini
	echo ���ѳɹ�����������ڴ�����Ϊ%neicun%%ncf%
	ping -n 3 127.1>nul
	goto :M
	:ncer
	cls
	color 4f
	echo ����:
	echo �ⲻ��һ����Ч�����֣�
	ping -n 4 127.0.0.1>nul
	goto setnc
:setstnc
color 17
cls
echo                    ��ʼ�����ڴ�����
echo ����ǰ�����������ڴ�Ϊ:%startneicun%%ncf%
echo.
echo ����ǰ����������ڴ�Ϊ%neicun%%ncf%,�벻Ҫ�ó�ʼ�����ڴ泬���������
echo.
echo �������µĳ�ʼ�����ڴ棬������ı�����"Pass"
echo.
set /p setstnc=��
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
	    echo ���棡�����õĳ�ʼ�����ڴ泬���������������ڴ棡�������ܻᵼ�·������޷����У�
		echo.
		echo ��������������"Y",ȡ������������"N"
		echo.
		set /p yn=��
		if %yn% == Y goto :jxset
		if %yn% == y goto :jxset 
		if %yn% == N goto :rd
		if %yn% == n goto :rd
            color 47 
			cls
			echo ����ָ���������޷����QwQ!
			timeout /t 3
		    goto :wearset 
	:jxset
	echo ���ѳɹ�����ʼ�����ڴ�����Ϊ%setstnc%%ncf%
	set tmd=%setstnc%
	set startneicun=%tmd%
	echo !startneicun!>Svst\stnc.ini
	ping -n 3 127.1>nul
	goto :M 
:ncer2
	cls
	color 4f
	echo ����:
	echo �ⲻ��һ����Ч�����֣�
	ping -n 4 127.0.0.1>nul
	goto setstnc
:rd
set startneicun=%rd%
goto :M
:setncf
color 17
cls
echo                     �ڴ������
echo ����ǰʹ�õ��ڴ��Ϊ:%ncf%
echo.
echo ��λ����: 1G = 1024M
echo.
echo ��������Ҫʹ�õ��ڴ��:(M/G)
echo.
set /p setncf=��
if %setncf% == M goto :setm
if %setncf% == m goto :setm
if %setncf% == G goto :setg
if %setncf% == g goto :setg
    color 47 
	cls
	echo ����ָ���������޷����QwQ��
	timeout /t 3
	goto :setncf 
:setm
cls
set ncf=M
echo ���ѳɹ����ڴ������ΪM!
ping -n 3 127.1>nul
echo %ncf%>Svst\ncf.ini
goto :M
:setg
cls
set ncf=G
echo %ncf%>Svst\ncf.ini
echo ���ѳɹ����ڴ������ΪG��
ping -n 3 127.1>nul
goto :M
:server
cls
@echo.
@echo.                      MineCraft Server     
@echo.   Server Name: %name%
@echo. 
@echo.   ע��:�رշ����������� stop ��ֱ�ӹرմ��ڿ��ܻᶪʧ����
@echo.  
@echo.   ��������־: logs/latest.txt
@echo.

echo -  ����˳�ʼ�ڴ�/����ڴ棺%startneicun%%ncf%/%neicun%%ncf%  
@echo. 
echo -  Java·��:%Java%
@echo.
echo -  ����˺���:%core%  
@echo. 
"%Java%" -Xms%startneicun%%ncf% -Xmx%neicun%%ncf% -Dlog4j2.formatMsgNoLookups=true -jar %core% nogui
:sts
@echo.                    MineCraft Server Stop!   
@echo. 
echo  ����������%tmm%����Զ�����  
@echo. 
@echo.   ע��:�ȴ�ʱ��������������Զ�������ֱ�ӹص�������Ϊ�ط�
@echo.  
@echo.   ��������־: logs/latest.txt
@echo.
timeout %tmm%
goto server







:sao
cls
echo               Java·���Զ�ɨ��
echo �����ʼ
ping -n 3 127.1>nul
echo ���ڴ�ע����ȡJava·����...
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
echo ɨ����ɣ���⵽����Java·��Ϊ: %jte%bin\java.exe
echo.
echo ���棺����Ϸ���⵽��·��Ϊbin\java.exe,�Ǿ���ע���û���ҵ�Java�����ֶ�����
echo.
echo ʹ�ô�·��������Y ����������N
echo.
set /p jve=��
if %jve% == Y goto :jvgh
if %jve% == y goto :jvgh
if %jve% == N goto :Javaset
if %jve% == n goto :Javaset
:jvgh
cls
set Java=%jte%bin\java.exe
echo !Java!>Svst\Java.ini
echo �ɹ�������Java·���ѱ�����Ϊ!Java!
ping -n 3 127.1>nul
goto :start
:fpass
cls
echo ����ɨ��Java·������
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
echo    ���������־[��ǰ�汾:%v%]
echo ==============================================
echo   �汾��     ��������         ��������          
echo                  ^|
echo   1.0.0      2023/4/7        ��ʽ�淢��
echo                  ^|               
echo                  ^|
echo ==============================================
echo.
echo ��Enter�����ز˵�
echo.
pause>nul
goto start