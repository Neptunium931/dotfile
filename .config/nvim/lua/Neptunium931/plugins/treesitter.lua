vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'asm', 'c', 'cpp', 'py', 'lua', 'sh' },
  callback = function() vim.treesitter.start() end,
})

return {
	"Neptunium931/nvim-treesitter",
  branch = "main",
	build = ":TSUpdate",
	config = function(_)
		require("nvim-treesitter").setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = {},
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 900 * 1024 -- 900 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
		})
	end,

}
