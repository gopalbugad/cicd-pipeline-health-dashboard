------------------------------------------------------

# Tech Design Document

------------------------------------------------------

## 1. High-Level Architecture

The CI/CD Pipeline Health Dashboard consists of three main layers:

- **Frontend (React.js SPA)**
  - Renders metrics, historical runs, and real-time updates.
  - Fetches data via REST APIs and SSE streams.
  - Provides interactive UI with auto-refresh and manual refresh options.

- **Backend (Node.js + Express.js)**
  - Exposes REST APIs (`/api/metrics`, `/api/runs`, `/api/health`).
  - Maintains persistent connection for Server-Sent Events (`/sse`).
  - Integrates with GitHub Actions API to fetch pipeline runs.
  - Sends alerts via Slack webhook.
  - Stores historical run data in PostgreSQL.

- **Database (PostgreSQL)**
  - Stores pipeline run details (`pipeline_runs` table).
  - Enables querying for metrics and historical trends.

- **External Integrations**
  - **GitHub Actions API**: Provides workflow run data.
  - **Slack API**: Sends alerts when pipelines fail.

---

## 2. API Structure

### Backend REST APIs

#### GET `/api/metrics`
Returns aggregated pipeline health metrics.

**Sample Response:**
```json
{
  "success_rate": 85,
  "failure_rate": 15,
  "avg_build_time": 6.2,
  "last_status": "success"
}
```

#### GET `/api/runs`
Returns a list of recent workflow runs.

**Sample Response:**
```json
[
  {
    "run_number": 120,
    "name": "Build & Test",
    "event": "push",
    "status": "completed",
    "conclusion": "success",
    "duration": 350,
    "actor": "johndoe",
    "html_url": "https://github.com/org/repo/actions/runs/120"
  }
]
```

#### GET `/api/health`
Health check endpoint to confirm backend availability.

**Sample Response:**
```json
{ "status": "ok" }
```

#### GET `/sse`
Streams live metrics to frontend.

**Sample Event Payload:**
```json
{
  "success_rate": 90,
  "failure_rate": 10,
  "avg_build_time": 5.9,
  "last_status": "failure"
}
```

---

## 3. Database Schema

**Table: `pipeline_runs`**

| Column      | Type       | Description                          |
|-------------|-----------|--------------------------------------|
| id          | SERIAL PK | Auto-increment ID                   |
| run_number  | INT       | GitHub workflow run number           |
| run_id      | TEXT UNIQUE | Unique workflow run ID             |
| name        | TEXT      | Workflow name                        |
| event       | TEXT      | Trigger event (push/PR)              |
| status      | TEXT      | Workflow status                      |
| conclusion  | TEXT      | Workflow result (success/failure)    |
| duration    | INT       | Run duration (ms)                    |
| actor       | TEXT      | User triggering the run              |
| html_url    | TEXT      | GitHub run link                      |

---

## 4. UI Layout

- **Header Section**
  - Title: *“🚀 CI/CD Pipeline Health Dashboard”*
  - Manual refresh button (🔄).

- **Metrics Section (Top Cards)**
  - Success Rate (%).
  - Failure Rate (%).
  - Avg Build Time (minutes).
  - Last Build Status (color-coded: green/red/yellow).

- **Historical Runs Table**
  - Columns: Run #, Workflow Name, Event, Status, Conclusion, Duration, Actor, Link.
  - Sorted by most recent run.

- **Real-Time Updates**
  - Metrics auto-update via `/sse`.
  - Table refreshes manually or periodically.

---

This document provides the high-level technical design of the CI/CD Pipeline Health Dashboard, covering architecture, APIs, database schema, and UI layout.
