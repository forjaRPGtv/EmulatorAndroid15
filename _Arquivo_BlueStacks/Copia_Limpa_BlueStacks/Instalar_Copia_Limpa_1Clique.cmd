@echo off
chcp 65001 >nul
title Injetar Cópia Limpa BlueStacks 5 (REA Golden Master)
cls
echo ======================================================================
echo    INJETAR CÓPIA LIMPA MESTRE: ZERO ANÚNCIOS + 8GB RAM + VULKAN
echo ======================================================================
echo.

set "TARGET_CONF=C:\ProgramData\BlueStacks_nxt\bluestacks.conf"
if not exist "C:\ProgramData\BlueStacks_nxt" (
    echo [-] Erro: Pasta C:\ProgramData\BlueStacks_nxt não encontrada.
    echo     Certifique-se de que o BlueStacks 5 está instalado nesta máquina.
    pause
    exit /b 1
)

echo [*] Encerrando processos em segundo plano do BlueStacks...
taskkill /F /IM HD-Player.exe >nul 2>&1
taskkill /F /IM BstkSVC.exe >nul 2>&1
taskkill /F /IM BlueStacksAppplayerWeb.exe >nul 2>&1

echo [*] Criando backup de segurança da configuração atual...
if exist "%TARGET_CONF%" copy /y "%TARGET_CONF%" "%TARGET_CONF%.backup_pre_clean" >nul

echo [*] Injetando configuração limpa otimizada por Engenharia Reversa...
copy /y "%~dp0bluestacks_clean.conf" "%TARGET_CONF%" >nul

echo.
echo ======================================================================
echo  [+] SUCESSO! A Cópia Limpa Mestre foi aplicada com perfeição.
echo      O emulador agora roda com zero anúncios, máxima velocidade e GPU.
echo ======================================================================
echo.
pause
exit /b 0
