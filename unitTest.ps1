# Author: Anthony Segedi
#
# NOTE: you will need to run the following line to allow scripts to run on your system (needs to be done in administrator mode)
# Set-ExecutionPolicy: Remote-Signed
# after that you can run the script using './unitTest.ps1`
#
# This script expects a single char argument - r, c, or b (run, compile, or both)
# # # # # # # # # # # # # # # 

# This allows us to accept parameters from cmd line... little weird in pwsh I know
param($p1)

if ([string]::IsNullOrEmpty($p1)) {
    Write-Output "Expected args <c|r|b>","c - compile","r - run","b - compile then run"
    Return
} elseif ($p1 -notmatch "^[crb]$") {
    Write-Output "Unexpected arg: '$p1'"
    Return
}

# progPath: the path to the test program. If blank, it is prompted for
$progPath = ""
# jarPath: the path to the junit jar file. If blank, it is ignored
# As you can see I have provided a potential input for you to uncomment here
#$jarPath = "./junit-4.11.jar"
$jarPath = ""
# The name of the program Test file. If blank, it will prompt

if ([string]::IsNullOrEmpty($progPath)) {
    $progPath = Read-Host -prompt "Enter the path to your java test file"
    if (-not (Test-Path -Path $progPath -PathType Leaf)) {
        Write-Output "'$progPath' does not exist"
        Return
    }
}

$result = 0

# Compile Unit Tests: 
if ($p1 -match "[rb]") {
    Write-Output "Compiling '$progPath'"
    $result = javac "-cp" ".;$jarPath;" "$progPath"
}

if ($p1 -notmatch "[cb]") {
    Return
} elseif (!($return -eq 0)) {
    return
}

# Run Unit Tests: 
$progName = [IO.Path]::GetFileNameWithoutExtension($progPath)
Write-Output "Running '$progName'"
if ([string]::IsNullOrEmpty($jarPath)) {
    java "$progName"
} else {
    java "-cp" ".;$jarPath;" "$progName"
}