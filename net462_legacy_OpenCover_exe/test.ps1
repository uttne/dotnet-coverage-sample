Push-Location -Path $PSScriptRoot | Out-Null

$MSBuild = "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"
$TestRunner = ".\packages\NUnit.ConsoleRunner.3.15.0\tools\nunit3-console.exe"
$CoverageTool = ".\packages\OpenCover.4.7.1221\tools\OpenCover.Console.exe"
$ReportGenTool = ".\packages\ReportGenerator.5.1.7\tools\net47\ReportGenerator.exe"


$SlnPath = ".\CoverageSample.sln"

$TestTargetPath = ".\test\SampleCli.Tests\bin\Debug\SampleCli.Tests.dll"
$Filters = "+[SampleCli]*"

$ReportDirPath = ".\report"
$TestReportPath = "$ReportDirPath\TestResult.xml"
$CoverageReportPath = "$ReportDirPath\coverage.opencover.xml"
$CoverageHtmlReportPath = "$ReportDirPath\coverage"
$CoverageHtmlReportHistoryPath = "$ReportDirPath\coverage\histories"



try{
    if( -not (Test-Path ".\packages")){
        Write-Error "'.\packages' is not found. Please run 'restore.ps1'." -ErrorAction Stop
    }
    
    if( -not (Test-Path $ReportDirPath) ){
        New-Item -ItemType Directory -Path $ReportDirPath | Out-Null
    }

    & $MSBuild $SlnPath /t:rebuild /p:Configuration=Debug /p:Platform="Any CPU"
    & $CoverageTool -register:user -target:"$TestRunner" `
        -targetargs:"--out=""$TestReportPath"" ""$TestTargetPath""" `
        -targetdir:"." `
        -filter:"$Filters" `
        -output:"$CoverageReportPath" -mergebyhash

    & $ReportGenTool "-reports:$CoverageReportPath" `
        "-targetdir:$CoverageHtmlReportPath" `
        "-historydir:$CoverageHtmlReportHistoryPath" `
        -reporttypes:Html
}
finally{
    Pop-Location | Out-Null
}

