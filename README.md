# Refractor a small express project implementing part of REST api using Hapi
## Online Demo
Online demo available on [Hapi REST Example](http://123.206.110.199:3100/)
**Valid before 2017-04-27**

## Require
Node.js 6.0+

## Instructions
1. Install dependencies:
```
npm install
```
2. Import database to your MySQL from course.sql in this project.
3. Open index.js and set MySQL options:
```
options: {
        host: "127.0.0.1",
        user: "yourusername",
        password: "yourpassword",
        database: "course",
        port: "3306"
    }
```
4. Start server:
```
node index.js
```
or
```
npm start
```
5. Visit:
```
localhost:3100
```