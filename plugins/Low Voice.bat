::YTP++ Low Voice Plugin v1.0
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
REN %VIDEO% temp.mp4

::Low Voice
%FFMPEG% -i "%TEMP%temp.mp4" -vf hue=h=-180:s=1 -map_metadata -1 -y "%TEMP%temp2.mp4"
%FFMPEG% -i "%TEMP%temp2.mp4" -vf "transpose=1,split[main][tmp];[tmp]crop=iw:ih/2:0:0,vflip[flip];[main][flip]overlay=0:H/2,transpose=2" -map_metadata -1 -y "%TEMP%temp3.mp4"
%FFMPEG% -i "%TEMP%temp3.mp4" -vf setpts=1.33*PTS -af asetrate=33075,aresample=44100 -map_metadata -1 -y "%VIDEO%"

IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
IF EXIST %TEMP%temp3.mp4 DEL /F %TEMP%temp3.mp4
