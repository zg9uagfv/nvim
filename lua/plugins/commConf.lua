-- TODO: add cmp,indentline disable filetype list
-- add std config, data path
local commconf = {}

commconf.illuminateLargefileEdge = 2000
commconf.rainbowLargefileEdge = 2000
commconf.largefileEdge = 102400 -- 100kb
commconf.lspLargefileEdge = 5000
commconf.lintLargefileEdge = 2000
commconf.autoformatEdge = 102400 -- 100kb

-- share path
commconf.sharePath = vim.env.VIM

-- basic config
commconf.listchar = true

-- lint    null-ls
-- https://github.com/DavidAnson/markdownlint/blob/main/schema/.markdownlint.jsonc
--commconf.markdownlintConfig = vim.fn.expand(commconf.sharePath .. "/xray23/lint-globals/.markdownlint.jsonc")
--commconf.markdownPreviewCss = vim.fn.expand(commconf.sharePath .. "/xray23/mkp-css/")

function commconf.magiceSearchSwitches(opts)
	if opts.vmagicSearch == "on" then
		vim.api.nvim_set_keymap("v", "/", "/\\v", { noremap = true, silent = false })
	end
	if opts.nmagicSearch == "on" then
		vim.api.nvim_set_keymap("n", "/", "/\\v", { noremap = true, silent = false })
	end
end

return commconf
