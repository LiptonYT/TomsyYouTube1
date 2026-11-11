@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist .venv (
    py -3.12 -m venv .venv
    if errorlevel 1 (
        echo Не удалось создать окружение. Установи Python 3.12 и отметь Add Python to PATH.
        pause
        exit /b 1
    )
)
call .venv\Scripts\activate
python -m pip install --upgrade pip
pip install -r requirements.txt
if not exist .env (
    copy .env.example .env
    echo.
    echo Создан файл .env. Вставь в него токен бота и запусти start.bat повторно.
    pause
    exit /b 0
)
python bot.py
pause
