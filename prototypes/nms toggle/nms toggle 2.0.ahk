#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
rerun:
flag=1
Process, Exist, notepad.exe
If (ErrorLevel = 0)
{
    flag=0
    sleep 60000
    goto, rerun

}   
if flag<>0
{
    XButton2::nms_boost() 
    LShift::
	    SEND, {h down}
	    Gosub, rerun
        Return
    LShift Up::
	    SEND, {h Up}
	    Gosub, rerun
        Return  
}

nms_boost()
{
GetKeyState, state, h
        if (state = "D")
        {
            SendInput, {h Up}
            Gosub, rerun
        }
        if (state = "U")
        {
            SendInput, {h Down}
            Gosub, rerun
        }
}