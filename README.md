# Database-client
1、當在處理數據時總是會遇到需要連結其他Server的應用，那如果連接的是DB的話要如何抓取對應資料，可以使用對應套件，指定欄位內容及報表抓取你需要的資料。
2、這是透過LINUX腳本執行應用套件
# 執行步驟
Step1：查詢DB相依性套件清單 EX:PostgresDB的psql需要使用client端套件應用操作如下：

![螢幕擷取畫面 2025-05-05 143404](https://github.com/user-attachments/assets/35398e96-d194-4e18-98d5-cba3ccc90e0d)

Step2：安裝DB相依性套件(CentOS/RedHat：sudo yum install postgresql)

![螢幕擷取畫面 2025-05-05 143933](https://github.com/user-attachments/assets/7f2ef536-6eb5-4047-9d91-1faa5afbf38a)

Step3：查詢client套件版本

![螢幕擷取畫面 2025-05-05 144038](https://github.com/user-attachments/assets/c09fc3ea-1f37-41d9-967b-2e28855306b1)





