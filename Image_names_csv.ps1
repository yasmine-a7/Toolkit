$path = "C:\Users\yassy\OneDrive - Victoria University of Wellington - STAFF\PhD\Other_projects\Fiordland_sponge_ID"
Get-ChildItem -Path $path -Recurse -Filter *.jpg | ForEach-Object {
    $relativePath = $_.FullName.Substring($path.Length + 1)
    $parts = $relativePath -split '\\'
    [PSCustomObject]@{
        Site = $parts[0]
        Depth = $parts[1]
        Name = $_.Name
    }
} | Export-Csv -Path "$path\image_list.csv" -NoTypeInformation
