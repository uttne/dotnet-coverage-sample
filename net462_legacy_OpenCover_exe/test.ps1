Push-Location -Path $PSScriptRoot | Out-Null

$MSBuild = "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"
$SlnPath = ".\CoverageSample.sln"

$TestRunner = ".\packages\NUnit.ConsoleRunner.3.15.0\tools\nunit3-console.exe"

$TestTargetPath = ".\test\SampleCli.Tests\bin\Debug\SampleCli.Tests.dll"
$Filters = "+[SampleCli]*"

$CoverageTool = ".\packages\OpenCover.4.7.1221\tools\OpenCover.Console.exe"

$ReportDirPath = ".\report"
$TestReportPath = "$ReportDirPath\TestResult.xml"
$CoverageReportPath = "$ReportDirPath\coverage.opencover.xml"
$CoverageHtmlReportPath = "$ReportDirPath\coverage"
$CoverageHtmlReportHistoryPath = "$ReportDirPath\coverage\histories"

$ReportGenTool = ".\packages\ReportGenerator.5.1.6\tools\net47\ReportGenerator.exe"

if( -not (Test-Path $ReportDirPath) ){
    New-Item -ItemType Directory -Path $ReportDirPath | Out-Null
}

try{
    & $MSBuild $SlnPath /t:rebuild /p:Configuration=Debug /p:Platform="Any CPU"
    # & $CoverageTool -register:user -target:"$TestRunner" `
    #     -targetargs:"--out=.\TestResult.xml ""$TestTargetName""" `
    #     -targetdir:"$TestTargetDirPath" `
    #     -filter:"$Filters" `
    #     -output:result.xml -mergebyhash
    & $CoverageTool -register:user -target:"$TestRunner" `
        -targetargs:"--out=""$TestReportPath"" ""$TestTargetPath""" `
        -targetdir:"." `
        -filter:"$Filters" `
        -output:"$CoverageReportPath" -mergebyhash
    # & $TestRunner --out=.\TestResult.xml $TestTargetPath

    & $ReportGenTool "-reports:$CoverageReportPath" `
        "-targetdir:$CoverageHtmlReportPath" `
        "-historydir:$CoverageHtmlReportHistoryPath" `
        -reporttypes:Html
}
finally{
    Pop-Location | Out-Null
}

