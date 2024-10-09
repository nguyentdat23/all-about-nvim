require("spring_boot").init_lsp_commands()
require("lspconfig").jdtls.setup({
  init_options = {
    bundles = require("spring_boot").java_extensions(),
  },
})
vim.list_extend(jdtls_config.bundles, require("spring_boot").java_extensions())
