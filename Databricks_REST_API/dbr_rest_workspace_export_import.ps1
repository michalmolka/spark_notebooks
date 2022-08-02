$bearertoken = <your-token>
$Headers = @{ 
    'Authorization' = "Bearer $bearertoken"
}
$Uri_Export = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/workspace/export'

$Body_Export = @{
    'path'            = '/ETL_DBR/Notebook01'
    'format'          = 'SOURCE'
    "direct_download" = 'false'
}

$Request = `
    Invoke-WebRequest `
    -Uri  $Uri_Export `
    -Headers $Headers `
    -Body $Body_Export  `
    -Method Get

$parse_request = $Request | ConvertFrom-Json
$content_string = $parse_request.content


$Uri_Import = 'https://<databricks-instance>.azuredatabricks.net/api/2.0/workspace/import'
$Body_Import = "{
    'path'     : '/ETL_DBR_SECOND/New_Notebook011',
    'format'   :'SOURCE',
    'language' : 'PYTHON',
    'content'  : '$content_string'
}"

$Body_Import = $Body_Import | ConvertFrom-Json
$Request = `
    Invoke-WebRequest `
    -Uri  $Uri_Import `
    -Headers $Headers `
    -Body (ConvertTo-Json $Body_Import)  `
    -Method Post