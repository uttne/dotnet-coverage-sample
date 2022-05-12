dotnet test
reportgenerator "-reports:.\test\SampleCli.Tests\coverage.opencover.xml" "-reporttypes:Html" "-targetdir:report" "-historydir:histories"