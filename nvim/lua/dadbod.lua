local M = {}
function M.setup()
  vim.g.db_ui_save_location = "~/.config"
end
return M
--
--COMMAND TO RUN
-- :DBUIAddConnection sqlserver://<server>:<port>;user=<username>;password=<password>;database=<database_name>

--OTHER
-- help vim-dadbod-ui-connections-env
