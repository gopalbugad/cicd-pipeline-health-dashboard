-------------------------------------------------------------------

# CI/CD Pipeline Health Dashboard 🚀

-------------------------------------------------------------------

## 📌 Overview

The **CI/CD Pipeline Health Dashboard** provides real-time visibility
into build success rates, failure rates, average build times, and
notifications.\
It integrates with GitHub Actions, Slack, and AWS for monitoring and
alerting, helping engineering teams ensure smooth CI/CD workflows.

------------------------------------------------------------------------

## ⚙️ Setup & Run Instructions

### 1. Clone the Repository

``` bash
git clone https://github.com/your-repo/pipeline-health-dashboard.git
cd pipeline-health-dashboard
```

### 2. Backend Setup (Node.js + PostgreSQL)

``` bash
cd backend
npm install
npm start
```

Update your `.env` file with:

    DB_HOST=localhost
    DB_PORT=5432
    DB_USER=your_user
    DB_PASSWORD=your_password
    DB_NAME=ci_cd_dashboard
    SLACK_WEBHOOK_URL=your_slack_webhook

### 3. Frontend Setup (React.js)

``` bash
cd frontend
npm install
npm run dev
```

### 4. Containerization (Docker)

``` bash
docker-compose up --build
```

### 5. Deployment on AWS EC2

-   Build Docker images
-   Push to Docker Hub
-   Run containers on EC2 instance with required `.env`

## Troubleshooting
- If no runs appear, check:
  - The repo has Actions runs and your token has `actions:read`.
  - The `GITHUB_OWNER`, `GITHUB_REPO`, and `GITHUB_TOKEN` are correct.
  - Backend container logs: `docker logs pipeline-backend`
- Slack alerts not working?
  - Ensure `SLACK_WEBHOOK_URL` is set and reachable from your machine.

------------------------------------------------------------------------

## 🏗️ Architecture Summary

-   **Frontend:** React.js application for UI dashboard.
-   **Backend:** Node.js Express server with APIs.
-   **Database:** PostgreSQL to store build logs and metrics.
-   **CI/CD Tool:** GitHub Actions for automation.
-   **Alerting:** Slack Webhooks for real-time notifications.
-   **Deployment:** Docker & docker-compose, hosted on AWS EC2.

**High-level flow:** 

1. GitHub Actions pipeline events → stored in PostgreSQL.
2. Backend API fetches & exposes metrics.
3. Frontend queries backend and displays metrics.
4. Slack alerts triggered on failures.

------------------------------------------------------------------------

## 🤖 How AI Tools Were Used

AI tools were applied to streamline technical development tasks, including:

- **Generating configuration files**: Dockerfiles, docker-compose.yml, and CI/CD pipeline scripts.
- **Defining API specifications**: Routes, request/response formats, and integration points.
- **Database modeling**: Drafting PostgreSQL schema structures for builds, logs, and alerts.
- **Infrastructure setup**: Commands for containerization, deployment on AWS EC2, and Slack webhook integration.
- **Documentation in Markdown**: Automated creation of Requirement Analysis, Tech Design Document, and README.md.

**Prompt Examples:**  
- “Create a Node.js Express API structure with sample routes and responses for a CI/CD dashboard.”  
- “Generate a PostgreSQL schema for storing pipeline build results and failure logs.”  
- “Write a docker-compose file to run frontend, backend, and database containers together.”  

------------------------------------------------------------------------

## 📚 Key Learning & Assumptions

-   GitHub Actions logs and build details can be exposed via APIs to
    fetch metrics.
-   Docker simplifies local and cloud deployment with consistent
    environments.
-   Slack Webhooks provide lightweight, real-time alerting.
-   PostgreSQL is assumed as the DB, but could be swapped with any
    SQL-based DB.
-   AWS EC2 was chosen for deployment, though this architecture could be
    extended to Kubernetes for scalability.

------------------------------------------------------------------------

✅ This README ensures new developers can set up, run, and understand the project along with its design principles.
