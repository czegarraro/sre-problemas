@echo off
echo ========================================
echo   Dynatrace Problems Dashboard
echo   Starting Backend and Frontend
echo ========================================
echo.

REM Start Backend
echo [1/2] Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm run dev"
timeout /t 5 /nobreak > nul

REM Start Frontend
echo [2/2] Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm run dev"

echo.
echo ========================================
echo   Servers Starting...
echo ========================================
echo.
echo Backend:  http://localhost:3000
echo Frontend: http://localhost:5173
echo.
echo Press any key to close this window...
pause > nul
