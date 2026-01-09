# PowerShell script to install all dependencies
Write-Host "📦 Installing Dynatrace Problems Dashboard Dependencies..." -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Node.js is not installed. Please install Node.js 18+ first." -ForegroundColor Red
    Write-Host "   Download from: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Node.js version: $(node --version)" -ForegroundColor Green
Write-Host "✅ npm version: $(npm --version)" -ForegroundColor Green
Write-Host ""

# Install Backend Dependencies
Write-Host "📦 Installing Backend Dependencies..." -ForegroundColor Yellow
Set-Location "$PSScriptRoot\backend"
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Backend installation failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Backend dependencies installed!" -ForegroundColor Green
Write-Host ""

# Install Frontend Dependencies
Write-Host "🎨 Installing Frontend Dependencies..." -ForegroundColor Yellow
Set-Location "$PSScriptRoot\frontend"
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Frontend installation failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Frontend dependencies installed!" -ForegroundColor Green
Write-Host ""

# Return to root
Set-Location $PSScriptRoot

Write-Host "🎉 Installation Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "To start the application, run:" -ForegroundColor Cyan
Write-Host "   .\start.ps1" -ForegroundColor White
Write-Host ""
Write-Host "Or manually:" -ForegroundColor Cyan
Write-Host "   Terminal 1: cd backend && npm run dev" -ForegroundColor White
Write-Host "   Terminal 2: cd frontend && npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
