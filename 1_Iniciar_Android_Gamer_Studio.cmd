@echo off
chcp 65001 >nul
title Iniciar Android 15 Gamer Studio (Standalone)
cls
echo ======================================================================
echo    INICIAR ANDROID 15 GAMER STUDIO (STANDALONE DISCO Z)
echo ======================================================================
echo.
echo [*] Conectando ao emulador independente e autônomo...
echo [*] Motor: Google AOSP QEMU (WHPX) + Scrcpy + RTX 3060 Ti
echo [*] Zero anúncios, zero telemetria, zero dependência de BlueStacks.
echo.

call "Z:\_EMULADORES_\Android15_Gamer\Iniciar_Android15_Gamer.cmd"
exit /b %ERRORLEVEL%
