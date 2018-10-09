$sourceDir = "D:\Torrent Downloads\ "
$destDir = "Z:\Torrent Downloads\ "

#---------------------------------------------------------------------------------
# Set your variables above for source and destination directories before starting.
#---------------------------------------------------------------------------------

if (-not ($destDir | Test-Path)) {exit}
robocopy $sourceDir $destDir /MOV /Z /E /J /R:2 /W:5 /MT /V /ETA /LOG+:Robocopy.txt /TEE
Remove-Item -Path "D:\Torrent Downloads\*" -Recurse


<#

ROBOCOPY SWITCHES
-----------------
/MIR       = Mirrors a directory tree (equivalent to /e plus /purge).
/Z         = Copies files in restartable mode.
/V         = Produces verbose output, and shows all skipped files.
/XJ        = Excludes junction points, which are normally included by default.
/SL        = Follows the symbolic link and copies the target.
/COPY:DAT  = Specifies the file properties to be copied. The following are the valid values for this option:
                 D Data
                 A Attributes
                 T Time stamps
/MT        = (/MT[:N]) Creates multi-threaded copies with N threads. N must be an integer between 1 and 128. The default value for N is 8.
/IT        = Includes "tweaked" files.
/R:N       = Specifies the number of retries on failed copies. The default value of N is 1,000,000 (one million retries).
/W:N       = Specifies the wait time between retries, in seconds. The default value of N is 30 (wait time 30 seconds).
/MON:N     = Monitors the source, and runs again when more than N changes are detected.
/MOT:N     = Monitors source, and runs again in M minutes if changes are detected.
/XD        = Excludes directories that match the specified names and paths.
-----------------
#>