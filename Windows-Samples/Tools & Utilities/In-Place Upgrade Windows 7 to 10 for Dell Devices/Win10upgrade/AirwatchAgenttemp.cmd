REM Update SERVER, LGName, USERNAME, PASSWORD, and path to AirWatchAgent.msi 
REM You can also run AirWatchAutoEnrollment.exe to generate the correct/updated script. 
msiexec.exe /i "C:\DeplymentShare\Win10upgrade\AirwatchAgent\AirwatchAgent.msi" /qn ENROLL=Y IMAGE=N SERVER=yoursvrname LGName=yourlgusrname USERNAME=yourusrname PASSWORD=yourpwd DEVICEOWNERSHIPTYPE=CD
