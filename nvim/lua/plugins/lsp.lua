return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			require("lspconfig")
			vim.lsp.enable('clangd')
			
		end

}

}
