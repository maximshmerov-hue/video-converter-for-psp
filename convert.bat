@echo off
setlocal

:: Создать папку THM, если её нет
if not exist "THM" mkdir "THM"

:: Найти первую картинку
for %%I in (*.jpg *.jpeg *.png *.bmp *.webp) do (
    set "IMG=%%I"
    goto found
)

echo Не найдена картинка!
pause
exit

:found

echo Используется изображение: %IMG%

for %%V in (*.mp4) do (
    ffmpeg -y -i "%IMG%" ^
    -vf "scale=160:120:force_original_aspect_ratio=decrease,pad=160:120:(ow-iw)/2:(oh-ih)/2" ^
    -frames:v 1 ^
    -q:v 2 ^
    "THM\%%~nV.jpg"

    ren "THM\%%~nV.jpg" "%%~nV.THM"
)

echo.
echo Все THM сохранены в папку THM!
pause
