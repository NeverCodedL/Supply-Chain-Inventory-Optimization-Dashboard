# Power BI Supply Chain Inventory Optimization Dashboard
## Enterprise Architecture & Visual Implementation Blueprint

This document provides the exact, production-ready specification for building the 5-page enterprise dashboard for:
**"Supply Chain Inventory Optimization Dashboard: Analyzing Stock Levels, Demand, Reorder Requirements, and Supplier Performance."**

---

### Dashboard Canvas & Global Standards
* **Page Dimensions**: 16:9 Standard Canvas (1280 x 720 px or 1920 x 1080 px).
* **Theme**: Import `SupplyChain_Enterprise_Theme.json` (`View -> Themes -> Browse for themes`).
  * Canvas Background: Light Gray (`#F8FAFC`).
  * Visual Containers: White card (`#FFFFFF`) with 1px border (`#E2E8F0`) and 8px corner radius.
  * Typography: `Segoe UI Semibold` for headings and titles; `Segoe UI` for labels and data values.
  * Color Logic:
    * Primary Accent: Deep Sky Blue (`#0284C7`)
    * Secondary Accent: Deep Teal (`#0D9488`)
    * Below Reorder / Critical Risk: Red (`#EF4444`)
    * At Reorder / Buffer Watch: Amber (`#F59E0B`)
    * Above Reorder / Healthy: Emerald Green (`#10B981`)
* **Global Filter Banner (Placed across the top of all 5 pages, height: 60px)**:
  1. **Date Slicer**: Between slider using `Dim_Date[Date]` (01/01/2024 to 30/12/2024)
  2. **Warehouse Slicer**: Horizontal button group using `Fact_SupplyChain[Warehouse_ID]` (WH_1 – WH_5)
  3. **Region Slicer**: Horizontal button group using `Fact_SupplyChain[Region]` (East, North, South, West)
  4. **Supplier Slicer**: Dropdown menu using `Fact_SupplyChain[Supplier_ID]`
  5. **SKU Slicer**: Searchable dropdown using `Fact_SupplyChain[SKU_ID]`

---

## PAGE 1 — Executive Overview
**Purpose**: Give senior executive leadership an immediate diagnostic view of total inventory capital, sales throughput, warehouse stock distribution, and overall replenishment health.

### Visual 1.1: Top KPI Cards Row (6 Cards across top)
* **Card 1 — Total Inventory Units**:
  * Measure: `[Total Inventory Units]`
  * Value Display: `43.03M` | Label: `Total Inventory Units`
* **Card 2 — Total Units Sold**:
  * Measure: `[Total Units Sold]`
  * Value Display: `1.83M` | Label: `Total Units Sold`
* **Card 3 — Estimated Inventory Value**:
  * Measure: `[Total Estimated Inventory Value]`
  * Value Display: `$525.24M` | Label: `Est. Inventory Value`
* **Card 4 — Avg Supplier Lead Time**:
  * Measure: `[Average Supplier Lead Time]`
  * Value Display: `7.98 Days` | Label: `Avg Lead Time`
* **Card 5 — SKUs Under Pressure**:
  * Measure: `[SKUs Below or At Reorder Point]`
  * Value Display: `50 SKUs` | Label: `SKUs Below/At Reorder`
* **Card 6 — Replenishment Risk Rate**:
  * Measure: `[Replenishment Risk Percentage]`
  * Value Display: `5.24%` | Label: `Replenishment Risk %`
  * Callout color: Red (`#EF4444`)

### Visual 1.2: Dynamic Executive Status Banner
* **Visual Type**: Card or Text Box with Measure
* **Field**: `[Dynamic Executive Insight]`
* **Title**: *"System Diagnostic Status"*
* **Output**: *"System Status: MODERATE WATCH: 5.24% of records operate below reorder point. (Total Below Reorder Records: 4,787 across 50 SKUs)."*

### Visual 1.3: Line Chart (Temporal Trend)
* **Title**: *"How Does Total Inventory Level Fluctuate Across 2024?"*
* **X-Axis**: `Dim_Date[Month_Name]` (Sorted by `Month_Number`)
* **Y-Axis**: `[Total Inventory Units]`
* **Formatting**: Smooth curve, data line color `#0284C7`, data markers enabled, shaded area below curve at 10% opacity.
* **Analytical Takeaway**: Inventory remains stable around 3.58M units per month with slight seasonal adjustments.

### Visual 1.4: Donut Chart (Composition)
* **Title**: *"What Proportion of Operating Days Fall into Replenishment Risk Categories?"*
* **Legend**: `Fact_SupplyChain[Replenishment_Risk]`
* **Values**: `[Total Records]`
* **Slices & Colors**:
  * *Above Reorder Point*: 86,209 (94.48%) -> Emerald Green (`#10B981`)
  * *Below Reorder Point*: 4,787 (5.24%) -> Crimson Red (`#EF4444`)
  * *At Reorder Point*: 254 (0.28%) -> Amber (`#F59E0B`)
* **Formatting**: Donut hole radius 60%, data labels showing Category + Percentage.

### Visual 1.5: Treemap (Value Concentration)
* **Title**: *"Which SKUs Account for the Largest Share of Inventory Capital?"*
* **Category**: `Fact_SupplyChain[SKU_ID]`
* **Values**: `[Total Estimated Inventory Value]`
* **Tooltips**: `[Total Inventory Units]`, `[Average Unit Cost]`
* **Formatting**: Gradient color saturation based on `[Total Estimated Inventory Value]` (`#E0F2FE` to `#0284C7`).
* **Analytical Takeaway**: Visualizes capital concentration across the 50 SKUs.

### Visual 1.6: Horizontal Clustered Bar Chart (Warehouse Comparison)
* **Title**: *"Which Warehouses Hold the Greatest Stock Volumes?"*
* **Y-Axis**: `Fact_SupplyChain[Warehouse_ID]` (WH_1 through WH_5)
* **X-Axis**: `[Total Inventory Units]`
* **Data Labels**: Enabled, formatted in Millions (`#.##M`). Bar color: `#0D9488`.
* **Analytical Takeaway**: WH_1 through WH_5 hold balanced stock (~8.6M units each), proving equitable regional distribution.

### Visual 1.7: Stacked Area Chart (Regional Inventory Evolution)
* **Title**: *"How Does Regional Stock Contribution Evolve Over Time?"*
* **X-Axis**: `Dim_Date[Month_Name]`
* **Y-Axis**: `[Total Inventory Units]`
* **Legend**: `Fact_SupplyChain[Region]` (East, North, South, West)
* **Formatting**: Palette colors (Blue, Teal, Indigo, Amber). Demonstrates multi-dimensional temporal tracking.

---

## PAGE 2 — Inventory and Replenishment Analysis
**Purpose**: Pinpoint exact SKUs and distribution centers experiencing safety stock breaches, prioritize reorders, and evaluate buffer adequacy.

### Visual 2.1: Scatter Plot with Equality Reference Line (Safety Boundary)
* **Title**: *"Where Does Current Inventory Fall Relative to Safety Reorder Thresholds?"*
* **X-Axis**: `Fact_SupplyChain[Reorder_Point]`
* **Y-Axis**: `Fact_SupplyChain[Inventory_Level]`
* **Values / Details**: `Fact_SupplyChain[SKU_ID]`
* **Legend**: `Fact_SupplyChain[Warehouse_ID]`
* **Reference Line**: Add an `X = Y` diagonal reference line (`Line of Equality`) in the Analytics pane.
  * Points **above** the line = Safe operational buffer.
  * Points **below** the line = Safety stock violation (Critical replenishment trigger).
* **Tooltips**: `[Reorder Gap Sum]`, `[Replenishment Risk Percentage]`, `[Total Estimated Inventory Value]`

### Visual 2.2: Matrix Table with Conditional Formatting (Operational Restock Queue)
* **Title**: *"Operational Restock Priority Queue by SKU and Warehouse"*
* **Rows**: `Fact_SupplyChain[SKU_ID]`, `Fact_SupplyChain[Warehouse_ID]`
* **Columns**: `Fact_SupplyChain[Region]`
* **Values**:
  * `[Total Inventory Units]`
  * `[Total Reorder Point Units]`
  * `[Average Reorder Gap]`
  * `[Replenishment Risk Percentage]`
* **Conditional Formatting**:
  * Format `[Replenishment Risk Percentage]` with Background Color:
    * 0% - 2% -> Soft Green (`#D1FAE5`)
    * 2% - 5% -> Soft Yellow (`#FEF3C7`)
    * > 5% -> Soft Red (`#FEE2E2`)
  * Format `[Average Reorder Gap]` with Font Color: Negative = Bold Red (`#DC2626`).

### Visual 2.3: Replenishment Risk Heatmap Matrix (Geographic Risk Concentration)
* **Title**: *"Replenishment Risk Concentration: Breach Counts by Warehouse & Region"*
* **Rows**: `Fact_SupplyChain[Warehouse_ID]`
* **Columns**: `Fact_SupplyChain[Region]`
* **Values**: `[Records Below Reorder Point]`
* **Formatting**: Background color gradient: Minimum (0) = White (`#FFFFFF`), Maximum (High breaches) = Vibrant Red (`#EF4444`).
* **Analytical Takeaway**: Immediately shows teachers which warehouse-region pairings suffer the most frequent stock emergencies.

### Visual 2.4: 100% Stacked Bar Chart (Warehouse Risk Proportions)
* **Title**: *"What Proportion of Daily Warehouse Records Breach Reorder Points?"*
* **Y-Axis**: `Fact_SupplyChain[Warehouse_ID]`
* **X-Axis**: `% of Total Records`
* **Legend**: `Fact_SupplyChain[Replenishment_Risk]`
* **Colors**: Green (`Above`), Amber (`At`), Red (`Below`).
* **Analytical Takeaway**: Confirms each warehouse maintains ~94.5% safe days and ~5.2% risk days.

### Visual 2.5: Gauge Visual (Enterprise Buffer Adequacy)
* **Title**: *"Enterprise Buffer Ratio: Total Stock vs. Safety Threshold"*
* **Value**: `[Total Inventory Units]` (43.03M)
* **Target / Minimum**: `[Total Reorder Point Units]` (24.71M)
* **Callout**: Displays healthy buffer multiplier of ~1.74x safety stock.

---

## PAGE 3 — Demand and Forecast Analysis
**Purpose**: Assess forecasting performance, quantify forecast error and bias, identify demand anomalies, and evaluate promotional impact.

### Visual 3.1: Dual-Axis Line & Clustered Column Chart (Actual vs. Forecast Trajectory)
* **Title**: *"How Closely Did Demand Forecast Track Actual Sales Throughout 2024?"*
* **X-Axis**: `Dim_Date[Month_Name]`
* **Column Values (Bars)**: `[Total Demand Forecast]` (Teal `#0D9488`, 50% transparency)
* **Line Values**: `[Total Units Sold]` (Deep Navy `#0F172A`, 3px solid line with markers)
* **Secondary Line**: `[Mean Absolute Error (MAE)]` (Red `#EF4444`, dashed line on right axis)
* **Analytical Takeaway**: Shows tight tracking between forecasted and actual sales with MAE consistently below 2.5 units per transaction.

### Visual 3.2: Clustered Column Chart (Regional Demand Balance)
* **Title**: *"How Does Forecasted Demand Compare to Actual Sales Across Regions?"*
* **X-Axis**: `Fact_SupplyChain[Region]`
* **Y-Axis**: `[Total Units Sold]` and `[Total Demand Forecast]` (Side-by-side clustered columns)
* **Colors**: Units Sold = `#0284C7`; Forecast = `#94A3B8`.
* **Analytical Takeaway**: Regional sales are evenly distributed (~457k units per region), matching forecast models.

### Visual 3.3: Scatter Plot (Demand Correlation & Bias)
* **Title**: *"Correlation Between Predicted Demand and Actual Units Sold"*
* **X-Axis**: `Fact_SupplyChain[Demand_Forecast]`
* **Y-Axis**: `Fact_SupplyChain[Units_Sold]`
* **Details**: `Fact_SupplyChain[SKU_ID]`
* **Reference Line**: Identity line (Slope = 1). Points clustering tightly along the 45-degree angle prove model accuracy.

### Visual 3.4: Filled Area Chart (MAE Stability)
* **Title**: *"Monthly Trajectory of Mean Absolute Error (MAE)"*
* **X-Axis**: `Dim_Date[Month_Name]`
* **Y-Axis**: `[Mean Absolute Error (MAE)]`
* **Formatting**: Area filled with soft teal gradient (`#0D9488`). Demonstrates error stability across 12 months (2.35 - 2.41 units).

### Visual 3.5: Clustered Bar Chart (Promotional Sales Velocity Comparison)
* **Title**: *"Do Active Promotional Campaigns Drive Higher Daily Unit Sales?"*
* **Y-Axis**: `Fact_SupplyChain[Promotion_Flag]` (0 = Standard Non-Promo, 1 = Active Promotion)
* **X-Axis**: `[Average Units Sold]`
* **Data Labels**: Enabled (e.g., `20.0 Units/Day` vs `20.1 Units/Day`).
* **Analytical Note**: The dataset reveals virtually identical sales distributions between promo (1) and non-promo (0) days. This is a critical finding for the user to explain to their teacher: promotions did not produce statistically significant sales uplift in this dataset.

### Visual 3.6: Forecasting KPI Cards (Summary Strip)
* **Card 1 — Mean Absolute Error (MAE)**: `2.38 units`
* **Card 2 — Forecast Bias**: `-0.028 units` (Proof of zero directional bias)
* **Card 3 — Overall Forecast Accuracy**: `88.1%`

---

## PAGE 4 — Supplier and Warehouse Performance
**Purpose**: Benchmark vendor lead times, assess supplier risk concentration, and identify logistical bottlenecks.

### Visual 4.1: Horizontal Lollipop / Bar Chart (Supplier Lead Time Ranking)
* **Title**: *"Which Suppliers Exhibit the Longest Turnaround Times (Lead Time)?"*
* **Y-Axis**: `Fact_SupplyChain[Supplier_ID]` (SUP_1 through SUP_10, sorted descending by lead time)
* **X-Axis**: `[Average Supplier Lead Time]`
* **Data Labels**: Enabled (`0.0 days`). Bar color: `#0284C7`.
* **Benchmark Reference Line**: Enterprise Average (7.98 days).
* **Analytical Takeaway**: Highlights suppliers above the 8-day average who pose greater replenishment exposure.

### Visual 4.2: Scatter Plot (Supplier Lead Time vs. Replenishment Risk %)
* **Title**: *"Does Longer Supplier Lead Time Correlate with Increased Reorder Risk?"*
* **X-Axis**: `[Average Supplier Lead Time]`
* **Y-Axis**: `[Replenishment Risk Percentage]`
* **Details / Labels**: `Fact_SupplyChain[Supplier_ID]` (SUP_1 through SUP_10)
* **Bubble Size**: `[Total Estimated Inventory Value]`
* **Analytical Takeaway**: Evaluates whether slow delivery schedules cause warehouses to fall below reorder thresholds.

### Visual 4.3: Stacked Column Chart (Warehouse Stock by Region)
* **Title**: *"Distribution of Physical Inventory by Warehouse and Region"*
* **X-Axis**: `Fact_SupplyChain[Warehouse_ID]`
* **Y-Axis**: `[Total Inventory Units]`
* **Legend**: `Fact_SupplyChain[Region]`
* **Formatting**: Shows regional inventory allocation across the 5 distribution facilities.

### Visual 4.4: Supplier Scorecard Matrix
* **Title**: *"Comprehensive Vendor Operational Scorecard"*
* **Rows**: `Fact_SupplyChain[Supplier_ID]`
* **Values**:
  * `[Average Supplier Lead Time]`
  * `[Supplier Lead Time StdDev]`
  * `[Total Inventory Units]`
  * `[Total Estimated Inventory Value]`
  * `[Records Below Reorder Point]`
  * `[Supplier Risk Concentration]`
* **Sorting**: Sorted by `[Average Supplier Lead Time]` descending.

---

## PAGE 5 — Financial and Inventory Value Analysis
**Purpose**: Quantify capital tied up in stock, analyze unit cost vs selling price margins, and decompose valuation across business dimensions.

### Visual 5.1: Financial KPI Cards
* **Card 1 — Total Estimated Inventory Value**: `$525.24M`
* **Card 2 — Estimated Gross Revenue**: `$46.80M`
* **Card 3 — Average Unit Cost**: `$12.21`
* **Card 4 — Average Unit Price**: `$25.57`
* **Card 5 — Estimated Gross Margin**: `52.2%`

### Visual 5.2: Treemap (SKU Capital Concentration)
* **Title**: *"Which Products Represent the Largest Capital Investment?"*
* **Category**: `Fact_SupplyChain[SKU_ID]`
* **Values**: `[Total Estimated Inventory Value]`
* **Color Saturation**: `[Average Unit Cost]`
* **Analytical Takeaway**: Allows managers to identify high-value "Class A" inventory items (Pareto analysis).

### Visual 5.3: Line Chart (Inventory Capital Over Time)
* **Title**: *"Estimated Working Capital Tied Up in Inventory Over 2024"*
* **X-Axis**: `Dim_Date[Month_Name]`
* **Y-Axis**: `[Total Estimated Inventory Value]`
* **Formatting**: Currency format (`$#.##M`), smooth line, data markers enabled.

### Visual 5.4: Scatter Plot (Unit Cost vs. Unit Price by SKU)
* **Title**: *"Product Margin Analysis: Unit Cost vs. Unit Price by SKU"*
* **X-Axis**: `Fact_SupplyChain[Unit_Cost]`
* **Y-Axis**: `Fact_SupplyChain[Unit_Price]`
* **Details**: `Fact_SupplyChain[SKU_ID]`
* **Reference Line**: 2x Markup line.
* **Analytical Takeaway**: Verifies that every SKU maintains positive margin (Unit_Price > Unit_Cost), with healthy markups across all 50 items.

### Visual 5.5: Decomposition Tree (Interactive Multi-Dimensional Breakdown)
* **Title**: *"Interactive Capital Decomposition: Region -> Warehouse -> Supplier -> SKU"*
* **Analyze**: `[Total Estimated Inventory Value]`
* **Explain By**:
  1. `Fact_SupplyChain[Region]`
  2. `Fact_SupplyChain[Warehouse_ID]`
  3. `Fact_SupplyChain[Supplier_ID]`
  4. `Fact_SupplyChain[SKU_ID]`
* **Interactivity**: Enables teacher and user to click through any branch to discover where capital is locked.
