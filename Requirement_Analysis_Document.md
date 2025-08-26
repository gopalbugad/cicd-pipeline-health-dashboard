---------------------------------------------------------------------------

# Requirement Analysis Document

---------------------------------------------------------------------------

## 1. Key Features

**Pipeline Health Monitoring**

-   Success/Failure rate visualization.
-   Average build time tracking.
-   Last build status (live updates).

**Historical Insights**

-   Tabular view of recent GitHub Actions runs.
    -   Details: run number, name, event, status, conclusion, duration, actor, and run link.

**Real-Time Updates**

-   Auto-refresh dashboard via Server-Sent Events (SSE).

**Manual Refresh**

-   One-click "Refresh" button to reload metrics and runs.

**Failure Alerts**

-   Slack notifications on pipeline failure.

------------------------------------------------------------------------

## 2. Tech Choices

**Frontend**

-   React.js (SPA with hooks for state management).
-   CSS-in-JS (inline styles) with a centralized color theme.

**Dynamic Data** 
-   REST API (`/api/metrics`, `/api/runs`) → initial load. 
-   SSE (`/sse`) → live updates.

**Backend**

-   Node.js + Express.js REST API.
-   PostgreSQL DB (`pipeline_runs` table).
-   GitHub Actions API integration.
-   Slack Webhook alerts.
-   Server-Sent Events for real-time updates.
-   Logging with pino.

**AWS**

-   EC2 for Application Deployment.

------------------------------------------------------------------------

## 3. APIs / Tools Required

**GitHub Actions API (REST/GraphQL)**

-   To fetch pipeline runs, job statuses, and logs.

**Required Endpoints:**

-   GET /repos/{owner}/{repo}/actions/runs (List recent runs).

-   GET /repos/{owner}/{repo}/actions/runs/{run_id}/jobs (Job details).

-   GET /repos/{owner}/{repo}/actions/runs/{run_id}/logs (Access logs).

**Slack Incoming Webhooks API**

-   To send pipeline alerts/notifications directly to Slack channels.