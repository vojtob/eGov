set PROJECT_DIR=%~dp0
set PROJECT_DIR=%PROJECT_DIR:~0,-7%

mkdir %PROJECT_DIR%\Memos

copy %PROJECT_DIR%\Architecture_src\memos\*.* %PROJECT_DIR%\Memos
