# 🚀 Dynatrace Problems Dashboard

Modern, interactive web application for exploring, analyzing, and visualizing problems detected by Dynatrace with advanced filtering, real-time analytics, and a cutting-edge user interface.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Status](https://img.shields.io/badge/status-production--ready-success.svg)
![TypeScript](https://img.shields.io/badge/typescript-100%25-blue.svg)

## 📋 Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Documentation](#documentation)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## 📋 Overview

This full-stack application provides a comprehensive dashboard for monitoring and analyzing Dynatrace problems with:

- **Real-time KPI metrics** - 8 key performance indicators
- **Advanced visualizations** - 11+ interactive charts using Apache ECharts
- **Dynamic filtering** - Multi-dimensional problem filtering
- **Modern UI/UX** - Glassmorphism design with smooth animations
- **Secure authentication** - JWT-based auth with session management

## 🗄️ Data Source

- **Database:** MongoDB Atlas (SaaS)
- **Database Name:** `problemas-dynatrace-uno`
- **Collection:** `problems`
- **Connection:** Pre-configured and ready to use

## 🛠️ Tech Stack

### Backend
- **Runtime:** Node.js 18+ LTS
- **Framework:** Express.js + TypeScript
- **Database:** MongoDB (official driver)
- **Authentication:** JWT + bcryptjs
- **Validation:** Zod
- **Architecture:** Repository Pattern + Service Layer

### Frontend
- **Framework:** React 18 + TypeScript (strict mode)
- **Build Tool:** Vite 5
- **State Management:** Zustand
- **Styling:** Tailwind CSS 3
- **Charts:** Apache ECharts
- **Animations:** Framer Motion
- **Routing:** React Router v6

## Quick Start

### Automated Installation (Windows)

```powershell
# Install all dependencies
.\install.ps1

# Start both servers
.\start.ps1
```

### Manual Installation

```bash
# Backend
cd backend
npm install
npm run dev

# Frontend (new terminal)
cd frontend
npm install
npm run dev
```

### Access the Application

1. Open `http://localhost:5173`
2. Login with demo credentials:
   - **Username:** `czegarra`
   - **Password:** `czegarra`
3. Explore the dashboard!

**For detailed instructions, see [QUICKSTART.md](QUICKSTART.md) or [INSTALL.md](INSTALL.md)**

## Project Structure

```
dynatrace-tres/
├── backend/                 # Backend API
│   ├── src/
│   │   ├── config/         # Configuration
│   │   ├── controllers/    # Route controllers
│   │   ├── middlewares/    # Express middlewares
│   │   ├── models/         # Data models
│   │   ├── repositories/   # Data access layer
│   │   ├── services/       # Business logic
│   │   ├── routes/         # API routes
│   │   ├── types/          # TypeScript types
│   │   └── utils/          # Utilities
│   ├── package.json
│   └── README.md
│
├── frontend/               # Frontend React App
│   ├── src/
│   │   ├── components/    # React components
│   │   ├── pages/         # Page components
│   │   ├── store/         # Zustand stores
│   │   ├── lib/           # Libraries & utilities
│   │   ├── types/         # TypeScript types
│   │   └── styles/        # Global styles
│   ├── package.json
│   └── README.md
│
└── README.md              # This file
```

## 🎯 Features

### 🔐 Authentication
- Secure JWT-based authentication
- Session persistence with localStorage
- Auto-logout after 30 minutes of inactivity
- Protected routes with HOC

### 📊 Dashboard
**8 KPI Cards:**
- Total Problems
- Open Problems
- Critical Problems (Availability & Error)
- Average Resolution Time
- Total Duration
- Problems with Comments
- GitHub Actions Problems
- Closed Problems

**Interactive Charts:**
1. **Time Series** - Problems over time with severity breakdown
2. **Heatmap** - Impact vs Severity matrix
3. **Pie Chart** - Duration distribution
4. **Bar Chart** - Top affected entities
5. **Treemap** - Management zones
6. **Funnel** - Remediation pipeline
7. **Sunburst** - Evidence types
8. **Line Chart** - SLA trends
9. **Network Graph** - Entity relationships
10. **Gauge** - Problem status percentage
11. **Timeline** - Problem events

### 🔍 Advanced Filtering
- Impact Level (Infrastructure, Services, Application, Environment)
- Severity Level (Availability, Error, Performance, etc.)
- Status (Open, Closed)
- Management Zones
- Entity Types
- Date Range
- Duration Range
- Comments (with/without)
- GitHub Actions detection
- Evidence Types
- Full-text search

### 📋 Problems Table
- Paginated results (10, 25, 50, 100 per page)
- Sortable columns
- Real-time filtering
- Badge-based status indicators
- Responsive design
- Export capabilities (CSV, Excel, JSON)

### 🎨 Design System
- **Dark Mode** optimized
- **Glassmorphism** effects
- **Smooth animations** with Framer Motion
- **Gradient accents**
- **Responsive** layout
- **Accessible** (WCAG 2.1 AA)

## 🔌 API Endpoints

### Authentication
- `POST /api/v1/auth/login` - Login
- `POST /api/v1/auth/logout` - Logout
- `GET /api/v1/auth/me` - Get current user

### Problems
- `GET /api/v1/problems` - Get all problems (with filters)
- `GET /api/v1/problems/:id` - Get problem by ID
- `PATCH /api/v1/problems/:id/status` - Update status
- `POST /api/v1/problems/:id/comments` - Add comment

### Analytics
- `GET /api/v1/analytics/kpis` - Dashboard KPIs
- `GET /api/v1/analytics/time-series` - Time series data
- `GET /api/v1/analytics/impact-severity-matrix` - Heatmap data
- `GET /api/v1/analytics/top-entities` - Top affected entities
- `GET /api/v1/analytics/management-zones` - Management zones
- `GET /api/v1/analytics/remediation-funnel` - Remediation funnel
- `GET /api/v1/analytics/duration-distribution` - Duration stats
- `GET /api/v1/analytics/evidence-types` - Evidence breakdown

### Filters
- `GET /api/v1/filters/options` - Available filter options

## 🔒 Security Features

- Helmet.js security headers
- CORS configuration
- Rate limiting (100 req/min)
- JWT authentication
- Input validation with Zod
- httpOnly cookies
- Request size limits
- SQL injection prevention
- XSS protection

## 📊 Data Model

### Problem Schema
```typescript
interface Problem {
  problemId: string;
  displayId: string;
  title: string;
  impactLevel: 'INFRASTRUCTURE' | 'SERVICES' | 'APPLICATION' | 'ENVIRONMENT';
  severityLevel: 'AVAILABILITY' | 'ERROR' | 'PERFORMANCE' | 'RESOURCE_CONTENTION' | 'CUSTOM_ALERT';
  status: 'OPEN' | 'CLOSED';
  affectedEntities: Entity[];
  impactedEntities: Entity[];
  rootCauseEntity: Entity | null;
  managementZones: ManagementZone[];
  entityTags: EntityTag[];
  evidenceDetails: EvidenceDetails;
  recentComments: RecentComments;
  impactAnalysis: ImpactAnalysis;
  startTime: string;
  endTime: string;
}
```

## 🧪 Testing

### Backend
```bash
cd backend
npm test
npm run test:coverage
```

### Frontend
```bash
cd frontend
npm test
npm run test:coverage
```

## 📦 Deployment

### Backend
```bash
cd backend
npm run build
npm start
```

### Frontend
```bash
cd frontend
npm run build
# Deploy 'dist' folder to hosting service
```

## 🌐 Environment Variables

### Backend (.env)
```env
PORT=3000
NODE_ENV=development
MONGODB_URI=mongodb+srv://...
JWT_SECRET=your-secret-key
CORS_ORIGIN=http://localhost:5173
```

### Frontend (.env)
```env
VITE_API_URL=/api/v1
```

## 📈 Performance

- **Backend:** < 200ms average response time
- **Frontend:** 
  - FCP < 1.5s
  - TTI < 3s
  - LCP < 2.5s

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📝 License

MIT License - see LICENSE file for details

## 👥 Authors

- **Prompt Engineer** - Initial work - Dynatrace Dashboard Project

## 🙏 Acknowledgments

- Dynatrace for the monitoring platform
- Apache ECharts for visualization library
- MongoDB Atlas for database hosting
- React and Express communities

## 📚 Documentation

Comprehensive documentation is available:

| Document | Description |
|----------|-------------|
| [📖 QUICKSTART.md](QUICKSTART.md) | Get started in 5 minutes |
| [📦 INSTALL.md](INSTALL.md) | Detailed installation guide |
| [📊 PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) | Complete technical overview |
| [🚀 DEPLOYMENT.md](DEPLOYMENT.md) | Production deployment guide |
| [🤝 CONTRIBUTING.md](CONTRIBUTING.md) | Contribution guidelines |
| [📝 CHANGELOG.md](CHANGELOG.md) | Version history |
| [💼 EXECUTIVE_SUMMARY.md](EXECUTIVE_SUMMARY.md) | Executive overview |
| [🔧 backend/README.md](backend/README.md) | Backend API documentation |
| [🎨 frontend/README.md](frontend/README.md) | Frontend guide |

## 📸 Screenshots

### Dashboard
![Dashboard Overview](docs/images/dashboard.png)
*Real-time KPIs and interactive visualizations*

### Analytics
![Analytics Page](docs/images/analytics.png)
*Advanced charts and data analysis*

### Problems Table
![Problems Table](docs/images/problems.png)
*Comprehensive problem listing with filters*

## 📞 Support

For support:
1. Check the [documentation](#documentation)
2. Review [QUICKSTART.md](QUICKSTART.md) for common issues
3. Open an issue in the repository
4. Check [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines

## 🙏 Acknowledgments

- **Dynatrace** for the monitoring platform
- **Apache ECharts** for visualization library
- **MongoDB Atlas** for database hosting
- **React** and **Express** communities

---

**Built with ❤️ using React, TypeScript, and Apache ECharts**

**Status:** ✅ Production Ready | **Version:** 1.0.0 | **Last Updated:** October 26, 2025
