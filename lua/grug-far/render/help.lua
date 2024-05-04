-- TODO (sbadragan): implemment g?
local function renderHelp(params, context)
  local buf = params.buf
  local helpLine = unpack(vim.api.nvim_buf_get_lines(buf, 0, 1, false))
  if #helpLine ~= 0 then
    vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "" })
  end

  local helpExtmarkPos = context.extmarkIds.help and
    vim.api.nvim_buf_get_extmark_by_id(buf, context.namespace, context.extmarkIds.help, {}) or {}
  if helpExtmarkPos[1] ~= 0 then
    context.extmarkIds.help = vim.api.nvim_buf_set_extmark(buf, context.namespace, 0, 0, {
      id = context.extmarkIds.help,
      end_row = 0,
      end_col = 0,
      virt_text = {
        { "Press g? for help", 'Comment' }
      },
      virt_text_pos = 'overlay'
    })
  end
end

return renderHelp