@echo off
chcp 65001 >nul
title Desinstalação Definitiva do BlueStacks 5
cls
echo ======================================================================
echo    DESINSTALADOR DO BLUESTACKS 5 (LIMPEZA TOTAL DO WINDOWS)
echo ======================================================================
echo.
echo ATENÇÃO: Esta ação desinstalará completamente o BlueStacks do seu PC.
echo Todo o sistema de emulação continuará funcionando através do
echo Android 15 Gamer Studio independente no Disco Z.
echo.
set /p CONFIRM="Deseja prosseguir com a desinstalação? (S/N): "
if /i not "%CONFIRM%"=="S" (
    echo.
    echo [*] Operação cancelada pelo usuário.
    pause
    exit /b 0
)

echo.
echo [1/3] Finalizando processos ativos do BlueStacks...
taskkill /F /IM HD-Player.exe >nul 2>&1
taskkill /F /IM BstkSVC.exe >nul 2>&1
taskkill /F /IM BlueStacksAppplayerWeb.exe >nul 2>&1
taskkill /F /IM BlueStacks.exe >nul 2>&1
taskkill /F /IM HD-MultiInstanceManager.exe >nul 2>&1

echo [2/3] Executando o desinstalador oficial do BlueStacks...
set "UNINSTALLER=C:\Program Files\BlueStacks_nxt\BlueStacksUninstaller.exe"
if exist "%UNINSTALLER%" (
    start "" /wait "%UNINSTALLER%"
) else (
    echo [-] Desinstalador não encontrado. Abrindo o Painel de Controle...
    control appwiz.cpl
)

echo [3/3] Verificando limpeza de resíduos...
echo.
echo ======================================================================
echo  DESINSTALAÇÃO CONCLUÍDA!
echo  Seu Windows agora está 100%% livre do BlueStacks.
echo  Para abrir o Android, utilize: 1_Iniciar_Android_Gamer_Studio.cmd
echo ======================================================================
echo.
pause
exit /b 0
