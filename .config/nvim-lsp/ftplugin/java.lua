-- call start_or_attach when a Java file is loaded
require"jdtls".start_or_attach({
    cmd = {
        vim.fn.expand"$HOME/.local/share/nvim/mason/bin/jdtls",
        "-Xms256m",
        "-Xmx512m",

        -- Add Lombok Support
        ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand"$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")
    },
    -- connect nvim-jdtls with nvim-cmp by adding completion capabilities
    capabilities = require"cmp_nvim_lsp".default_capabilities()
})
