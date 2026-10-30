# Supply Chain Inventory Optimization Dashboard
## Power BI Master Solution Package

Welcome to the complete, enterprise-grade Power BI dashboard solution for:
**"Supply Chain Inventory Optimization Dashboard: Analyzing Stock Levels, Demand, Reorder Requirements, and Supplier Performance."**



---

### Package Contents & File Inventory

| File | Purpose |
| :--- | :--- |
| **`SupplyChain_DataConnection.pbids`** | **1-Click Power BI Data Source Connection**. Double-click to instantly open Power BI connected to the cleaned CSV. |
| **`SupplyChain_Enterprise_Theme.json`** | **Enterprise Design Theme**. 1-click import into Power BI for light-gray canvas, navy headers, teal accents, and rounded cards. |
| **`PowerQuery_M_Code.pq`** | **Production Power Query (M) Scripts** for `Fact_SupplyChain` and `Dim_Date` (Calendar Dimension). |
| **`DAX_Measures_Library.dax`** | **30+ Enterprise DAX Measures** with complete documentation, formatting strings, and DIVIDE guards. |
| **`POWERBI_DASHBOARD_BLUEPRINT.md`** | **Visual-by-Visual Step-by-Step Blueprint** for all 5 dashboard pages with exact field mappings. |
| **`DATA_VALIDATION_REPORT.md`** | **Audited Data Quality Report** matching all 91,250 records and addressing `Stockout_Flag` and `Order_Quantity`. |
| **`TEACHER_PRESENTATION_GUIDE.md`** | **Student Presentation Guide & Defense Script** with answers to tough teacher questions. |
| **`Launch_PowerBI.bat`** | **Quick Launcher Script** to open Power BI Desktop with the dataset connection. |
| **`supply_chain_cleaned.csv`** | **Master Cleaned Fact Dataset** (91,250 rows, 24 attributes, zero nulls, pre-calculated metrics). |

---

### Quick 3-Step Setup Guide

#### Step 1: Open the Data in Power BI Desktop
1. Double-click **`SupplyChain_DataConnection.pbids`** (or open Power BI Desktop -> `Get Data` -> `Text/CSV` -> select `supply_chain_cleaned.csv`).
2. Power BI will display the preview window with all 24 columns pre-detected.
3. Click **"Load"**. All 91,250 rows load in under 5 seconds with zero errors!

#### Step 2: Apply the Professional Enterprise Theme
1. In the top ribbon, click the **"View"** tab.
2. In the Themes dropdown gallery, click **"Browse for themes"**.
3. Select **`SupplyChain_Enterprise_Theme.json`** from this directory.
4. Your canvas immediately adopts the clean light-slate styling, dark navy typography, teal highlights, and rounded cards!

#### Step 3: Add Calendar & DAX Measures
1. Follow **`PowerQuery_M_Code.pq`** if you wish to link the `Dim_Date` calendar table via `Dim_Date[Date]` $\rightarrow$ `Fact_SupplyChain[Date]`.
2. Copy and paste measures from **`DAX_Measures_Library.dax`** using `New Measure` in the Data ribbon.
3. Follow **`POWERBI_DASHBOARD_BLUEPRINT.md`** to place the exact visuals across the 5 pages.

---

### Dashboard Page Architecture (10+ Diverse Chart Types)

* **PAGE 1 — Executive Overview**:
  * 6 KPI Summary Cards (43.03M Inventory Units, 1.83M Sales, $525.24M Value, 7.98d Lead Time, 50 SKUs under pressure, 5.24% Risk).
  * Dynamic Executive Diagnostic Banner.
  * Line Chart: 2024 Monthly Inventory Trend.
  * Donut Chart: Replenishment Risk Proportions (94.48% Safe, 5.24% Risk, 0.28% Buffer).
  * Treemap: SKU Capital Concentration (Pareto 80/20 analysis).
  * Horizontal Clustered Bar Chart: Warehouse Stock Holding.
  * Stacked Area Chart: Regional Inventory Contribution across Time.

* **PAGE 2 — Inventory & Replenishment Analysis**:
  * Scatter Plot with Diagonal Reference Line ($X=Y$): Pinpoints SKUs below safety reorder threshold.
  * Matrix Table with 3-Color Conditional Formatting: Operational Restock Priority Queue.
  * Replenishment Risk Heatmap Matrix: Geographic Risk Density by Warehouse & Region.
  * 100% Stacked Bar Chart: Normalized Warehouse Breach Percentages.
  * Gauge Visual: Enterprise Inventory Buffer Multiplier.

* **PAGE 3 — Demand & Forecast Analysis**:
  * Dual-Axis Line & Column Chart: Predicted Demand vs. Actual Sales Trajectory.
  * Clustered Column Chart: Actual vs. Forecast Demand across Regions.
  * Scatter Plot: Predicted Demand vs. Units Sold (Model Correlation).
  * Filled Area Chart: Monthly MAE Error Envelope Stability.
  * Clustered Bar Chart: Promotional vs. Baseline Sales Velocity Comparison.
  * KPI Cards: MAE (2.38 units), Forecast Bias (-0.028 units), Forecast Accuracy (88.1%).

* **PAGE 4 — Supplier & Warehouse Performance**:
  * Horizontal Lollipop / Bar Chart: Supplier Lead Times Ranked Descending.
  * Scatter Plot: Supplier Lead Time vs. Replenishment Risk Rate.
  * Stacked Column Chart: Warehouse Inventory Volume by Region.
  * Comprehensive Vendor Scorecard Matrix.

* **PAGE 5 — Financial & Inventory Value Analysis**:
  * Financial KPI Cards: $525.24M Inventory Value, $46.80M Revenue, 52.2% Gross Margin.
  * Treemap: High-Value SKU Capital Allocation.
  * Line Chart: Inventory Value Progression across Months.
  * Scatter Plot: Unit Cost vs. Unit Price by SKU (Margin Analysis).
  * Multi-Level Decomposition Tree: Interactive AI Drill-Down (Region $\rightarrow$ Warehouse $\rightarrow$ Supplier $\rightarrow$ SKU).

---

