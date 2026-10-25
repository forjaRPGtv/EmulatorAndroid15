@echo off
chcp 65001 >nul
title Gerar Cópia Limpa Mestre do BlueStacks 5 (REA Golden Master)
cls
echo ======================================================================
echo    GERADOR DE CÓPIA LIMPA MESTRE VIA REA (BLUESTACKS 5)
echo ======================================================================
echo.
echo [*] Iniciando extração e higienização das configurações...
echo.
python "%~dp0Criar_Copia_Limpa_REA.py"
echo.
pause
exit /b 0
