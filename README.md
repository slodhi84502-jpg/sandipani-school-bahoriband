# Sandapani Vidyalaya Bahoriband - School Website Project

Yeh ek complete school management website hai jisme ek dynamic frontend aur saare content ko manage karne ke liye ek secure admin panel hai.

## System Requirements (Zaroori Cheezein)

-   **Web Server:** Apache (Local setup ke liye XAMPP ya WAMP sabse accha hai)
-   **PHP Version:** 7.4 ya usse naya
-   **Database:** MySQL ya MariaDB
-   **Web Browser:** Koi bhi modern browser (Chrome, Firefox, Edge)

## Installation Instructions (Project Kaise Set Up Karein)

Project ko apne local machine par set up karne ke liye in steps ko follow karein.

### 1. Database Setup

1.  **phpMyAdmin** kholein (zyadatar `http://localhost/phpmyadmin` par hota hai).
2.  Ek naya database banayein aur uska naam `sandapani_school` rakhein.
3.  `sandapani_school` database ko select karein.
4.  Upar **"Import"** tab par click karein.
5.  **"Choose File"** par click karke is project ke andar `database/sandapani_school.sql` file ko select karein.
6.  **"Go"** par click karke database ko import kar dein. Isse saare tables ban jayenge.

### 2. File Configuration (Files ki Settings)

1.  Pure `sandapani_vidyalaya` project folder ko apne web server ke root directory mein copy karein (jaise `C:/xampp/htdocs/`).
2.  `config.php` file ko kholein.
3.  Database credentials check karein. Default XAMPP ke liye yeh sahi hote hain:
    -   `DB_HOST`: 'localhost'
    -   `DB_USERNAME`: 'root'
    -   `DB_PASSWORD`: ''
    -   `DB_NAME`: 'sandapani_school'

### 3. Folder Permissions (File Upload ke liye)

File uploads (jaise student ki photo, notice attachment) kaam karein, uske liye web server ko `uploads` folder mein files save karne ki permission honi chahiye.

-   `/uploads/students/`
-   `/uploads/teachers/`
-   `/uploads/notices/`
-   `/uploads/events/`
-   `/uploads/gallery/`

### 4. Website Kahan Dekhein

-   **Main Website:** `http://localhost/sandapani_vidyalaya/`
-   **Admin Panel:** `http://localhost/sandapani_vidyalaya/admin/`

### 5. Admin Login Details (Default)

-   **Username:** `admin`
-   **Password:** `admin123` 