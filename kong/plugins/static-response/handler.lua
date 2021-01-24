local kong = kong

local plugin = {
  PRIORITY = 1001, -- set the plugin priority, which determines plugin execution order
  VERSION = "0.1",
}


-- It runs in the 'init_worker_by_lua_block'
function plugin:init_worker()

  -- your custom code here
  kong.log.debug("Loading static-response plugin")

end --]]

-- runs in the 'access_by_lua_block'
function plugin:access(plugin_conf)

  -- kong.log.inspect(plugin_conf)   -- check the logs for a pretty-printed config!
  return kong.response.exit(plugin_conf.response_code, plugin_conf.response_body)

end --]]


-- runs in the 'header_filter_by_lua_block'
function plugin:header_filter(plugin_conf)

  kong.response.clear_header("Content-Length")
  kong.response.set_header("Content-Length", string.len(plugin_conf.response_body))
  if plugin_conf.content_type then
     kong.response.set_header("Content-Type", plugin_conf.content_type)
  else
     kong.response.set_header("Content-Type", "application/json; charset=UTF-8")
  end

end --]]

-- return our plugin object
return plugin
