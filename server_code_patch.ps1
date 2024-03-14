Param(
    [Parameter(Mandatory=$false)]
    [Switch] $SIT,
    
    [Parameter(Mandatory = $false)]
    $SourceDir = "./Server"
)

if ($SIT) {
    # 去除IP限制
    $FILE_PATH = "$SourceDir/project/assets/configs/http.json"
    $SEARCH_STRING = "127.0.0.1"
    $REPLACE_STRING = "0.0.0.0"
    # 读取文件内容
    $FILE_CONTENT = Get-Content -Path $FILE_PATH
    # 替换指定字符串
    $NEW_CONTENT = $FILE_CONTENT.replace($SEARCH_STRING, $REPLACE_STRING)
    # 将修改后的内容写回文件
    $NEW_CONTENT | Set-Content -Path $FILE_PATH
    # 打印日志
    Write-Output "Replace $SEARCH_STRING with $REPLACE_STRING in file $FILE_PATH"
}

# 开启 spt give 命令
$FILE_PATH = "$SourceDir/project/assets/configs/core.json"
$SEARCH_STRING = "`"giveCommandEnabled`": false"
$REPLACE_STRING = "`"giveCommandEnabled`": true"
# 读取文件内容
$FILE_CONTENT = Get-Content -Path $FILE_PATH
# 替换指定字符串
$NEW_CONTENT = $FILE_CONTENT.replace($SEARCH_STRING, $REPLACE_STRING)
# 将修改后的内容写回文件
$NEW_CONTENT | Set-Content -Path $FILE_PATH
# 打印日志
Write-Output "Replace $SEARCH_STRING with $REPLACE_STRING in file $FILE_PATH"
