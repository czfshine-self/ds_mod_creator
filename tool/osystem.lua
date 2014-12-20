--coding: UTF-8-------
--获取系统版本信息
--------------------------------------------------
-- put bin/ first to avoid conflicts with included modules
-- that may have other versions present somewhere else in path/cpath.
os.iswindows = os.getenv('WINDIR') or (os.getenv('OS') or ''):match('[Ww]indows')

os.islinux = not os.iswindows and not os.getenv('DYLD_LIBRARY_PATH') and io.open("/proc")
os.arch = "x86" -- use 32bit by default
unpack = table.unpack or unpack

if os.islinux then
  local file = io.popen("uname -m")
  if file then
    local machine=file:read("*l")
    local archtype= { x86_64="x64", armv7l="armhf" }
    print(machine)
    os.arch = archtype[machine] or "x86"
    file:close()
  end
end

package.cpath = (
  os.iswindows and 'bin/?.dll;bin/clibs/?.dll;' or
  os.islinux and ('bin/linux/%s/lib?.so;bin/linux/%s/clibs/?.so;'):format(os.arch,os.arch) or
  --[[isosx]] 'bin/lib?.dylib;bin/clibs/?.dylib;')
    .. package.cpath

package.path  = 'lualibs/?.lua;lualibs/?/?.lua;lualibs/?/init.lua;lualibs/?/?/?.lua;lualibs/?/?/init.lua;'
              .. package.path