require "module.openfile"

eventfn=eventfn or {}
eventfn.openfile=function (event)
  local filename=OpenFileDialog(eventfn.frame).fileName
 print_lua(filename)
end
