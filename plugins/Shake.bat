::YTP++ Shake Plugin v1.0
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

::Rename video to a temporary file
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp2.mp4
REN %VIDEO% temp.mp4

::Shake
%FFMPEG% -i "%TEMP%temp.mp4" -af vibrato=f=25:d=1 -y "%TEMP%temp2.mp4"
%FFMPEG% -i "%TEMP%temp2.mp4" -vf "[0:v]frei0r=filter_name=distort0r:filter_params=0.1|0.05|y|1[outv]" -pix_fmt yuv420p -shortest -y "%VIDEO%"

::Delete %TEMP%temporary files
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp2.mp4