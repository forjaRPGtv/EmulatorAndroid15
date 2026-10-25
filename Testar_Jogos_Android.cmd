@echo off
chcp 65001 >nul
title Seletor e Launcher de Jogos - Android 15 Gamer Studio
cls
echo ======================================================================
echo    PAINEL DE JOGOS: ANDROID 15 GAMER STUDIO
echo ======================================================================
echo.
echo Selecione o jogo que deseja abrir no emulador:
echo.
echo  [1] Cabal Mobile (Nativo x86_64 - Alta Performance)
echo  [2] Pokémon UNITE (ARM64 Unity IL2CPP)
echo  [3] Pokémon GO (ARM64 Niantic Unity)
echo  [4] YouCine Mobile (Proporção Natural sem Esticar)
echo  [5] Abrir Launcher Principal do Android 15 Gamer Studio
echo  [6] Injetar Coordenadas GPS (São Paulo) para Pokémon GO
echo  [7] Diagnóstico e Status dos Jogos (Tombstones, Resumed Activity, RAM)
echo  [8] Iniciar Android 11 Gamer (Motor Houdini ARM64 - Jogos Pesados)
echo  [9] Sincronizar e Reinstalar APKs do Backup no Emulador Ativo
echo  [10] Janela Direta Gamer (Teclado Nativo 100% PC - Sem Container)
echo  [0] Sair
echo.
set /p OPT="Digite a opção desejada: "

set "ADB=Z:\_EMULADORES_\Android15_Gamer\sdk\platform-tools\adb.exe"

if "%OPT%"=="1" (
    echo.
    echo [*] Verificando e garantindo permissões do Cabal Mobile...
    "%ADB%" -s emulator-5554 shell pm grant com.estgames.cm.us android.permission.READ_EXTERNAL_STORAGE >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.estgames.cm.us android.permission.WRITE_EXTERNAL_STORAGE >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.estgames.cm.us android.permission.READ_PHONE_STATE >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.estgames.cm.us android.permission.POST_NOTIFICATIONS >nul 2>&1
    echo [*] Disparando Cabal Mobile...
    "%ADB%" -s emulator-5554 shell am start -n com.estgames.cm.us/com.estsoft.cabal.androidtv.SplashActivity
    timeout /t 3 >nul
    exit /b 0
)

if "%OPT%"=="2" (
    echo.
    echo [*] Verificando e garantindo permissões do Pokémon UNITE...
    "%ADB%" -s emulator-5554 shell pm grant jp.pokemon.pokemonunite android.permission.POST_NOTIFICATIONS >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant jp.pokemon.pokemonunite android.permission.READ_EXTERNAL_STORAGE >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant jp.pokemon.pokemonunite android.permission.WRITE_EXTERNAL_STORAGE >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant jp.pokemon.pokemonunite android.permission.CAMERA >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant jp.pokemon.pokemonunite android.permission.RECORD_AUDIO >nul 2>&1
    echo [*] Disparando Pokémon UNITE...
    "%ADB%" -s emulator-5554 shell am start -n jp.pokemon.pokemonunite/com.nishiki.pgame.n.PGameLauncherActivity
    timeout /t 3 >nul
    exit /b 0
)

if "%OPT%"=="3" (
    echo.
    echo [*] Verificando e garantindo permissões do Pokémon GO...
    "%ADB%" -s emulator-5554 shell pm grant com.nianticlabs.pokemongo android.permission.ACCESS_FINE_LOCATION >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.nianticlabs.pokemongo android.permission.ACCESS_COARSE_LOCATION >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.nianticlabs.pokemongo android.permission.CAMERA >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.nianticlabs.pokemongo android.permission.POST_NOTIFICATIONS >nul 2>&1
    "%ADB%" -s emulator-5554 shell pm grant com.nianticlabs.pokemongo android.permission.ACTIVITY_RECOGNITION >nul 2>&1
    echo [*] Disparando Pokémon GO...
    "%ADB%" -s emulator-5554 shell am start -n com.nianticlabs.pokemongo/com.nianticproject.holoholo.libholoholo.unity.UnityMainActivity
    timeout /t 3 >nul
    exit /b 0
)

if "%OPT%"=="4" (
    echo.
    echo [*] Calibrando proporção natural de tela (sem esticar)...
    "%ADB%" -s emulator-5554 shell cmd window reset-letterbox-style >nul 2>&1
    "%ADB%" -s emulator-5554 shell cmd window set-letterbox-style --backgroundType solid_color >nul 2>&1
    "%ADB%" -s emulator-5554 shell cmd window set-letterbox-style --backgroundColor black >nul 2>&1
    "%ADB%" -s emulator-5554 shell cmd window set-letterbox-style --isUserAppAspectRatioFullscreenEnabled 0 >nul 2>&1
    "%ADB%" -s emulator-5554 shell cmd window set-ignore-orientation-request false >nul 2>&1
    echo [*] Disparando YouCine...
    "%ADB%" -s emulator-5554 shell am start -n com.world.youcinemobile/com.mobile.brasiltv.activity.SplashAty
    timeout /t 3 >nul
    exit /b 0
)

if "%OPT%"=="5" (
    call "%~dp01_Iniciar_Android_Gamer_Studio.cmd"
    exit /b 0
)

if "%OPT%"=="6" (
    echo.
    echo [*] Fixando coordenadas GPS na Avenida Paulista, São Paulo (-23.5615, -46.6559)...
    "%ADB%" -s emulator-5554 emu geo fix -46.6559 -23.5615 760
    echo [OK] Coordenadas GPS injetadas no emulador com sucesso!
    echo.
    pause
    goto :eof
)

if "%OPT%"=="7" (
    echo.
    echo ======================================================================
    echo    RELATÓRIO DE DIAGNÓSTICO DOS JOGOS (ADB EMULATOR-5554)
    echo ======================================================================
    echo.
    echo [*] Tela / Atividade em Foco:
    "%ADB%" -s emulator-5554 shell dumpsys activity activities | findstr /i "ResumedActivity topResumedActivity"
    echo.
    echo [*] Processos de Jogos em Execucao:
    "%ADB%" -s emulator-5554 shell ps -A | findstr /i "cabal pokemon youcine unity"
    echo.
    echo [*] Ultimos Crashes Nativos (Tombstones):
    "%ADB%" -s emulator-5554 shell ls -la /data/tombstones/ 2>nul
    echo.
    pause
    goto :eof
)

if "%OPT%"=="8" (
    call "%~dp0Iniciar_Android11_Gamer.cmd"
    exit /b 0
)

if "%OPT%"=="9" (
    echo.
    echo ======================================================================
    echo    SINCRONIZAÇÃO E REINSTALAÇÃO DE APKS DO BACKUP
    echo ======================================================================
    echo.
    for /d %%G in ("Z:\_EMULADORES_\Android15_Gamer\apks_backup\*") do (
        echo [*] Instalando pacote: %%~nxG...
        powershell -Command "& '%ADB%' -s emulator-5554 install-multiple -r (Get-ChildItem '%%G\*.apk' | Select-Object -ExpandProperty FullName)"
    )
    echo.
    echo [OK] Todos os pacotes foram sincronizados no emulador ativo!
    echo.
    pause
    goto :eof
)

if "%OPT%"=="10" (
    call "%~dp0Conectar_Teclado_Direto.cmd"
    exit /b 0
)

exit /b 0

