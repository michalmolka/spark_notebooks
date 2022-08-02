$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri = 'https://<databricks-instance>.azuredatabricks.net/api/2.1/jobs/run-now'

$Body = "{
    'job_id' : 573023562223714,
    'notebook_params': {
        'ID01': 205,
        'ID02': 305
      }
}"

$Body = $Body | ConvertFrom-Json

Invoke-WebRequest `
    -Uri  $Uri `
    -Headers $Headers `
    -Body (ConvertTo-Json $Body) `
    -Method Post

