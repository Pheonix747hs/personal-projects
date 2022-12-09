GetSystemPowerStatus(ByRef _ACLineStatus=0, ByRef _BatteryFlag=0, ByRef _BatteryLifePercent=0
						, ByRef _BatteryLifeTime=0, ByRef _BatteryFullLifeTime=0)
{
	static System_Power_Status
	
	VarSetCapacity(System_Power_Status, 12, 0)
	
	if !DllCall("kernel32.dll\GetSystemPowerStatus", "Ptr", &System_Power_Status)
	
	
	_ACLineStatus        := NumGet(System_Power_Status, 0, "UChar")
	_BatteryFlag         := NumGet(System_Power_Status, 1, "UChar")
	_BatteryLifePercent  := NumGet(System_Power_Status, 2, "UChar")
	_BatteryLifeTime     := NumGet(System_Power_Status, 4, "Int")
	_BatteryFullLifeTime := NumGet(System_Power_Status, 8, "Int")
	return true
}

if !GetSystemPowerStatus(PowerStatus, PowerFlag, LifePct, LifeTime, FullLifeTime)
  while PowerFlag = 8
  {
	mes
  }

while % PowerFlag = 8 
{ 
    MsgBox, % LifePct

}    

if !GetSystemPowerStatus(,, LifePct)
{
	MsgBox, % "GetSystemPowerStatus failed " A_LastError
	return
}
MsgBox, % LifePct
 
if !GetSystemPowerStatus(PowerStatus, PowerFlag, LifePct, LifeTime, FullLifeTime)
{
	MsgBox, % "GetSystemPowerStatus failed " A_LastError
	return
}
MsgBox, % PowerFlag "`n" LifePct "`n" LifeTime "`n" FullLifeTime
return