# TLIAS — Teaching & Learning Information Administration System

A full-stack educational management platform built with Spring Boot 3 and Vue 3, featuring AI-powered natural language queries, role-based authentication, data analytics, and a fully automated CI/CD pipeline.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Run with Docker Compose](#run-with-docker-compose)
  - [Run Locally (Development)](#run-locally-development)
- [API Overview](#api-overview)
- [CI/CD Pipeline](#cicd-pipeline)
- [Environment Variables](#environment-variables)

---

## Features

| Module | Description |
|--------|-------------|
| **Employee Management** | Full CRUD with department assignment, salary, and job tracking |
| **Student Management** | Enrollment records, class assignment, violation tracking |
| **Class Management** | Course scheduling, room allocation, teacher assignment |
| **Department Management** | Organizational structure maintenance |
| **Analytics & Reporting** | ECharts-powered dashboards — employee job/gender distribution, student degree & enrollment stats |
| **AI Chat (NL→SQL)** | Natural language questions automatically converted to SQL, executed, and summarized |
| **File Upload** | Employee and student avatars stored on Aliyun OSS |
| **Operation Logs** | Audit trail for all write operations via Spring AOP |
| **JWT Authentication** | Stateless token-based auth with automatic token refresh on the frontend |

---

## Tech Stack

| Layer | Technology | Version |
|-------|-----------|---------|
| Backend Framework | Spring Boot | 3.2.10 |
| Language | Java | 17 |
| ORM | MyBatis | 3.0.3 |
| Database | MySQL | 8.0 |
| Pagination | PageHelper | 1.4.7 |
| Authentication | JWT (jjwt) | 0.9.1 |
| File Storage | Aliyun OSS SDK | 3.17.4 |
| Frontend Framework | Vue | 3.2.38 |
| Build Tool | Vite | 3.0.9 |
| UI Library | Element Plus | 2.4.4 |
| Charts | ECharts | 5.5.1 |
| HTTP Client | Axios | 1.7.2 |
| State Management | Pinia | 2.0.21 |
| Router | Vue Router | 4.1.5 |
| Web Server | Nginx | 1.20.2 |
| Containerization | Docker + Docker Compose | — |
| CI/CD | GitHub Actions | — |
| AI Model | Qwen Plus (Alibaba Cloud) | — |

---

## Architecture

```
┌────────────────────────────────────────────────────┐
│                   GitHub Actions                   │
│  Push → Build Backend → Build Frontend             │
│       → Push Docker Images → Deploy via SSH        │
└────────────────────────┬───────────────────────────┘
                         │
                         ▼
┌────────────────────────────────────────────────────┐
│              Production Server (Docker Compose)    │
│                                                    │
│  ┌──────────┐   /api/*   ┌────────────────────┐   │
│  │  Nginx   │ ─────────► │  Spring Boot :8080  │   │
│  │  :80     │            └────────┬───────────┘   │
│  │  Vue SPA │                     │               │
│  └──────────┘            ┌────────▼───────────┐   │
│                           │   MySQL 8 :3306    │   │
│                           └────────────────────┘   │
└────────────────────────────────────────────────────┘
```

Nginx serves the Vue SPA and reverse-proxies all `/api/*` requests to the Spring Boot backend (stripping the `/api` prefix). Services communicate over an internal Docker bridge network (`tlias-net`).

---

## Project Structure

```
tlias/
├── tlias-web-management/          # Spring Boot backend
│   ├── src/main/java/com/itheima/
│   │   ├── controller/            # REST controllers (9)
│   │   ├── service/               # Business logic interfaces & implementations
│   │   ├── mapper/                # MyBatis mappers
│   │   ├── pojo/                  # Domain models & DTOs
│   │   ├── config/                # Configuration beans (JWT, OSS, OpenAI)
│   │   ├── aop/                   # Operation log aspect
│   │   ├── filter/                # JWT authentication filter
│   │   └── exception/             # Global exception handler
│   ├── src/main/resources/
│   │   ├── application.yml
│   │   └── ai/schema.sql          # Table schema fed to AI context
│   └── Dockerfile
├── vue-tlias-management/          # Vue 3 frontend
│   ├── src/
│   │   ├── api/                   # Axios API modules (8)
│   │   ├── views/                 # Page components (11)
│   │   ├── router/                # Route definitions
│   │   ├── stores/                # Pinia stores
│   │   └── utils/request.js       # Axios interceptors
│   ├── nginx.conf
│   └── Dockerfile
├── db/init/tlias.sql              # MySQL initialization script
├── docker-compose.yml
└── .github/workflows/ci.yml       # CI/CD pipeline
```

---

## Getting Started

### Prerequisites

- Docker ≥ 24 and Docker Compose ≥ 2.x
- (For local dev) Java 17, Maven 3.8+, Node.js 22, npm

### Run with Docker Compose

1. **Clone the repository**

   ```bash
   git clone https://github.com/Watermelon118/tlias.git
   cd tlias
   ```

2. **Set required environment variables**

   ```bash
   export OSS_ACCESS_KEY_ID=<your-aliyun-access-key-id>
   export OSS_ACCESS_KEY_SECRET=<your-aliyun-access-key-secret>
   ```

3. **Start all services**

   ```bash
   docker compose up -d
   ```

   On first startup, MySQL is automatically initialized from `db/init/tlias.sql`.

4. **Access the application**

   | Service | URL |
   |---------|-----|
   | Frontend (Vue) | http://localhost |
   | Backend API | http://localhost:8080 |

---

### Run Locally (Development)

#### Backend

```bash
cd tlias-web-management
mvn spring-boot:run
```

The backend starts on port **8080**. Update `application.yml` if your local MySQL credentials differ from the defaults (`root` / `123456`).

#### Frontend

```bash
cd vue-tlias-management
npm install
npm run dev
```

The dev server starts on port **5173** and proxies API calls to `http://localhost:8080`.

---

## API Overview

All endpoints are prefixed with `/api` when accessed through Nginx.

| Controller | Base Path | Key Operations |
|-----------|-----------|----------------|
| LoginController | `/login` | `POST /login` — authenticate and receive JWT |
| DeptController | `/depts` | CRUD for departments |
| EmpController | `/emps` | CRUD for employees, paginated list |
| ClazzController | `/clazzs` | CRUD for classes |
| StudentController | `/students` | CRUD for students, paginated list |
| ReportController | `/report` | Employee job/gender data, student degree/count data |
| UploadController | `/upload` | `POST /upload` — upload file to Aliyun OSS |
| AiController | `/ai` | `POST /ai/chat` — natural language query |

### AI Chat Endpoint

```http
POST /api/ai/chat
Content-Type: application/json
Authorization: Bearer <token>

{
  "message": "各部门的平均薪资是多少？"
}
```

The AI layer converts the question into a validated `SELECT` query against the schema, executes it, and returns a human-readable summary. Mutating SQL (`INSERT`, `UPDATE`, `DELETE`, `DROP`, etc.) is blocked.

---

## CI/CD Pipeline

Triggered on every push to `main`, the pipeline runs four sequential jobs:

```
Push to main
  │
  ├─► [build-backend]   JDK 17 → mvn clean package → upload JAR artifact
  ├─► [build-frontend]  Node 22 → npm install → npm run build → upload dist artifact
  │
  └─► [docker-push]  (requires both above)
        Download artifacts → docker build → push to Docker Hub
          deto2y14/tlias-server:latest
          deto2y14/tlias-nginx:latest
        │
        └─► [deploy]  SSH into production server
              git pull → docker compose pull → docker compose up -d → prune old images
```

### Required GitHub Secrets

| Secret | Description |
|--------|-------------|
| `DOCKERHUB_USERNAME` | Docker Hub username |
| `DOCKERHUB_TOKEN` | Docker Hub access token |
| `SERVER_HOST` | Production server IP / hostname |
| `SERVER_USER` | SSH login username |
| `SERVER_PASSWORD` | SSH login password |
| `OSS_ACCESS_KEY_ID` | Aliyun OSS access key |
| `OSS_ACCESS_KEY_SECRET` | Aliyun OSS secret key |

---

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `OSS_ACCESS_KEY_ID` | Yes | Aliyun OSS credential |
| `OSS_ACCESS_KEY_SECRET` | Yes | Aliyun OSS credential |

All other configuration (DB host, AI base URL, model name) is managed in `tlias-web-management/src/main/resources/application.yml`.
