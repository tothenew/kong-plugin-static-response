local typedefs = require "kong.db.schema.typedefs"

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

local schema = {
  name = plugin_name,
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { response_code = {
              type = "integer",
              default = 200,
              required = true,
              between = { 200, 399}, }},
          { response_body = {
              type = "string",
              required = true,
              default = "{Nitin: Bhadauria}" }},
          { content_type = {
              type = "string",
              default = "application/json; charset=UTF-8" }},
        },
        entity_checks = {
          -- add some validation rules across fields
        },
      },
    },
  },
}

return schema
