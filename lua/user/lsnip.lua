local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

ls.config.setup {
  history = true,
  updateevenets = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}
