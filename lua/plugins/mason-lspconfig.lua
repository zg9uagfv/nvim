local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "vimls",
    "lua_ls",
    "html",
    "cssls",
    "tsserver",
    "vuels",
    "jsonls",
    "emmet_ls",
    "tailwindcss",
  },
  automatic_installation = false,
})

local lspconfig
status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 lspconfig")
	return
end

-- 使用neovim原生lspconfig进行language server配置
local servers = {
	lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
	bashls = require("lsp.config.bash"),
	pyright = require("lsp.config.pyright"),
	tsserver = require("lsp.config.tsserver"),
	gopls = require("lsp.config.gopls"),
	clangd = require("lsp.config.clangd"),
	-- quick_lint_js = require("lsp.config.quick-lint-js"),
	sqls = require("lsp.config.sqls"),
	-- css html
	emmet_ls = require("lsp.config.emmet-ls"),
	html = require("lsp.config.html"),
	cssls = require("lsp.config.css"),
	-- json
	jsonls = require("lsp.config.json"),
	-- vim
	vimls = require("lsp.config.vimls"),
}
for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end
