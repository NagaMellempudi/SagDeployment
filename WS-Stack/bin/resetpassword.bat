@echo off

rem ---------------------------------------------------------------------------
rem Script for resetting the Axis2 administration password
rem
rem Environment Variable Prequisites
rem
rem   JAVA_HOME       Must point at your Java Development Kit installation.
rem
rem   JAVA_OPTS       (Optional) Java runtime options 
rem ---------------------------------------------------------------------------

if "%OS%"=="Windows_NT" @setlocal
if "%OS%"=="WINNT" @setlocal

rem %~dp0 is expanded pathname of the current script under NT
set DEFAULT_AXIS2_HOME=%~dp0..

if "%AXIS2_HOME%"=="" set AXIS2_HOME=%DEFAULT_AXIS2_HOME%
set DEFAULT_AXIS2_HOME=

echo Using AXIS2_HOME   %AXIS2_HOME%

if exist "%AXIS2_HOME%\miscellaneous\lib\axis2-reset-password-tool.jar" goto checkJava

:noAxis2Home
echo AXIS2_HOME environment variable is set incorrectly or axis2-reset-password-tool.jar could not be located. 
echo Please set the AXIS2_HOME variable appropriately
goto end

:checkJava
set _JAVACMD=%JAVACMD%

if "%JAVA_HOME%" == "" goto noJavaHome
if not exist "%JAVA_HOME%\bin\java.exe" goto noJavaHome
if "%_JAVACMD%" == "" set _JAVACMD=%JAVA_HOME%\bin\java.exe

echo Using JAVA_HOME    %JAVA_HOME%

set CMD_LINE_ARGS=
:setArgs
if ""%1""=="""" goto runResetPassTool
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto setArgs

:noJavaHome
if "%_JAVACMD%" == "" set _JAVACMD=java.exe
echo JAVA_HOME environment variable is set incorrectly or Java runtime could not be located.
echo Please set the JAVA_HOME variable appropriately
goto end

:runResetPassTool
echo.
"%_JAVACMD%" %JAVA_OPTS% -jar "%AXIS2_HOME%\miscellaneous\lib\axis2-reset-password-tool.jar" %CMD_LINE_ARGS%
goto end

:end
set _JAVACMD=

if "%OS%"=="Windows_NT" @endlocal
if "%OS%"=="WINNT" @endlocal

:mainEnd
