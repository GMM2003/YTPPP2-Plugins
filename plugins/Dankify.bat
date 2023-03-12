::YTP++ Dankify Plugin v1.0
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
::SET RESOURCES=%8
SET SOUNDS=%9
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

::Rename video to a temporary file
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
IF EXIST %TEMP%temp3.mp4 DEL /F %TEMP%temp3.mp4
IF EXIST %TEMP%temp4.mp4 DEL /F %TEMP%temp4.mp4
IF EXIST %TEMP%temp5.mp4 DEL /F %TEMP%temp5.mp4
IF EXIST %TEMP%temp6.mp4 DEL /F %TEMP%temp6.mp4
IF EXIST %TEMP%temp7.mp4 DEL /F %TEMP%temp7.mp4
REN %VIDEO% temp.mp4

::Dankify
%FFMPEG% -i %TEMP%temp.mp4 -vf hue=h=0:s=10:b=1 -map_metadata -1 -y "%TEMP%temp2.mp4"
%FFMPEG% -i %TEMP%temp2.mp4 -vf hue=h=0:s=10:b=1 -map_metadata -1 -y "%TEMP%temp3.mp4"
%FFMPEG% -i %TEMP%temp3.mp4 -vf hue=h=0:s=10:b=1 -map_metadata -1 -y "%TEMP%temp4.mp4"
%FFMPEG% -i %TEMP%temp4.mp4 -vf hue=h=0:s=10 -map_metadata -1 -y "%TEMP%temp5.mp4"
%FFMPEG% -i %TEMP%temp5.mp4 -vf hue=h=0:s=10 -map_metadata -1 -y "%TEMP%temp6.mp4"
%FFMPEG% -i %TEMP%temp6.mp4 -af bass=g=50:f=100 -map_metadata -1 -y "%TEMP%temp7.mp4"
%FFMPEG% -i %TEMP%temp7.mp4 -c:v copy -af acrusher=.1:1:64:0:log -map_metadata -1 -y "%VIDEO%"

::Delete temporary files
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
IF EXIST %TEMP%temp3.mp4 DEL /F %TEMP%temp3.mp4
IF EXIST %TEMP%temp4.mp4 DEL /F %TEMP%temp4.mp4
IF EXIST %TEMP%temp5.mp4 DEL /F %TEMP%temp5.mp4
IF EXIST %TEMP%temp6.mp4 DEL /F %TEMP%temp6.mp4
IF EXIST %TEMP%temp7.mp4 DEL /F %TEMP%temp7.mp4