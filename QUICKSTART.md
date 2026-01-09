# ⚡ Quick Start Guide

Get the Dynatrace Problems Dashboard up and running in 5 minutes!

## 🚀 Automated Installation (Windows)

### Option 1: One-Click Install & Start

```powershell
# Run the installation script
.\install.ps1

# Start both servers
.\start.ps1
```

This will:
1. Install all backend dependencies
2. Install all frontend dependencies
3. Start both servers in separate windows

### Option 2: Manual Installation

```bash
# Install Backend
cd backend
npm install

# Install Frontend (new terminal)
cd frontend
npm install
```

## 🎯 Start the Application

### Automated Start (Windows)
```powershell
.\start.ps1
```

### Manual Start
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm run dev
```

## 🌐 Access the Application

1. **Open your browser:** `http://localhost:5173`
2. **Login with demo credentials:**
   - Username: `czegarra`
   - Password: `czegarra`
3. **Explore the dashboard!**

## 📊 What You'll See

### Dashboard Page
- 8 KPI cards with real-time metrics
- Time series chart showing problems over time
- Heatmap of impact vs severity
- Pie chart of duration distribution

### Analytics Page
- Top 10 affected entities (bar chart)
- Management zones treemap
- Remediation funnel
- Resolution rate gauge

### Problems Page
- Paginated table of all problems
- Sortable columns
- Status badges
- Navigation controls

## 🔧 Troubleshooting

### Backend won't start
```bash
# Check if port 3000 is available
netstat -ano | findstr :3000

# If occupied, change port in backend/.env.example
PORT=3001
```

### Frontend won't start
```bash
# Clear cache and reinstall
cd frontend
rm -rf node_modules .vite
npm install
npm run dev
```

### MongoDB connection error
- Ensure you have internet connection
- The MongoDB Atlas connection is pre-configured
- Check backend console for detailed error messages

### Dependencies installation fails
```bash
# Clear npm cache
npm cache clean --force

# Delete lock files
rm package-lock.json

# Reinstall
npm install
```

## 📝 Environment Variables

### Backend (.env.example)
Already configured with:
- MongoDB Atlas connection
- JWT secret
- CORS settings
- Port configuration

**No changes needed for development!**

### Frontend (.env.example)
```env
VITE_API_URL=/api/v1
```

**No changes needed for development!**

## ✅ Verification Checklist

After starting the application, verify:

- [ ] Backend running on `http://localhost:3000`
- [ ] Frontend running on `http://localhost:5173`
- [ ] Can access login page
- [ ] Can login with demo credentials
- [ ] Dashboard loads with KPIs
- [ ] Charts are rendering correctly
- [ ] Problems table shows data
- [ ] No errors in browser console (F12)
- [ ] No errors in backend terminal

## 🎨 Features to Explore

1. **Dashboard Overview**
   - View all KPI metrics
   - Interact with time series chart (zoom, pan)
   - Hover over heatmap cells
   - Click on pie chart segments

2. **Analytics**
   - See top affected entities
   - Explore management zones
   - Review remediation pipeline
   - Check resolution rate

3. **Problems Table**
   - Browse all problems
   - Use pagination controls
   - Sort by different columns
   - View problem details

## 🔄 Development Workflow

### Making Changes

**Backend:**
```bash
cd backend
# Edit files in src/
# Server auto-restarts on changes
```

**Frontend:**
```bash
cd frontend
# Edit files in src/
# Browser auto-refreshes on changes
```

### Building for Production

**Backend:**
```bash
cd backend
npm run build
npm start
```

**Frontend:**
```bash
cd frontend
npm run build
# Output in dist/ folder
```

## 📚 Next Steps

1. **Explore the Code**
   - Check `backend/src/` for API implementation
   - Check `frontend/src/` for UI components
   - Review type definitions in `types/` folders

2. **Read Documentation**
   - `README.md` - Main documentation
   - `backend/README.md` - Backend API docs
   - `frontend/README.md` - Frontend guide
   - `INSTALL.md` - Detailed installation
   - `PROJECT_SUMMARY.md` - Complete overview

3. **Customize**
   - Modify color schemes in `tailwind.config.js`
   - Add new charts in `frontend/src/components/charts/`
   - Create new API endpoints in `backend/src/routes/`

## 🆘 Need Help?

1. **Check the logs:**
   - Backend: Terminal running `npm run dev`
   - Frontend: Browser console (F12)

2. **Common Issues:**
   - Port conflicts → Change ports in .env
   - Module not found → Run `npm install`
   - TypeScript errors → Run `npm run build`

3. **Resources:**
   - [React Documentation](https://react.dev)
   - [Express.js Guide](https://expressjs.com)
   - [Apache ECharts Examples](https://echarts.apache.org/examples)
   - [Tailwind CSS Docs](https://tailwindcss.com)

## 🎉 Success!

If you can see the dashboard with data, you're all set! 

**Happy coding! 🚀**

---

**Demo Credentials Reminder:**
- Username: `czegarra`
- Password: `czegarra`

**URLs:**
- Frontend: `http://localhost:5173`
- Backend API: `http://localhost:3000/api/v1`
- Health Check: `http://localhost:3000/api/v1/health`
