// ==============================================================================
// POWER QUERY (M) SCRIPTS: SUPPLY CHAIN INVENTORY OPTIMIZATION
// ==============================================================================
// Instructions:
// 1. In Power BI Desktop, click "Home" -> "Transform Data" to open Power Query Editor.
// 2. Click "Home" -> "New Source" -> "Blank Query".
// 3. Click "Advanced Editor" and replace the default text with Query 1 below. Rename the query to "Fact_SupplyChain".
// 4. Repeat for Query 2 below and rename the query to "Dim_Date".
// 5. Click "Close & Apply".
// ==============================================================================

// ------------------------------------------------------------------------------
// QUERY 1: Fact_SupplyChain
// ------------------------------------------------------------------------------
let
    // Source loading from local cleaned CSV
    Source = Csv.Document(
        File.Contents("c:\Users\mmk29\Downloads\DV\supply_chain_cleaned.csv"),
        [Delimiter=",", Columns=24, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    
    // Explicit Data Type Casting for All 24 Columns
    #"Changed Types" = Table.TransformColumnTypes(#"Promoted Headers",{
        {"Date", type date},
        {"SKU_ID", type text},
        {"Warehouse_ID", type text},
        {"Supplier_ID", type text},
        {"Region", type text},
        {"Units_Sold", Int64.Type},
        {"Inventory_Level", Int64.Type},
        {"Supplier_Lead_Time_Days", Int64.Type},
        {"Reorder_Point", Int64.Type},
        {"Order_Quantity", Int64.Type},
        {"Unit_Cost", type number},
        {"Unit_Price", type number},
        {"Promotion_Flag", Int64.Type},
        {"Stockout_Flag", Int64.Type},
        {"Demand_Forecast", type number},
        {"Inventory_Value", type number},
        {"Reorder_Gap", Int64.Type},
        {"Forecast_Error", type number},
        {"Absolute_Forecast_Error", type number},
        {"Inventory_to_Reorder_Ratio", type number},
        {"Replenishment_Risk", type text},
        {"Year", Int64.Type},
        {"Month", Int64.Type},
        {"Month_Name", type text}
    })
in
    #"Changed Types"


// ------------------------------------------------------------------------------
// QUERY 2: Dim_Date (Calendar Dimension for Time Intelligence)
// ------------------------------------------------------------------------------
let
    // Generate dates covering full 2024 calendar year (366 days for leap year 2024)
    StartDate = #date(2024, 1, 1),
    TotalDays = 366,
    DateList = List.Dates(StartDate, TotalDays, #duration(1, 0, 0, 0)),
    #"Converted to Table" = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}, null, ExtraValues.Error),
    #"Changed Date Type" = Table.TransformColumnTypes(#"Converted to Table",{{"Date", type date}}),
    
    // Calendar Attribute Derivations
    #"Added Year" = Table.AddColumn(#"Changed Date Type", "Year", each Date.Year([Date]), Int64.Type),
    #"Added Month Number" = Table.AddColumn(#"Added Year", "Month_Number", each Date.Month([Date]), Int64.Type),
    #"Added Month Name" = Table.AddColumn(#"Added Month Number", "Month_Name", each Date.MonthName([Date]), type text),
    #"Added Quarter" = Table.AddColumn(#"Added Month Name", "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    #"Added Year_Month" = Table.AddColumn(#"Added Quarter", "Year_Month", each Date.ToText([Date], "yyyy-MM"), type text),
    #"Added Day" = Table.AddColumn(#"Added Year_Month", "Day", each Date.Day([Date]), Int64.Type),
    #"Added Day of Week" = Table.AddColumn(#"Added Day", "Day_of_Week", each Date.DayOfWeekName([Date]), type text),
    #"Added Day of Week Number" = Table.AddColumn(#"Added Day of Week", "Day_of_Week_Number", each Date.DayOfWeek([Date], Day.Monday) + 1, Int64.Type),
    #"Added Weekend Flag" = Table.AddColumn(#"Added Day of Week Number", "Is_Weekend", each if [Day_of_Week_Number] >= 6 then "Weekend" else "Weekday", type text)
in
    #"Added Weekend Flag"
