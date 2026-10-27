@echo off
title Supply Chain Power BI Dashboard Launcher
cls
echo ==============================================================================
echo       SUPPLY CHAIN INVENTORY OPTIMIZATION - POWER BI LAUNCHER
echo ==============================================================================
echo.
echo Dataset: supply_chain_cleaned.csv (91,250 records, 24 attributes)
echo Location: %~dp0supply_chain_cleaned.csv
echo.
echo ------------------------------------------------------------------------------
echo If Power BI is already open on your screen:
echo 1. Click "Close" on any pop-up message.
echo 2. Click "Get data from another source" (or "Get Data" -> "Text/CSV" on the ribbon).
echo 3. Select "supply_chain_cleaned.csv" and click "Load".
echo ------------------------------------------------------------------------------
echo.
echo Launching corrected Data Source connection...
start "" "%~dp0SupplyChain_DataConnection.pbids"
echo.
echo Once loaded:
echo 1. Go to "View" -> "Browse for themes" -> select "SupplyChain_Enterprise_Theme.json".
echo 2. Refer to "POWERBI_DASHBOARD_BLUEPRINT.md" and "TEACHER_PRESENTATION_GUIDE.md".
echo.
pause
