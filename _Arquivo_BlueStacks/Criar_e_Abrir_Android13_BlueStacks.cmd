@echo off
chcp 65001 >nul
title Criar Instancia Android 13 (Tiramisu) no BlueStacks 5
echo ======================================================================
echo    INSTALADOR E OTIMIZADOR: ANDROID 13 NO BLUESTACKS 5 (TIRAMISU)
echo ======================================================================
echo.
echo [1] O Gerenciador de Instâncias do BlueStacks será aberto agora.
echo [2] Na tela do gerenciador, clique no botão azul no rodapé:
echo     "+ Instância" (Instance)  ➔  "Nova Instância" (Fresh Instance).
echo [3] No menu de versões, selecione:
echo     "Android 13 (Tiramisu 64-bit)".
echo [4] Confirme o download oficial dos arquivos do sistema.
echo.
echo Assim que a instância terminar de baixar, FECHE o gerenciador e
echo pressione qualquer tecla aqui para aplicar a cirurgia REA Debloat
echo (8 GB RAM, 6 Cores, Vulkan RTX 3060 Ti e Zero Anúncios)!
echo.
echo ======================================================================
pause
echo.
echo [*] Abrindo o Gerenciador de Instâncias...
start "" "C:\Program Files\BlueStacks_nxt\HD-MultiInstanceManager.exe"
echo.
echo [*] Aguardando você criar a instância Android 13 e fechar o BlueStacks...
pause
echo.
echo [*] Aplicando cirurgia REA Debloat na nova instância Android 13...
python "%~dp0Otimizar_BlueStacks_Sem_Anuncios.py"
echo.
echo ======================================================================
echo  SUCESSO! Sua nova instância Android 13 está 100% otimizada e limpa.
echo ======================================================================
pause
