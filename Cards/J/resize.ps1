# Resize all PNGs with 2010x2814 dimensions to 2187x2975, centered on #000101 background
Get-ChildItem -Filter *.png | ForEach-Object {
	$file = $_.FullName
	$dimensions = & magick identify -format "%w %h" $file

	if ($dimensions -eq "2010 2814") {
		magick mogrify -gravity center -background "#000101" -extent 2187x2975 $file
		Write-Host "Modified: $($_.Name)" -ForegroundColor Green
	} else {
		Write-Host "Skipped: $($_.Name) ($dimensions)" -ForegroundColor Yellow
	}
}
