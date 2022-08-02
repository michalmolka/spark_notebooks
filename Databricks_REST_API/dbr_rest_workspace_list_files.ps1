$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/workspace/list'

$Body = @{
    'path' = '/ETL_DBR'
}

Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Body $Body  `
    -Method Get