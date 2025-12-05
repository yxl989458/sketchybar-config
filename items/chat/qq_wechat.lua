local get_app_status = require("helpers.app_info").get_app_status

local update_freq = 3

local wechat = SBAR.add("item", "WeChat", {
  position = "right",
  icon = {
    string = ICONS.wechat,
    font = { size = 20.0 },
    color = COLORS.green,
  },
  update_freq = update_freq,
  click_script = "open -a WeChat",
})

wechat:subscribe({ "forced", "routine" }, function()
  get_app_status("com.tencent.xinWeChat", wechat)
end)
