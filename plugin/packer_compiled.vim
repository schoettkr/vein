" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/eos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/eos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/eos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/eos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/eos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["base16-vim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["findr.vim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/findr.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  indentLine = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neogit = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/eos/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-esearch"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-esearch"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-swoop"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-swoop"
  },
  ["vim-winlayout"] = {
    loaded = true,
    path = "/home/eos/.local/share/nvim/site/pack/packer/start/vim-winlayout"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
