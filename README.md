# ImmortalizerJailed 2.1

让你的应用程序即使在后台也能保持运行，永不退出！

**适用于 iOS 14 及以上版本，[点击这里下载](https://github.com/sergealagon/ImmortalizerJailed/releases/)**

_这是 [Immortalizer](https://github.com/sergealagon/Immortalizer) 的“监禁版”，可以注入到任意 IPA 文件中，**无需越狱或 TrollStore！**_

---

## 🛠 新特性 (版本 2.1)

- **支持 iOS 17 及以上版本**  
  新增对 iOS 17 及以上版本的支持，让你不再担心版本限制。
  
- **轻松签名和注入支持**  
  通过 **TrollFools** 或 **轻松签** 工具，简化注入流程，轻松将 `dylib` 注入到应用中。

- **改进浮动按钮显示**  
  将浮动按钮移至单独的 `UIWindow`，避免在某些应用中被遮挡，确保良好的用户体验。

- **自动吸附功能**  
  浮动按钮会在几秒钟后自动吸附到屏幕边缘，减少干扰并保持应用界面的简洁。

- **优化“永生化”实现方式**  
  对应用保持常驻（永生化）的实现方式进行了优化，提升稳定性和性能。

---

## 🛠 安装方法

1. **无需越狱或使用 TrollStore**，只需将 `.dylib` 文件注入到你想让它保持运行的应用 IPA 文件中。
2. 你可以使用以下工具之一进行 dylib 注入：
   - **[Sideloadly](https://sideloadly.io/)**
   - **[E-Sign](https://esign.yyyue.xyz/)**
   - **TrollFools**（可在 GitHub 上查找）

---

## 📌 功能说明

- **让应用保持在前台运行**，即使它被切换到后台，也不会被系统杀死；
- 成功注入后，应用界面将出现一个**可移动的浮动按钮**，点击可以切换 Immortalizer 的状态；
- 浮动按钮在几秒钟后会自动吸附到屏幕的边缘，减少用户干扰；
- **优化了“永生化”的实现方式**，提升了稳定性，应用保持常驻的体验更加流畅；
- **无法强制推送通知**，尤其是对于在应用内自行渲染通知 UI 的应用（例如 WhatsApp），这一点在技术上较为复杂。

---

## 📄 许可证

版权所有 (C) 2025 Serge Alagon

本程序是自由软件：你可以依据自由软件基金会发布的 GNU 通用公共许可证第 3 版，
或（视情况而定）任何更高版本重新发布或修改本程序。

本程序以有用为目的发布，但不提供任何担保；
也不包含对适销性或适用于特定目的的默示担保。
详见 GNU 通用公共许可证。

你应已收到一份 GNU 通用公共许可证的副本。
    如未收到，请访问 https://www.gnu.org/licenses/。


英文介绍
# ImmortalizerJailed

Keep your apps running in the foreground indefinitely, even if they are in the background!

**For iOS 14 and above, [download here](https://github.com/sergealagon/ImmortalizerJailed/releases/)**

_This is the jailed version of the tweak [Immortalizer](https://github.com/sergealagon/Immortalizer) that can be injected on any IPA, **without the need of jailbreak or TrollStore!**_

### Installation
1. No need for jailbreak or TrollStore, so all you have to do is inject the dylib to an IPA you want this to work.
2. You may use any tools like **Sideloadly**, **E-Sign**, or even **TrollFools** to inject the dylib to an app.

### Details
- Just like the tweak, it can make apps stay in the foreground, however, you need to inject this onto the app you want to immortalize. 
- There would be a **floating movable button** that you can press to toggle Immortalizer
- Just like the TrollStore version, there's no way to force notifications. It's a bit tricky to force notifications to show, especially for apps that render their own notification UI when their app is opened (e.g. WhatsApp).

# License
    Copyright (C) 2025  Serge Alagon

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>. 

