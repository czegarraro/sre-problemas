# 📦 Installation Guide

## Step-by-Step Installation

### 1. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Install dependencies
npm install

# Copy environment file (already configured)
# The .env.example contains all necessary configuration
# No changes needed for development

# Start the backend server
npm run dev
```

The backend will start on `http://localhost:3000`

**Verify backend is running:**
- Open `http://localhost:3000/api/v1/health` in your browser
- You should see a JSON response with status "ok"

### 2. Frontend Setup

Open a **new terminal** and run:

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start the frontend development server
npm run dev
```

The frontend will start on `http://localhost:5173`

### 3. Access the Application

1. Open your browser and go to `http://localhost:5173`
2. You'll be redirected to the login page
3. Use the demo credentials:
   - **Username:** `czegarra`
   - **Password:** `czegarra`
4. Click "Sign In"
5. You'll be redirected to the Dashboard

## 🔧 Troubleshooting

### Backend Issues

**Port 3000 already in use:**
```bash
# Change PORT in backend/.env.example
PORT=3001
```

**MongoDB connection error:**
- The MongoDB Atlas connection string is pre-configured
- Ensure you have internet connection
- The database already contains data

**Dependencies installation fails:**
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and package-lock.json
rm -rf node_modules package-lock.json

# Reinstall
npm install
```

### Frontend Issues

**Port 5173 already in use:**
- Vite will automatically use the next available port
- Check the terminal output for the actual port

**API connection error:**
- Ensure backend is running on port 3000
- Check browser console for errors
- Verify CORS settings in backend

**Build errors:**
```bash
# Clear Vite cache
rm -rf node_modules/.vite

# Reinstall dependencies
npm install
```

## 🚀 Quick Start (All at Once)

From the root directory:

```bash
# Install root dependencies (for concurrent running)
npm install

# Install all dependencies
npm run install:all

# Start both backend and frontend
npm run dev
```

This will start both servers concurrently.

## 📝 Environment Variables

### Backend (.env)

The backend uses `.env.example` which is already configured:

```env
PORT=3000
NODE_ENV=development
MONGODB_URI=mongodb+srv://raguerreromauriola_db_user:fOWhYmM9ey4PwSRs@scraping.0robens.mongodb.net/problemas-dynatrace-uno?retryWrites=true&w=majority
MONGODB_DB_NAME=problemas-dynatrace-uno
MONGODB_COLLECTION_NAME=problems
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRES_IN=30m
CORS_ORIGIN=http://localhost:5173
RATE_LIMIT_WINDOW_MS=60000
RATE_LIMIT_MAX_REQUESTS=100
```

**For production, change:**
- `JWT_SECRET` to a secure random string (min 32 characters)
- `NODE_ENV` to `production`
- `CORS_ORIGIN` to your production domain

### Frontend (.env)

The frontend uses `.env.example`:

```env
VITE_API_URL=/api/v1
```

No changes needed for development.

## ✅ Verification Checklist

- [ ] Backend running on port 3000
- [ ] Frontend running on port 5173
- [ ] Can access login page
- [ ] Can login with demo credentials
- [ ] Dashboard loads with KPIs
- [ ] Charts are rendering
- [ ] Problems table shows data
- [ ] No console errors

## 🎯 Next Steps

After successful installation:

1. Explore the Dashboard
2. Check the Problems page
3. Try filtering problems
4. View problem details
5. Add comments to problems

## 📞 Need Help?

If you encounter issues:

1. Check the terminal output for errors
2. Check browser console (F12)
3. Verify all dependencies are installed
4. Ensure MongoDB connection is working
5. Check that ports 3000 and 5173 are available

## 🔄 Updating

To update the application:

```bash
# Backend
cd backend
git pull
npm install
npm run dev

# Frontend
cd frontend
git pull
npm install
npm run dev
```

## 🏗️ Building for Production

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
# The 'dist' folder contains the production build
# Deploy to your hosting service
```
