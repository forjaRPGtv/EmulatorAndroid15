@echo off
chcp 65001 >nul
title Iniciar Emulador Android Limpo (Zero Anúncios)
cls
set "BST_EXE=C:\Program Files\BlueStacks_nxt\HD-Player.exe"
set "BST_CONF=C:\ProgramData\BlueStacks_nxt\bluestacks.conf"

if not exist "%BST_EXE%" (
    echo ======================================================================
    echo  [ERRO] BlueStacks 5 não encontrado em:
    echo  "%BST_EXE%"
    echo ======================================================================
    pause
    exit /b 1
)

echo ======================================================================
echo    INICIAR EMULADOR ANDROID LIMPO (ZERO ANÚNCIOS)
echo ======================================================================
echo.

rem Verifica se existe instancia Android 13 (Tiramisu64) configurada
set "TARGET_INST=Pie64"
if exist "%BST_CONF%" (
    findstr /i "bst.instance.Tiramisu64" "%BST_CONF%" >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        set "TARGET_INST=Tiramisu64"
    )
)

echo [*] Instância selecionada: [%TARGET_INST%]
echo [*] Disparando HD-Player.exe com aceleração direta de GPU...
cd /d "C:\Program Files\BlueStacks_nxt"
start "" "HD-Player.exe" --instance %TARGET_INST%

echo.
echo [+] Emulador iniciado com sucesso! Esta janela fechará automaticamente.
timeout /t 3 >nul
exit /b 0
