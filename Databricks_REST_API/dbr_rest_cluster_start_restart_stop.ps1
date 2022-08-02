$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/clusters/start'
# $Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/clusters/restart'
# $Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/clusters/start'
$Body = "{
    'cluster_id':'0731-174226-ojsmtds7'
}"

$Body = $Body | ConvertFrom-Json

Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Body (ConvertTo-Json $Body) `
    -Method Post

