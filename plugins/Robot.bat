::YTP++ Robot Plugin v1.0
::Written by GMM2003
@ECHO OFF

::Set variables
SET VIDEO=%1
::SET WIDTH=%2
::SET HEIGHT=%3
SET TEMP=%4
SET FFMPEG=%5
::SET FFPROBE=%6
::SET MAGICK=%7
SET RESOURCES=%8
::SET SOUNDS=%9
SHIFT
::SET SOURCES=%9
SHIFT
SET MUSIC=%9

::Error message
IF "%MUSIC%"=="" (
	ECHO This is a YTP++ plugin, it may not be executed outside of the application.
	PAUSE
	EXIT /B
)

::Delete temporary files
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
IF EXIST %TEMP%temp3.mp4 DEL /F %TEMP%temp3.mp4
IF EXIST %TEMP%temp4.mp4 DEL /F %TEMP%temp4.mp4

::Rename video to a temporary file
REN %VIDEO% temp.mp4

::Robot
%FFMPEG% -i "%TEMP%temp.mp4" -c:v copy -af "aecho=1:1:10:1" -map_metadata -1 -y "%TEMP%temp2.mp4"
%FFMPEG% -i "%TEMP%temp2.mp4" -c:v copy -af "aecho=1:1:20:1" -map_metadata -1 -y "%TEMP%temp3.mp4"
%FFMPEG% -i "%TEMP%temp3.mp4" -c:v copy -af "aecho=1:1:30:1" -map_metadata -1 -y "%TEMP%temp4.mp4"
%FFMPEG% -i "%TEMP%temp4.mp4" -c:v copy -af "aecho=1:1:40:1" -map_metadata -1 -y "%VIDEO%"

::Delete %TEMP%temporary files
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
IF EXIST %TEMP%temp3.mp4 DEL /F %TEMP%temp3.mp4
IF EXIST %TEMP%temp4.mp4 DEL /F %TEMP%temp4.mp4