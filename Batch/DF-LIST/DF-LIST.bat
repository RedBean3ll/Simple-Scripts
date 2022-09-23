ECHO OFF
ECHO Read local file

setlocal enabledelayedexpansion
	
	:: changedir
	pushd %*

	set num=0
	set me=DF-LIST.bat
	
	:: dir only
	ECHO ::::::::::::::::::::::DIRECTORIES::::::::::::::::::::::
	FOR /D %%D IN (*) DO (
		set /a num += 1
		echo !num!. %%D
	)
	
	ECHO ::::::::::::::::::::::FILES::::::::::::::::::::::
	::files only
	FOR %%F IN (*) DO (
		IF NOT %%F==%me% (
			set /a num += 1
			echo !num!. %%F
		)		
	)
	:: final tal
	echo.
	echo %num% files
	
	:: ret to orig dir
	popd
	
endlocal

::DIR /W /A:-D /O:N
PAUSE