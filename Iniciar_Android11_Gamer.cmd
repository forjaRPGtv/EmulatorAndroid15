@echo off
chcp 65001 >nul
title Android 11 Gamer Studio (Houdini ARM64 Engine)
cls
echo =====================================================================
echo    ANDROID 11 GAMER STUDIO (HOUDINI ARM64 + RTX 3060 Ti DISCO Z)
echo =====================================================================
echo.
echo [1/3] Configurando ambiente no disco Z:... 
set JAVA_HOME=C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot
set ANDROID_HOME=Z:\_EMULADORES_\Android15_Gamer\sdk
set ANDROID_SDK_ROOT=Z:\_EMULADORES_\Android15_Gamer\sdk
set ANDROID_AVD_HOME=Z:\_EMULADORES_\Android15_Gamer\avd
set ANDROID_EMULATOR_HOME=Z:\_EMULADORES_\Android15_Gamer\avd
set PATH=%ANDROID_HOME%\emulator;%ANDROID_HOME%\platform-tools;Z:\_EMULADORES_\Android15_Gamer\tools\scrcpy;%JAVA_HOME%\bin;%PATH%
echo.
echo [2/3] Verificando se o Android 11 Gamer esta ativo...

set "BOOT_DONE=0"
for /f "tokens=*" %%a in ('adb.exe -s emulator-5554 shell getprop sys.boot_completed 2^>nul') do set "BOOT_DONE=%%a"
if "%BOOT_DONE%"=="1" (
    echo [OK] O emulador ja esta ativo e pronto para streaming.
    goto apply_tweaks
)

echo Subindo motor Android 11 Gamer (6 Cores, 8GB RAM, Houdini ARM64, RTX 3060 Ti)...
powershell -NoProfile -ExecutionPolicy Bypass -Command "& 'Z:\_EMULADORES_\Android15_Gamer\tools\launch_avd.ps1' -AvdName Android11_Gamer"

echo Aguardando inicializacao completa do Android 11 Gamer...
set /a count=0
:wait_boot_loop
set /a count+=1
ping 127.0.0.1 -n 3 >nul
set "BOOT_DONE=0"
for /f "tokens=*" %%a in ('adb.exe -s emulator-5554 shell getprop sys.boot_completed 2^>nul') do set "BOOT_DONE=%%a"
if "%BOOT_DONE%"=="1" (
    echo [OK] Android 11 Gamer inicializado com sucesso (sys.boot_completed = 1)
    goto apply_tweaks
)
if %count% geq 45 (
    echo [AVISO] Tempo limite atingido. Abrindo Studio...
    goto apply_tweaks
)
echo  . carregando Android 11 e Houdini ARM64 (tentativa %count%/45)...
goto wait_boot_loop

:apply_tweaks
echo.
echo Otimizando pipeline grafica e teclado no Android 11...
adb.exe -s emulator-5554 shell settings put secure show_ime_with_hard_keyboard 0 >nul 2>&1

:launch_studio
echo.
echo [3/3] Abrindo Gamer Studio (Janela Unica + Teclado Nativo PC UHID)...
cd /d "Z:\_EMULADORES_\Android15_Gamer\tools\GamerStudio"
start "" pythonw android15_gamer_studio.py
echo.
echo =====================================================================
echo    ANDROID 11 GAMER INICIADO COM SUCESSO! COMPATIBILIDADE ARM64 ATIVA.
echo =====================================================================
ping 127.0.0.1 -n 3 >nul
exit /b 0
