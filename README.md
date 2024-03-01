# 需要配合 [SPT-AKI_DLL](https://github.com/yhl452493373/SPT-AKI_DLL)使用，对actions的build.yaml进行了一些修改
+ `Build Windows Aki Packages` - `matrix` - `version` 中增加了dll文件下载地址`dll_url`，其值为`https://github.com/yhl452493373/SPT-AKI_DLL/raw/main/`，对应我的`SPT-AKI_DLL`仓库
+ `Build Aki Server`中的`run`后面，增加了`-Release`
+ `Build Aki Modules`中的`run`后面，将DLL的下载地址由`${{ secrets.DLL_URL }}`改成了`${{ matrix.versions.dll_url }}`


# SPT-AKI_CI
Scripts for building SPT-Aki Server, Launcher, Modules and also making an entire release package.

Also has daily builds if you want to stay on the bleeding edge of bleeding edge. See [Actions](https://github.com/qe201020335/SPT-AKI_CI/actions).
> [!IMPORTANT] 
> Make sure to always backup your profiles before using any builds!

> [!CAUTION]
> Do NOT report any issues you have using the scripts or builds to the SPT-AKI team!
>
> Use them at your own risk!


## Build Aki Server
### Requirements
* PowerShell
* Node 18
* Git
* Git lfs
### Parameters
| Parameter | Required? | Description |
|----------|-----|-----|
| `-Branch` | no | The branch to build on |
| `-Commit` | no | The exact commit to build, doesn't matter which branch it is |
| `-Overwrite` | no | If present, will delete existing source folder without asking |
| `-Release` | no | If present, will make a release build instead of debug |
### Examples
Build the default branch (aka master or main)
```pwsh
pwsh ./build_server.ps1
```
Build the `0.13.5.0` branch
```pwsh
pwsh ./build_server.ps1 -Branch 0.13.5.0
```
Build a tag. Find out tag names on SPT-Aki's source repo. [Tags](https://dev.sp-tarkov.com/SPT-AKI/Server/tags) 
```pwsh
pwsh ./build_server.ps1 -Branch 3.7.2
```
Build an exact commit
```pwsh
pwsh ./build_server.ps1 -Commit fbb1d7eb2f6b7847fc1d6bfb2f36dd794f3b1301
```
Make a release build on the tag 3.7.5
```pwsh
pwsh ./build_server.ps1 -Release -Branch 3.7.5
```
