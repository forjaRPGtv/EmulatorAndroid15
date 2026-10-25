@echo off
chcp 65001 >nul
title Janela Direta Gamer (Teclado Nativo 100% Foco PC)
cls
echo =====================================================================
echo    CONECTOR DIRETO GAMER - TECLADO NATIVO PC (ZERO INTERMEDIARIOS)
echo =====================================================================
echo.
echo [1/2] Verificando se o emulador Android esta ativo...
set ADB_EXE=Z:\_EMULADORES_\Android15_Gamer\sdk\platform-tools\adb.exe
set SCRCPY_EXE=Z:\_EMULADORES_\Android15_Gamer\tools\scrcpy\scrcpy.exe

set "BOOT_DONE=0"
for /f "tokens=*" %%a in ('%ADB_EXE% -s emulator-5554 shell getprop sys.boot_completed 2^>nul') do set "BOOT_DONE=%%a"
if not "%BOOT_DONE%"=="1" (
    echo [AVISO] Emulador nao detectado ou ainda carregando.
    echo Inicie primeiro via 'Iniciar_Android11_Gamer.cmd' ou 'Iniciar_Android15_Gamer.cmd'.
    echo.
    pause
    exit /b 1
)

echo [OK] Android ativo e pronto no emulador-5554!
echo.
echo [2/2] Abrindo Janela Direta com Teclado Nativo do PC (Modo SDK + Direct3D 11)...
echo.
echo Dicas de Uso:
echo  * Teclado: 100%% Nativo (WASD, Setas, Digitação, Senhas, Acentos funcionam direto).
echo  * Atalhos Scrcpy: Mapeados para o [Ctrl Direito] para nao travar atalhos de jogos.
echo  * Botao Direito do Mouse: Voltar (Back).
echo  * Botao do Meio do Mouse: Inicio (Home).
echo.

start "" "%SCRCPY_EXE%" -s emulator-5554 ^
  --window-title "Android Gamer - Teclado Nativo PC (RTX 3060 Ti)" ^
  --render-driver=direct3d11 ^
  --video-codec=h264 ^
  --video-bit-rate=12M ^
  --max-fps=60 ^
  --video-buffer=0 ^
  --audio-codec=opus ^
  --audio-bit-rate=192K ^
  --audio-buffer=40 ^
  --keyboard=sdk ^
  --shortcut-mod=rctrl ^
  --mouse-bind=bhsn ^
  --stay-awake

echo Janela iniciada com sucesso.
ping 127.0.0.1 -n 3 >nul
exit /b 0
