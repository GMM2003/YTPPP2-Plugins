::YTP++ Luig Group Plugin v1.0
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
REN %VIDEO% temp.mp4

::Luig Group
%FFMPEG% -i "%TEMP%temp.mp4" -vf hue=h=-50:s=2 -map_metadata -1 -y "%TEMP%temp2.mp4"
%FFMPEG% -i "%TEMP%temp2.mp4" -af asetrate=44100*0.95,aresample=44100,atempo=1/0.95 -map_metadata -1 -y "%VIDEO%"

::Delete temporary files
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
