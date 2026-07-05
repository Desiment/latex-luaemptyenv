-- code/luaemptyenv.code.lua

local luaemptyenv = {}

function luaemptyenv.grab_buffer_inside_environment(buffer, environment)
  if string.find(buffer, '\\end{' .. environment .. '}') ~= nil then
    return '\\end{' .. environment .. '}'
  end
  return ''
end

function luaemptyenv.startrecording(env_name)
  luatexbase.add_to_callback(
    'process_input_buffer',
    function(buf)
      return luaemptyenv.grab_buffer_inside_environment(buf, env_name)
    end,
    'grabbuf' .. env_name
  )
end

function luaemptyenv.stoprecording(env_name)
  luatexbase.remove_from_callback('process_input_buffer', 'grabbuf' .. env_name)
end

return luaemptyenv
