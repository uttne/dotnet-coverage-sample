Push-Location -Path $PSScriptRoot | Out-Null

$NugetSrcUrl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$NugetDir = "./nuget"
$NugetTool = "$NugetDir/nuget.exe"



try{
    if( -not (Test-Path $NugetDir) ){
        New-Item -ItemType Directory -Path $NugetDir | Out-Null
    }

    if( -not (Test-Path $NugetTool) ){
        Invoke-WebRequest -Uri $NugetSrcUrl -OutFile $NugetTool
    }

    & $NugetTool restore
}
finally{
    Pop-Location | Out-Null
}

