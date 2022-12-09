function myvar
myvar = msgbox("Battery is at " & iPercent & "%", vbInformation+vbOKCancel, "Battery monitor")
        dim message
        Select Case myvar
        Case vbok
            wscript.sleep 30000 ' 5 minutes
        Case vbcancel
            wscript.sleep 7200000 ' 5 minutes
        End select
end function
set oLocator = CreateObject("WbemScripting.SWbemLocator")
set oServices = oLocator.ConnectServer(".","root\wmi")
set oResults = oServices.ExecQuery("select * from batteryfullchargedcapacity")
for each oResult in oResults
  iFull = oResult.FullChargedCapacity
next

while (1)
  set oResults = oServices.ExecQuery("select * from batterystatus")
  for each oResult in oResults
    bCharging = oResult.Charging
	  iRemaining = oResult.RemainingCapacity
  next
  iPercent = ((iRemaining/iFull)*100) mod 100
  if bCharging and (iPercent > 74) Then myvar
wend