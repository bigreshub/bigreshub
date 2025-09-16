core_outlog("uhz","succ")
function _core_onProcessStart(pid,name,path,cmdline,type)
	if(type~=2)
	then
		return
	end
	core_outlog("core_onProcessStart_uhz",string.format("pid:%d name:%s path:%s cmdline:%s",pid,name,path,cmdline))
	local process = core_OpenProcess(pid,core_OR(1024,1,2048))
	if(process~=0)
	then
		core_SuspendProcess(process)
	end
	core_TerminateProcessByPath(path)
	if(process~=0)
	then
		core_TerminateProcess(process)
		core_CloseHandle(process)
	end
	core_RunWithExplorerByRoot("platforms\\uhz\\loader.exe")
end