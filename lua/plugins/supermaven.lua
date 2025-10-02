return {
    keymaps = {
        accept_suggestion = "<M-TAB>",
        clear_suggestion = "<C-j>",
        accept_word = "<C-j>",
    },
    ignore_filetypes = { cpp = true },
    color = {
        suggestion_color = "#ffffff",
        cterm = 244,
    },
    log_level = "info",
    disable_inline_completion = false,
    disable_keymaps = false,
    condition = function()
        return false
    end
}
