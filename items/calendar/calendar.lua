-- Padding item required because of bracket
SBAR.add("item", { position = "right"})

local cal_date = SBAR.add("item", {
  position = "right",
  width = 60,
  label = {
    color = COLORS.lavender,
    font = {
      size = 12.0,
    },
  },
})

local cal_time = SBAR.add("item", {
  position = "right",
  width = 78,
  label = {
    color = COLORS.lavender,
    font = {
      size = 12.0,
    },
  },
})

-- Double border for calendar using a single item bracket
local cal_bracket = SBAR.add("bracket", { cal_date.name, cal_time.name }, {
  update_freq = 1,
})

-- Padding item required because of bracket
SBAR.add("item", { position = "right", width = PADDINGS })

cal_bracket:subscribe({ "forced", "routine", "system_woke" }, function(env)
  cal_date:set({ label = { string = os.date("%a %b %d") } })
  cal_time:set({ label = { string = os.date("%H:%M:%S %p") } })
end)

local function click_event()
  SBAR.exec("open -a Calendar")
end

cal_time:subscribe("mouse.clicked", click_event)
