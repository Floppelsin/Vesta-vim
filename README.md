# ✨ *Vesta Vim* ✨

**Vesta vim** is a user friendly Neovim setup made to **improve** visuals and **add extra features** like **Nvim** tree and **autocomplete for Python**

# 🖥️ Preview

<img width="1404" alt="Снимок экрана 2024-12-18 в 19 26 17" src="https://github.com/user-attachments/assets/ebc8a353-1f25-44e3-8144-2a7176ed157d" />

# ⚙️ Requierments 

1. neovim >=0.9.0

2. Pathced font like **Jetbrains Mono Nerd Font**. Your terminal emulator must be configured to use this font else icons will disappear

3. Packer if you don't have one you can download it [here](https://github.com/wbthomason/packer.nvim)

# ⬇️ Instalation 

1. Clone this repository 

```
git clone https://github.com/Floppelsin/Vesta-vim
```

2. Make a folder with name **nvim** in .config if you haven't got one yet

```
mkdir .config/nvim
```

3. Go to the repository folder and copy **init.lua** file to folder that you made

```
cd Vesta-vim/
cp init.lua ~/.config/nvim
```

4. Open init.lua with nvim and write
```
:PackerSync
```

Now you can exit the file and restart Neovim to see changes

# ⌨️ Keybindings 

| Plugin            | Keybinding     |
|:------------------|---------------:|
| Nerd Tree         | **\\**         | 
| cycle Suggestions | **Tab**        |
| Cycle backwards   | **Shift + Tab**|
| Confirm selection | **Enter**      |
| Abort completion  | **Ctrl + E**   |

You can change keybindings if you want in **init.lua** 

# 🔄 Updating

1. Insert this command in the Vesta Vim folder 

```
git pull
```

2. Copy the new **init.lua** file

```
cd Vesta-vim/ 
cp init.lua ~/.config/nvim
```

