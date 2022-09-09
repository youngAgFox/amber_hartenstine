# NOTE: you will need to run the following line to allow scripts to run on your system (needs to be done in administrator mode)
# Set-ExecutionPolicy: Remote-Signed

# progDir: the program directory. If blank, it is prompted for
# Should be src if I recall correctly
$progDir = "src"
$jarPath = "./checkstyle.jar"
$userCmd = $progDir + "/*.java"
# Style Checker:

if ([string]::IsNullOrEmpty($progDir)) {
    $progDir = Read-Host -prompt "Enter the path to your java files"
}

if (-not (Test-Path -Path $progDir -PathType Container)) {
    Write-Output "'$progDir' is not a directory"
    Return
}

java -jar $jarPath -c cs310code.xml $userCmd
# Comments Checker: 
java -jar $jarPath -c cs310comments.xml $userCmd