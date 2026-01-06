LuaEmptyEnv = {}

--[[
Function: grab_buffer_inside_environment
Purpose: Processes input buffer to find the end of the environment
Parameters:
  buffer - the current input line being processed
  environment - name of the environment being processed
Returns: 
  The end marker if found, empty string otherwise
--]]
function LuaEmptyEnv.grab_buffer_inside_environment(buffer, environment)
  -- Check if current line contains the end of our environment
  if string.find(buffer, "\\end{" .. environment .. "}") ~= nil then
    return "\\end{" .. environment .."}"  -- Return just the end marker
  end
  return ""  -- Return empty string to discard content
end

--[[
Function: startrecording
Purpose: Activates buffer processing for a specific environment
Parameters:
  env_name - name of the environment to start processing
--]]
function LuaEmptyEnv.startrecording(env_name)
  luatexbase.add_to_callback(
    'process_input_buffer', 
    function(buf) 
      return LuaEmptyEnv.grab_buffer_inside_environment(buf, env_name) 
    end, 
    'grabbuf' .. env_name  -- Unique callback name
  )
end

--[[
Function: stoprecording
Purpose: Deactivates buffer processing for a specific environment
Parameters:
  env_name - name of the environment to stop processing
--]]
function LuaEmptyEnv.stoprecording(env_name)
  luatexbase.remove_from_callback('process_input_buffer', 'grabbuf' .. env_name)
end

return LuaEmptyEnv
