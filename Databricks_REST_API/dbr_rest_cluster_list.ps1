$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/clusters/list'

$Response = `
    Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Method Get

Write-Host $Response