#Set option as Args[0]
$opt = $Args[0]
if ([string]::IsNullOrEmpty($opt)) {
    Write-Output "argument is necessary."
    exit
}

try{
    #check if chocolatey is installed
    choco
}catch{
    #Install chocolatey
    Set-ExecutionPolicy RemoteSigned
    Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
    cup -y all
}

#Read package_list
$list = "package_list.txt"

#Install packages
$isTarget = $false
Select-String -Pattern "\s*\S+" $list | ForEach-Object {
    #extract only necessary words
    $str = $_.Matches.Value
    if ($str -match "\[.+\]") {
        #common and selected segments are only installed.
        $isTarget = $str -match "(common|$opt)"
        return
    }
    
    if ($isTarget) {
        choco install -y $str
    }
}