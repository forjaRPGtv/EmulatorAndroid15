@echo off
chcp 65001 >nul
title Diagnóstico de Ambiente - Kit Emulador Android Standalone
cls
echo ======================================================================
echo    DIAGNÓSTICO E PREPARAÇÃO DE AMBIENTE: EMULADOR ANDROID
echo ======================================================================
echo.

echo [*] Verificando instalação do Python...
python --version >nul 2>&1
if %ERRORLEVEL% equ 0 (
    for /f "tokens=*" %%v in ('python --version') do echo     [+] Python detectado: %%v
) else (
    echo     [-] AVISO: Python não encontrado no PATH.
    echo         Instale o Python 3.x em https://www.python.org/
    echo         Marque a opção "Add Python to PATH" durante a instalação.
)
echo.

echo [*] Verificando instalação do BlueStacks 5...
set "BST_EXE=C:\Program Files\BlueStacks_nxt\HD-Player.exe"
set "BST_CONF=C:\ProgramData\BlueStacks_nxt\bluestacks.conf"

if exist "%BST_EXE%" (
    echo     [+] Binário HD-Player.exe localizado em:
    echo         "%BST_EXE%"
) else (
    echo     [-] AVISO: BlueStacks 5 não localizado em C:\Program Files\BlueStacks_nxt\
)

if exist "%BST_CONF%" (
    echo     [+] Configuração bluestacks.conf localizada com sucesso.
) else (
    echo     [-] AVISO: Arquivo de configuração não encontrado em ProgramData.
)
echo.

echo [*] Verificando espaço em disco...
powershell -NoProfile -Command "$d = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -gt 0 }; foreach($p in $d) { Write-Host ('    [+] Drive ' + $p.Name + ': ' + [math]::Round($p.Free/1GB, 1) + ' GB livres') }"

echo.
echo ======================================================================
echo  DIAGNÓSTICO CONCLUÍDO!
echo  Se todos os itens acima estiverem marcados com [+], seu ambiente está
echo  100%% pronto para rodar e aplicar a Cirurgia REA Debloat.
echo ======================================================================
echo.
pause
exit /b 0
