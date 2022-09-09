# Author: Anthony Segedi
# NOTE: you will need to run the following line to allow scripts to run on your system (needs to be done in administrator mode)
# Set-ExecutionPolicy: Remote-Signed

# progDir: the java source files directory (typically src). If blank, it is prompted for
$progDir = "./src"
#jarPath: The path to the checkstyle.jar file
$jarPath = "./checkstyle.jar"
# userCmd: The command used to execute on all java files in the respective directory
$userCmd = Join-Path -Path "$progDir" -ChildPath "/*.java"

if ([string]::IsNullOrEmpty($progDir)) {
    $progDir = Read-Host -prompt "Enter the path to your java files"
}

if (-not (Test-Path -Path $progDir -PathType Container)) {
    Write-Output "'$progDir' is not a directory. Please fix the $$progDir variable / reenter a valid path"
    Return
}

# Style Checker:
java -jar $jarPath -c cs310code.xml $userCmd
# Comments Checker: 
java -jar $jarPath -c cs310comments.xml $userCmd