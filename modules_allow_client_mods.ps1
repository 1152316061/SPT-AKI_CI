Param(
    [Parameter(Mandatory = $false)]
    $SourceDir = "./Modules"
)

$FILE_PATH = "$SourceDir/project/Aki.Core/AkiCorePlugin.cs"
$SEARCH_STRING = "new PreventClientModsPatch().Enable();"
$REPLACE_STRING = "//new PreventClientModsPatch().Enable();"

# 读取文件内容
$FILE_CONTENT = Get-Content -Path $FILE_PATH

# 替换指定字符串
$NEW_CONTENT = $FILE_CONTENT.replace($SEARCH_STRING, $REPLACE_STRING)

# 将修改后的内容写回文件
$NEW_CONTENT | Set-Content -Path $FILE_PATH

Write-Output "Allow load Client Mods"
