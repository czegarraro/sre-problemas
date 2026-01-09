# 🚀 Deployment Guide

Complete guide for deploying the Dynatrace Problems Dashboard to production.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Environment Setup](#environment-setup)
- [Backend Deployment](#backend-deployment)
- [Frontend Deployment](#frontend-deployment)
- [Database Configuration](#database-configuration)
- [Security Checklist](#security-checklist)
- [Monitoring](#monitoring)

---

## 🔧 Prerequisites

### Required
- Node.js 18+ LTS
- MongoDB Atlas account (already configured)
- Domain name (optional)
- SSL certificate (recommended)

### Recommended Hosting Providers

**Backend:**
- Heroku
- Railway
- Render
- DigitalOcean App Platform
- AWS Elastic Beanstalk
- Google Cloud Run

**Frontend:**
- Vercel (recommended)
- Netlify
- Cloudflare Pages
- AWS S3 + CloudFront
- GitHub Pages

---

## 🌍 Environment Setup

### Backend Environment Variables

Create a `.env` file in the backend directory:

```env
# Production Configuration
NODE_ENV=production
PORT=3000

# MongoDB (Already configured)
MONGODB_URI=mongodb+srv://raguerreromauriola_db_user:fOWhYmM9ey4PwSRs@scraping.0robens.mongodb.net/problemas-dynatrace-uno?retryWrites=true&w=majority
MONGODB_DB_NAME=problemas-dynatrace-uno
MONGODB_COLLECTION_NAME=problems

# JWT Configuration (CHANGE THIS!)
JWT_SECRET=CHANGE_THIS_TO_A_SECURE_RANDOM_STRING_MIN_32_CHARS
JWT_EXPIRES_IN=30m

# CORS (Update with your frontend URL)
CORS_ORIGIN=https://your-frontend-domain.com

# Rate Limiting
RATE_LIMIT_WINDOW_MS=60000
RATE_LIMIT_MAX_REQUESTS=100
```

**⚠️ IMPORTANT:** Change `JWT_SECRET` to a secure random string!

Generate a secure secret:
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

### Frontend Environment Variables

Create a `.env.production` file in the frontend directory:

```env
# Production API URL
VITE_API_URL=https://your-backend-domain.com/api/v1
```

---

## 🖥️ Backend Deployment

### Option 1: Heroku

1. **Install Heroku CLI**
   ```bash
   npm install -g heroku
   ```

2. **Login to Heroku**
   ```bash
   heroku login
   ```

3. **Create Heroku App**
   ```bash
   cd backend
   heroku create your-app-name
   ```

4. **Set Environment Variables**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set MONGODB_URI="your-mongodb-uri"
   heroku config:set JWT_SECRET="your-secure-secret"
   heroku config:set CORS_ORIGIN="https://your-frontend.com"
   ```

5. **Deploy**
   ```bash
   git push heroku main
   ```

6. **Verify**
   ```bash
   heroku logs --tail
   heroku open
   ```

### Option 2: Railway

1. **Install Railway CLI**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login and Initialize**
   ```bash
   railway login
   cd backend
   railway init
   ```

3. **Set Environment Variables**
   - Go to Railway dashboard
   - Add all environment variables
   - Or use CLI: `railway variables set KEY=VALUE`

4. **Deploy**
   ```bash
   railway up
   ```

### Option 3: DigitalOcean App Platform

1. **Connect Repository**
   - Go to DigitalOcean App Platform
   - Create new app
   - Connect GitHub repository

2. **Configure Build**
   - Build Command: `npm run build`
   - Run Command: `npm start`
   - Environment: Node.js 18

3. **Set Environment Variables**
   - Add all variables in the dashboard

4. **Deploy**
   - Click "Deploy"

### Build for Production

```bash
cd backend
npm run build
npm start
```

---

## 🎨 Frontend Deployment

### Option 1: Vercel (Recommended)

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Deploy**
   ```bash
   cd frontend
   vercel
   ```

3. **Set Environment Variables**
   ```bash
   vercel env add VITE_API_URL production
   ```

4. **Production Deployment**
   ```bash
   vercel --prod
   ```

### Option 2: Netlify

1. **Install Netlify CLI**
   ```bash
   npm install -g netlify-cli
   ```

2. **Build**
   ```bash
   cd frontend
   npm run build
   ```

3. **Deploy**
   ```bash
   netlify deploy --prod --dir=dist
   ```

4. **Configure**
   - Set environment variables in Netlify dashboard
   - Add `_redirects` file for SPA routing:
     ```
     /*    /index.html   200
     ```

### Option 3: AWS S3 + CloudFront

1. **Build**
   ```bash
   cd frontend
   npm run build
   ```

2. **Create S3 Bucket**
   ```bash
   aws s3 mb s3://your-bucket-name
   ```

3. **Upload Files**
   ```bash
   aws s3 sync dist/ s3://your-bucket-name
   ```

4. **Configure CloudFront**
   - Create CloudFront distribution
   - Point to S3 bucket
   - Add SSL certificate
   - Configure custom domain

### Build for Production

```bash
cd frontend
npm run build
# Output in dist/ folder
```

---

## 🗄️ Database Configuration

### MongoDB Atlas (Already Configured)

The database is already set up and contains data. No additional configuration needed.

**Connection Details:**
- Database: `problemas-dynatrace-uno`
- Collection: `problems`
- Connection string is in `.env.example`

### Backup Strategy

1. **Automated Backups**
   - MongoDB Atlas provides automatic backups
   - Configure backup schedule in Atlas dashboard

2. **Manual Backup**
   ```bash
   mongodump --uri="your-mongodb-uri" --out=backup/
   ```

3. **Restore**
   ```bash
   mongorestore --uri="your-mongodb-uri" backup/
   ```

---

## 🔒 Security Checklist

### Before Deployment

- [ ] Change `JWT_SECRET` to a secure random string
- [ ] Update `CORS_ORIGIN` to production domain
- [ ] Enable HTTPS/SSL
- [ ] Set `NODE_ENV=production`
- [ ] Remove console.logs from production code
- [ ] Enable rate limiting
- [ ] Configure security headers
- [ ] Set up firewall rules
- [ ] Enable database authentication
- [ ] Use environment variables for secrets
- [ ] Implement request validation
- [ ] Set up error tracking
- [ ] Configure logging
- [ ] Enable monitoring

### Security Headers (Already Configured)

The backend uses Helmet.js with the following headers:
- Content-Security-Policy
- X-Frame-Options
- X-Content-Type-Options
- Strict-Transport-Security
- X-XSS-Protection

### Rate Limiting (Already Configured)

- 100 requests per minute per IP
- Configurable via environment variables

---

## 📊 Monitoring

### Backend Monitoring

**Recommended Tools:**
- **Sentry** - Error tracking
- **New Relic** - Performance monitoring
- **DataDog** - Infrastructure monitoring
- **LogRocket** - Session replay

**Setup Sentry:**
```bash
npm install @sentry/node
```

```typescript
// backend/src/app.ts
import * as Sentry from '@sentry/node';

Sentry.init({
  dsn: process.env.SENTRY_DSN,
  environment: process.env.NODE_ENV,
});
```

### Frontend Monitoring

**Recommended Tools:**
- **Sentry** - Error tracking
- **Google Analytics** - Usage analytics
- **Hotjar** - User behavior
- **LogRocket** - Session replay

**Setup Sentry:**
```bash
npm install @sentry/react
```

```typescript
// frontend/src/main.tsx
import * as Sentry from '@sentry/react';

Sentry.init({
  dsn: process.env.VITE_SENTRY_DSN,
  environment: import.meta.env.MODE,
});
```

### Health Checks

**Backend Health Endpoint:**
```
GET /api/v1/health
```

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2025-10-26T...",
  "uptime": 12345
}
```

### Logging

**Backend Logging:**
- Morgan for HTTP request logging
- Winston for application logging (optional)
- CloudWatch for AWS deployments

**Log Levels:**
- `error` - Error messages
- `warn` - Warning messages
- `info` - Informational messages
- `debug` - Debug messages (dev only)

---

## 🔄 CI/CD Pipeline

### GitHub Actions Example

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - name: Install dependencies
        run: cd backend && npm ci
      - name: Build
        run: cd backend && npm run build
      - name: Deploy to Heroku
        uses: akhileshns/heroku-deploy@v3.12.12
        with:
          heroku_api_key: ${{secrets.HEROKU_API_KEY}}
          heroku_app_name: "your-app-name"
          heroku_email: "your-email@example.com"

  deploy-frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - name: Install dependencies
        run: cd frontend && npm ci
      - name: Build
        run: cd frontend && npm run build
        env:
          VITE_API_URL: ${{secrets.API_URL}}
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{secrets.VERCEL_TOKEN}}
          vercel-org-id: ${{secrets.ORG_ID}}
          vercel-project-id: ${{secrets.PROJECT_ID}}
```

---

## 🧪 Testing in Production

### Smoke Tests

1. **Backend Health Check**
   ```bash
   curl https://your-backend.com/api/v1/health
   ```

2. **Authentication**
   ```bash
   curl -X POST https://your-backend.com/api/v1/auth/login \
     -H "Content-Type: application/json" \
     -d '{"username":"czegarra","password":"czegarra"}'
   ```

3. **Frontend Access**
   - Open `https://your-frontend.com`
   - Verify login page loads
   - Test login functionality
   - Check dashboard loads
   - Verify charts render

### Load Testing

**Using Artillery:**
```bash
npm install -g artillery
artillery quick --count 100 --num 10 https://your-backend.com/api/v1/health
```

---

## 📈 Performance Optimization

### Backend
- Enable compression
- Use CDN for static assets
- Implement caching (Redis)
- Optimize database queries
- Use connection pooling

### Frontend
- Enable code splitting
- Lazy load routes
- Optimize images
- Use CDN
- Enable gzip compression
- Implement service workers

---

## 🆘 Troubleshooting

### Common Issues

**Backend won't start:**
- Check environment variables
- Verify MongoDB connection
- Check port availability
- Review logs

**Frontend can't connect to API:**
- Verify CORS settings
- Check API URL in .env
- Verify SSL certificates
- Check network requests in DevTools

**Database connection errors:**
- Verify MongoDB URI
- Check IP whitelist in Atlas
- Verify credentials
- Check network connectivity

---

## 📞 Support

For deployment issues:
1. Check logs first
2. Review environment variables
3. Verify network connectivity
4. Check hosting provider status
5. Review documentation

---

## ✅ Post-Deployment Checklist

- [ ] Backend is accessible
- [ ] Frontend is accessible
- [ ] Login works
- [ ] Dashboard loads with data
- [ ] Charts render correctly
- [ ] API responses are fast (< 500ms)
- [ ] SSL certificate is valid
- [ ] Monitoring is set up
- [ ] Error tracking is configured
- [ ] Backups are scheduled
- [ ] Documentation is updated
- [ ] Team is notified

---

**Deployment Complete! 🎉**

Your Dynatrace Problems Dashboard is now live in production!
