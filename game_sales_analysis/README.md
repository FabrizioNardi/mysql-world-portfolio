# 🎮 Video Game Sales Analysis (SQL Project)

## 📁 Dataset
The dataset used in this project comes from `tutorial.global_weekly_charts_2013_2014` and contains global weekly sales of video games from 2013 to 2014.

## 🎯 Objective
The purpose of this project is to analyze video game sales data using SQL queries to extract key insights about platforms, publishers, game genres, and temporal sales trends.

## 🧠 Key Questions Answered
- Which platform had the highest total weekly sales?
- Which game was the most sold in terms of weekly sales?
- What is the number of unique games available per platform?
- What are the most frequent genres on the PS3?
- How many Role-Playing games exist per platform?
- Who are the top publishers by number of games?
- What are the sales performances of 'Grand Theft Auto V' across PS3 and X360?
- Which was the week with the highest global sales?
- What are the best-selling games from independent publishers (with 1 or 2 games only)?

## 📊 SQL Techniques Used
- `GROUP BY`, `ORDER BY`, `LIMIT`
- Aggregate functions: `SUM()`, `COUNT()`, `DISTINCT`
- Filtering with `WHERE` and `LIKE`
- CTE (Common Table Expression) using `WITH`

## 📌 Sample Insights
- **PS3** and **X360** dominate both in number of games and sales.
- Top games include **Grand Theft Auto V** and various **Pokémon** titles.
- Publishers with fewer games can still reach high sales (long-tail effect).

## 🛠️ Tools Used
- SQL (Mode SQL Tutorial Platform)
- CSV data available for extended use in Excel or Power BI

## 📂 Folder Structure (Suggested for GitHub)
```
📁 game_sales_analysis/
├── game_sales_analysis.sql
└── README.md
```

## 🧩 Next Steps (Optional Improvements)
- Create visualizations in Power BI or Tableau.
- Use Python (Pandas/Matplotlib) for complementary data analysis.
- Incorporate more recent sales data for trend evolution.

---
📬 *Feel free to fork, reuse or contribute to this analysis!*
