$path = "c:\Audiobooks" #Change this to the path of your library before running the script

Get-ChildItem $path -Recurse|Foreach-Object{
    if($_.Name -eq "desc.txt" -or $_.Name -eq "reader.txt"){
        Write-Host "Converting $($_.FullName)"
        Copy-Item $_.FullName "$($_.FullName).$((get-date -uformat %s).split(".")[0])" -Force
        [System.IO.File]::WriteAllLines($_.FullName, (get-content $_.FullName), (New-Object System.Text.UTF8Encoding($False)))
    }
}
