$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken" 
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.1/jobs/list'
$Response = `
    Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Method Get

$jsonObj = ConvertFrom-Json $([String]::new($Response.Content))

foreach ($i0 in $jsonObj.jobs) {
    Write-Output $i0
}
