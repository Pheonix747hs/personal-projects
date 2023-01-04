#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
^h::
Process, Exist, notepad.exe
If ErrorLevel = 0
{
MsgBox, Notepad does not exist.
}
Else
{
MsgBox, Notepad is running.
}
Return