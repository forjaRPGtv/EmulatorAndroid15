# -*- coding: utf-8 -*-
"""
Criador de Cópia Limpa Mestre (Golden Master) do BlueStacks 5 via REA
- Executa varredura profunda no Engine e no bluestacks.conf
- Extrai e higieniza as configurações essenciais para a pasta 'Copia_Limpa_BlueStacks'
- Gera script conector de 1 clique para auto-injeção em qualquer máquina
"""

import os
import shutil
import subprocess
import time
import re

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
OUTPUT_DIR = os.path.join(BASE_DIR, "Copia_Limpa_BlueStacks")
CONF_SRC = r"C:\ProgramData\BlueStacks_nxt\bluestacks.conf"
ENGINE_SRC = r"C:\ProgramData\BlueStacks_nxt\Engine"

def main():
    print("=" * 70)
    print(" REA: GERADOR DE CÓPIA LIMPA MESTRE DO BLUESTACKS 5")
    print("=" * 70)

    if not os.path.exists(CONF_SRC):
        print(f"[-] Erro: {CONF_SRC} não encontrado.")
        return

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # 1. Aplica o REA Debloat primeiro
    print("\n[*] Passo 1: Aplicando Engenharia Reversa REA Debloat...")
    subprocess.run(["python", os.path.join(BASE_DIR, "Otimizar_BlueStacks_Sem_Anuncios.py")])

    # 2. Higieniza e exporta o bluestacks.conf limpo
    print("\n[*] Passo 2: Exportando configuração mestre limpa...")
    with open(CONF_SRC, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()

    clean_lines = []
    # Filtra telemetrias ou IDs locais específicos
    for line in lines:
        if any(bad in line for bad in ["ads", "promotion", "nowgg", "campaign", "telemetry"]):
            if "ads_screen_width" in line or "enable_programmatic_ads" in line or "feature.programmatic_ads" in line:
                clean_lines.append(line)
            continue
        clean_lines.append(line)

    dest_conf = os.path.join(OUTPUT_DIR, "bluestacks_clean.conf")
    with open(dest_conf, "w", encoding="utf-8") as f:
        f.writelines(clean_lines)
    print(f"      [+] Configuração mestre gerada em: {dest_conf}")

    # 3. Cria o instalador da Cópia Limpa em 1 clique
    installer_path = os.path.join(OUTPUT_DIR, "Instalar_Copia_Limpa_1Clique.cmd")
    installer_code = """@echo off
chcp 65001 >nul
title Injetar Cópia Limpa BlueStacks 5 (REA Golden Master)
cls
echo ======================================================================
echo    INJETAR CÓPIA LIMPA MESTRE: ZERO ANÚNCIOS + 8GB RAM + VULKAN
echo ======================================================================
echo.

set "TARGET_CONF=C:\\ProgramData\\BlueStacks_nxt\\bluestacks.conf"
if not exist "C:\\ProgramData\\BlueStacks_nxt" (
    echo [-] Erro: Pasta C:\\ProgramData\\BlueStacks_nxt não encontrada.
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
"""
    with open(installer_path, "w", encoding="utf-8") as f:
        f.write(installer_code)

    print(f"      [+] Conector em 1 clique gerado em: {installer_path}")

    # 4. Cria o README explicativo do pacote limpo
    readme_path = os.path.join(OUTPUT_DIR, "README_COPIA_LIMPA.md")
    readme_content = """# Cópia Limpa Mestre do BlueStacks 5 (REA Golden Master)

Este pacote contém as configurações e otimizações extraídas por Engenharia Reversa (REA) da instância do ecossistema Arthur Reis.

## Como Usar em Outro Computador:
1. Instale o BlueStacks 5 oficial na máquina de destino.
2. Copie esta pasta `Copia_Limpa_BlueStacks` para o computador.
3. Dê dois cliques em **`Instalar_Copia_Limpa_1Clique.cmd`**.
4. Pronto! O BlueStacks abrirá com:
   - 100% dos anúncios desativados.
   - Caches de promoção travados.
   - 8 GB de RAM e 6 Núcleos alocados.
   - Renderizador gráfico Vulkan acelerado na GPU.
   - Acesso ADB liberado para automações e keymapping.
"""
    with open(readme_path, "w", encoding="utf-8") as f:
        f.write(readme_content)

    print(f"      [+] Guia de uso salvo em: {readme_path}")
    print("\n" + "=" * 70)
    print(" CÓPIA LIMPA MESTRE CONCLUÍDA COM SUCESSO NA PASTA Copia_Limpa_BlueStacks/")
    print("=" * 70)

if __name__ == "__main__":
    main()
