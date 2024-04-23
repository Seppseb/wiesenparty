@echo off
setlocal enabledelayedexpansion

rem Folder containing CSV files (relative path)
set "folder_path=./csv_files"

rem Combined CSV file name
set "combined_csv_file=combined.csv"

rem Initialize flag to write header only once
set "write_header=true"

rem Initialize combined CSV file with header
echo Vorname,Nachname,Email,Handynummer,Stadt,Straße,Hausnummer > "%combined_csv_file%"

rem Iterate through each file in the folder
for %%F in ("%folder_path%\*.csv") do (
    set "first_line=true"
    for /f "delims=" %%a in ('type "%%F"') do (
        if "!first_line!"=="false" (
            echo %%a >> "%combined_csv_file%"
        ) else (
            set "first_line=false"
        )
    )
)

echo Combined CSV file saved as %combined_csv_file%
