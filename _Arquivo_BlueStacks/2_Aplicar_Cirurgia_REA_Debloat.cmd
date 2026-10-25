@echo off
chcp 65001 >nul
title Cirurgia REA Debloat - Otimização Universal BlueStacks 5
cls
echo ======================================================================
echo    CIRURGIA REA DEBLOAT: ZERO ANÚNCIOS E MÁXIMA PERFORMANCE
echo ======================================================================
echo.
echo [*] Disparando otimizador em lote nas instâncias do BlueStacks...
echo.
python "%~dp0Otimizar_BlueStacks_Sem_Anuncios.py"
echo.
pause
exit /b 0
