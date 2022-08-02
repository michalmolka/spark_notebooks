$bearertoken = 'dapif2404d795b6339f3ea714000a799b9e9-2'
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/clusters/edit'

$Body = Get-Content '<path-to-JSON-file>.json' | Out-String

Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Body $Body `
    -Method Post
