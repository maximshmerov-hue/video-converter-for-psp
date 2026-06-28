@echo off

if not exist "PSP" mkdir "PSP"

for %%F in (*.mp4 *.mkv *.avi *.mov *.webm *.flv) do (

ffmpeg -i "%%F" ^
-c:v mpeg4 ^
-q:v 3 ^
-s 320x240 ^
-r 30000/1001 ^
-pix_fmt yuv420p ^
-c:a aac ^
-b:a 128k ^
-ar 24000 ^
-ac 2 ^
-movflags +faststart ^
"PSP\%%~nF.mp4"

ffmpeg -i "%%F" ^
-vframes 1 ^
-vf "scale=160:120" ^
-q:v 2 ^
"PSP\%%~nF.thm"

)

pause
