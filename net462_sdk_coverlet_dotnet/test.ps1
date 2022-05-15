Push-Location -Path $PSScriptRoot | Out-Null

$ReportGenTool = "$Home\.nuget\packages\reportgenerator\5.1.6\tools\net47\ReportGenerator.exe"

$ReportDirPath = ".\report"
$CoverageReportPath = "$ReportDirPath\coverage.opencover.xml"
$CoverageHtmlReportPath = "$ReportDirPath\coverage"
$CoverageHtmlReportHistoryPath = "$ReportDirPath\coverage\histories"



try{
    Get-Command dotnet -ErrorAction Stop | Out-Null

    dotnet test

    & $ReportGenTool "-reports:$CoverageReportPath" `
        "-targetdir:$CoverageHtmlReportPath" `
        "-historydir:$CoverageHtmlReportHistoryPath" `
        -reporttypes:Html
}
finally{
    Pop-Location | Out-Null
}

