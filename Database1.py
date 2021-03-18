import sqlite3
import pandas as pd
con = sqlite3.connect("bachelor.db") ##학사 DB 생성
c = con.cursor()

c.execute("CREATE TABLE IF NOT EXISTS ljw_student \
    (Id integer PRIMARY KEY, Std_name text, Major text)") ##table 생성, 기본 키 지정

c.execute("CREATE TABLE IF NOT EXISTS ljw_course \
    (CourseNo integer PRIMARY KEY, Cs_name text, Instructor text)")

c.execute("CREATE TABLE IF NOT EXISTS ljw_taken \
    (CNo integer PRIMARY KEY, Id integer, CourseNo integer, Grade text)")

tuple1 = (
    (32193430, '이재원', '산업공학과'),
    (32191111, '돈키호테', '사학과'),
    (32202222, '노이만', '소프트웨어학과')
)

tuple2 = (
    (452660, '데이터베이스기초', '이석균'),
    (339170, '멀티미디어시스템', '박규식'),
    (527790, '객체지향프로그래밍', '이계성')
)

tuple3 = (
(1, 32193430, 452660, 'A'),
(2, 32193430, 339170, 'A'),
(3, 32191111, 452660,'B'),
(4, 32191111, 527790, 'C'),
(5, 32202222, 452660, 'B')
)
c.executemany("INSERT INTO ljw_student(Id, Std_name, Major) VALUES(?,?,?)", tuple1)
c.executemany("INSERT INTO ljw_course(CourseNo, CS_name, Instructor) VALUES(?,?,?)", tuple2)
c.executemany("INSERT INTO ljw_taken(CNo, Id, CourseNo, Grade) VALUES(?,?,?,?)", tuple3)

c.execute("SELECT Std_name, CS_name,Grade  FROM ljw_student, ljw_course, ljw_taken where ljw_student.Id = ljw_taken.Id and ljw_taken.CourseNo = ljw_course.CourseNo ")
'''rows = c.fetchall()
cols = [column[0] for column in c.description]
data_df = pd.DataFrame.from_records(data=rows, columns=cols)
print(data_df)'''

print("Std_name CS_name    Grade")
print("-----------------------------------------")

while (True): ##반복문과 print를 이용한 table 출력
    row = c.fetchone()
    if row == None:
        break;
    data1 = row[0]
    data2 = row[1]
    data3 = row[2]
    print("%4s  %7s  %s" % (data1, data2, data3))

print("")
print("-----------------------------------------")
while (True):
    row = c.fetchone()
    if row == None:
        break;
    data1 = row[0]
    data2 = row[1]
    data3 = row[2]
    print("%4s %8s  %s " % data1, data2, data3)

print("")'''

'''c.execute("SELECT * FROM ljw_course")
with con:
    with open('ljw_course.dat', 'w') as f:
        for line in con.iterdump():
            f.write('%s\n' % line)

print("CourseNo   CS_name      Instructor")
print("-----------------------------------------")
while (True):
    row = c.fetchone()
    if row == None:
        break;
    data1 = row[0]
    data2 = row[1]
    data3 = row[2]
    print("%5d  %3s  %3s" % (data1, data2, data3))

c.execute("SELECT * FROM ljw_taken")

print("")

print("CNo   Id     CS_name Grade")
print("-----------------------------------------")
while (True):
    row = c.fetchone()
    if row == None:
        break;
    data1 = row[0]
    data2 = row[1]
    data3 = row[2]
    data4 = row[3]
    print("%1d  %8d  %6d  %1s" % (data1, data2, data3, data4))

c.close()

