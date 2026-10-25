@echo off
set "BST_EXE=C:\Program Files\BlueStacks_nxt\HD-Player.exe"
if not exist "%BST_EXE%" (
    echo [ERRO] BlueStacks nao encontrado em: "%BST_EXE%"
    pause
    exit /b 1
)
cd /d "C:\Program Files\BlueStacks_nxt"
start "" "HD-Player.exe" --instance Pie64
exit /b 0