$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.1/jobs/get'

$Body = @{
    'job_id' = 531261609379698
}

$Response = `
    Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Body $Body `
    -Method Get

Write-Host $Response