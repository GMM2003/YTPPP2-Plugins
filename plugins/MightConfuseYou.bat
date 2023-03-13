::YTP++ Might Confuse You Plugin v1.0
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
IF EXIST %TEMP%rev-v.mp4 DEL /F %TEMP%rev-v.mp4
IF EXIST %TEMP%audio.wav DEL /F %TEMP%audio.wav
IF EXIST %TEMP%rev-a.wav DEL /F %TEMP%rev-a.wav
IF EXIST %TEMP%noranrev.aac DEL /F %TEMP%noranrev.aac
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4
REN %VIDEO% temp.mp4

::Might Confuse You
%FFMPEG% -i "%TEMP%temp.mp4" -vf reverse -map_metadata -1 -y "%TEMP%rev-v.mp4"
%FFMPEG% -i "%TEMP%temp.mp4" -map_metadata -1 -y "%TEMP%audio.wav"
%FFMPEG% -i "%TEMP%temp.mp4" -af areverse -map_metadata -1 -y "%TEMP%rev-a.wav"
%FFMPEG% -i "%TEMP%temp.mp4" -i "%TEMP%rev-v.mp4" -filter_complex "[1]format=yuva444p,colorchannelmixer=aa=0.5[in2];[0][in2]overlay" -map_metadata -1 -y "%TEMP%temp2.mp4"
%FFMPEG% -i "%TEMP%audio.wav" -i "%TEMP%rev-a.wav" -filter_complex amerge=inputs=2 -ac 2 "%TEMP%noranrev.aac"
%FFMPEG% -i "%TEMP%temp2.mp4" -i "%TEMP%noranrev.aac" -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 "%VIDEO%"

IF EXIST %TEMP%temp.mp4 DEL /F %TEMP%temp.mp4
IF EXIST %TEMP%rev-v.mp4 DEL /F %TEMP%rev-v.mp4
IF EXIST %TEMP%audio.wav DEL /F %TEMP%audio.wav
IF EXIST %TEMP%rev-a.wav DEL /F %TEMP%rev-a.wav
IF EXIST %TEMP%noranrev.aac DEL /F %TEMP%noranrev.aac
IF EXIST %TEMP%temp2.mp4 DEL /F %TEMP%temp2.mp4