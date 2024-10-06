@echo off

REM this is the script to the app entrypoint
REM run this .bat file to start the app's server.

REM the following lines will set up the virtual environment for the Django app
echo ---- Checking fo existence of venv...
if not exist /venv/ (
    echo ---- Virtual environment not initialised, please wait...
    python -m venv venv
)

echo ---- Starting the venv...
call ./venv/Scripts/activate.bat
REM the above line is used to actiavte the virtual environment. In case this command throws up an error,
REM go over to settings > Privacy & Secuirity > Allow Powershell scripts to run without signing-in
REM I may soon add some way of bypassing that step and instead may let you run it without that much of a hassle.

REM Installing Django (doesn't raise any error even if package exists so yeah nvm)
echo ---- Installing Django...
pip install django 

echo "Checking if the project exists (will set it up if it doesn't exist)"
if not exist .\bike_mgmt_app\ (
    django-admin startproject bike_mgmt_app
)

echo "---- Starting the server..."
cd .\bike_mgmt_app
echo ---- Currently in the app main directory
echo "Started the server successfully; do not quit this script window, let it run in the background as you navigate through your app."
py manage.py runserver
REM As of now, start server does nothing but just open up to show that Django works; visit 127.0.0.1:8000 on your web browser 
REM to see if it's working (or if you're lazy I'll add the link here)

REM W're adding the 'deactivate' venv command to quit running in the venv once we quit the app.