# Oracle
#!/usr/bin/env bash
. /etc/profile
. ~/.bash_profile
now="$(date +'%Y%m%d')"

# 使用對應DB套件進行對應指令使用
sqlplus AAA/123456@xxx.xx.xx.xx:1522/指定資料庫 <<EOF
set pagesize 0
set feedback off
set trimspool on
set sqlprompt ''

spool /xxxx/xxxx/scripts/result.txt

select field1,'|',field2,'|',field3,'|',field4,'|',field5,'|',field6,'|',field7,'|',field8'|',field9, ';' from 指定table;
spool off
exit
EOF

awk '{printf("%s",$0)}' /xxxx/xxxx/scripts/result.txt  > /xxx/xxx/scripts/result1.txt  
sed s/[[:space:]]//g  /xxxx/xxxx/scripts/result1.txt > /xxx/xxx/scripts/PTData.txt 
sed -i "s/\;/\\n/g" /xxxx/xxxx/scripts/PTData.txt
sed -i '1,2d' /xxxx/xxxx/scripts/PTData.txt

mv /xxxx/xxxx/scripts/PTData.txt  /xxxx/xxxx/PTData_"$now".txt
rm /xxxx/xxxx/scripts/result.txt /xxxx/xxxx/scripts/result1.txt


# PostgresDB
#!/usr/bin/env bash
. /etc/profile
. ~/.bash_profile
now="$(date +'%Y%m%d')"

# 設定環境變數（或使用 .pgpass 來避免密碼寫死）
export PGPASSWORD='Twm09350935'

psql -h xxxx.xxxx.xxxx.xxxx -p 123456 -U AAAA -d 指定資料庫 -At -F '|' <<EOF > /xxxx/xxxx/scripts/result.txt
SELECT field1, field2, field3, field4, field5, field6, field7, field8, field9 FROM 指定table;
EOF

# 清理格式並處理換行
awk '{printf("%s",$0)}' /xxxx/xxxx/scripts/result.txt > /xxxx/xxxx/scripts/result1.txt
sed 's/[[:space:]]//g' /xxxx/xxxx/scripts/result1.txt > /xxxx/xxxx/scripts/PTData.txt
sed -i "s/|/|/g" /xxxx/xxxx/scripts/PTData.txt  # pipe 保持分隔（可視需求處理）
sed -i "s/$/\\n/" /xxxx/xxxx/scripts/PTData.txt # 每筆資料換行
sed -i '1,2d' /xxxx/xxxx/scripts/PTData.txt     # 刪除前2行（視輸出內容）

mv /xxxx/xxxx/scripts/PTData.txt /xxxx/xxxx/PTData_"$now".txt
rm /xxxx/xxxx/scripts/result.txt /xxxx/xxxx/scripts/result1.txt
