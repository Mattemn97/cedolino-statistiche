@echo off
echo Starting Backend...
start cmd /k "cd backend && .\.venv\Scripts\Activate.bat && fastapi dev main.py"

echo Starting Frontend...
start cmd /k "cd frontend && npm run dev"

echo Both servers are starting. You can close this window now.
