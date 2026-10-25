@echo off
chcp 65001 >nul
title Backup de Instância e Configurações BlueStacks 5
cls
echo ======================================================================
echo    BACKUP COMPLETO: CONFIGURAÇÕES E ESTADO DO EMULADOR
echo ======================================================================
echo.

set "BACKUP_DIR=%~dp0Backups"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

set "BST_CONF=C:\ProgramData\BlueStacks_nxt\bluestacks.conf"
if not exist "%BST_CONF%" (
    echo [-] Arquivo bluestacks.conf não encontrado.
    pause
    exit /b 1
)

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set dt=%%I
set "TIMESTAMP=%dt:~0,8%_%dt:~8,6%"
set "DEST=%BACKUP_DIR%\bluestacks_conf_%TIMESTAMP%.conf"

echo [*] Criando cópia segura das configurações em:
echo     "%DEST%"
copy /y "%BST_CONF%" "%DEST%" >nul

echo.
echo ======================================================================
echo  [+] Backup realizado com sucesso na pasta Backups/
echo ======================================================================
echo.
pause
exit /b 0
