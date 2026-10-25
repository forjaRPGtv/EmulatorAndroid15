# 🤖 EmulatorAndroid15: Ambiente Gamer Android Standalone & Independente

[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-blue.svg)](https://microsoft.com)
[![Android](https://img.shields.io/badge/Android-15%20%26%2011%20AOSP-brightgreen.svg)](https://source.android.com)
[![Hardware](https://img.shields.io/badge/GPU-RTX%203060%20Ti%20Dedicated-76B900.svg)](https://nvidia.com)
[![Kernel](https://img.shields.io/badge/Kernel-Linux%206.6%20LTS-orange.svg)](https://kernel.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Ambiente de emulação Android autônomo, limpo e de alta performance do ecossistema Arthur Reis.

Este repositório foi construído sobre uma arquitetura **100% independente do BlueStacks**, operando diretamente a partir do motor oficial do Google (AOSP) com aceleração direta por hardware WHPX na RTX 3060 Ti e áudio de ultrabaixa latência Sound BlasterX.

---

## 🚀 Conectores Rápidos em 1 Clique

| Conector | Função |
| :--- | :--- |
| **[`1_Iniciar_Android_Gamer_Studio.cmd`](./1_Iniciar_Android_Gamer_Studio.cmd)** | Inicializa o Android 15 Gamer Studio com aceleração WHPX, 6 Cores, 8 GB RAM, RTX 3060 Ti e áudio Sound BlasterX. |
| **[`Iniciar_Android11_Gamer.cmd`](./Iniciar_Android11_Gamer.cmd)** | Inicializa o Android 11 Gamer Studio com motor de tradução Houdini ARM64 (para Pokémon UNITE e jogos pesados da Play Store). |
| **[`Conectar_Teclado_Direto.cmd`](./Conectar_Teclado_Direto.cmd)** | Ativa o driver de hardware UHID no Kernel Linux do Android para suporte nativo a teclado físico sem tela de toque. |
| **[`Testar_Jogos_Android.cmd`](./Testar_Jogos_Android.cmd)** | Menu em 1 clique para lançar diretamente Pokémon UNITE, Pokémon GO ou Cabal Mobile. |
| **[`2_Desinstalar_BlueStacks_Definitivo.cmd`](./2_Desinstalar_BlueStacks_Definitivo.cmd)** | Executa o desinstalador oficial para remover o BlueStacks e limpar o Windows com segurança. |
| **[`Iniciar_Android15_Gamer.cmd`](./Iniciar_Android15_Gamer.cmd)** | Atalho direto canônico para a pasta `Z:\_EMULADORES_\Android15_Gamer`. |

---

## 🛡️ Vantagens do Ambiente Standalone (AOSP Puro)

1. **Zero Bloatware e Anúncios:** Não há propagandas de jogos, banners na tela, moedas virtuais ou notificações invasivas.
2. **Totalmente Isolado no Disco Z:** Não polui o registro do Windows, não instala serviços ocultos em segundo plano e não depende de pastas no `C:`.
3. **Desempenho Gamer Nativo:** Roda o Android 15 com Kernel Linux 6.6 LTS, aceleração via WHPX na RTX 3060 Ti a 60 FPS estáveis e transmissão de áudio Opus de ultrabaixa latência (WASAPI).
4. **Dock Gamer Customizado:** Interface desktop limpa com dock retrátil, botão de captura de tela, suporte a resoluções de tablet/celular e navegação nativa no mouse (botão direito para voltar, botão do meio para tela inicial).
5. **Teclado Nativo do PC (UHID de Hardware):** Mapeamento de hardware de ultrabaixa latência via módulo Linux UHID direto no Kernel do Android 15. Teclas gamer (WASD, Setas, Espaço, Modificadores, Atalhos) operam como um teclado físico USB real, sem tela de toque virtual atrapalhando a visão dos jogos.

---

## 📁 Arquivos Antigos do BlueStacks

Os scripts legados, backups e ferramentas de engenharia reversa do BlueStacks foram preservados para histórico dentro da pasta:
- 📁 [`_Arquivo_BlueStacks/`](./_Arquivo_BlueStacks/)

---

Desenvolvido por **Arthur Reis**.
