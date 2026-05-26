# E-Commerce Product Funnel & User Friction Analytics

## Project Executive Summary
This project focuses on translating raw, continuous user behavioral event logs into high-impact product performance insights. Using advanced SQL engineering strategies (Common Table Expressions, conditional aggregation, explicit data-type casting, and time-velocity metrics), this pipeline isolates user friction drop-offs across a multi-stage digital e-commerce customization funnel.

## Business Scenario
An upscale product brand launches an interactive online configurator tool. While baseline traffic values are steady, conversion outcomes show unexpected volatility. This analysis pipeline was engineered to answer three core business requirements:
1. Isolate the exact micro-conversion funnel step causing user drop-off.
2. Determine if performance variations are isolated to specific hardware dimensions (Mobile vs. Desktop).
3. Identify whether marketing acquisition channels correlate with final check-out conversion velocity.

## Tech Stack & Advanced SQL Concepts Applied
* **SQL Dialect:** SQLite / DuckDB compatible
* **Common Table Expressions (CTEs):** Used to abstract and flatten complex multi-row event logs into clean, session-level profiles.
* **Conditional Aggregation (`COUNT(DISTINCT CASE WHEN)`):** Applied to isolate unique user actions across progressive operational milestones.
* **Explicit Type Overriding (`CAST AS REAL`):** Enforced to protect fractional decimal value precision during division calculations.
* **Time-Velocity Functions (`JULIANDAY`):** Implemented to transform absolute timestamps into relative duration intervals (minutes spent per user segment).

## Strategic Product Insights Uncovered
* **The Device Gap:** The volume query exposed that while **Desktop** users converted from configurator interaction to shopping cart insertion at a high rate, **Mobile** users hit a massive drop-off bottleneck at that exact same step. 
* **The Interface Friction:** The time-velocity query verified that mobile sessions took significantly longer to progress between launching the customizer and completing a cart addition, indicating a responsive UI render lag or layout bug rather than lack of consumer intent.
