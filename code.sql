select * from doctor;

select * from patient;

select * from nurse;

select * from Patient
where gender like '남자';
/* 환자중 남자인 사람 찾는 코드*/
select Patient_name
from patient
group by Patient_name;
/* 환자이름 찾는 코드*/

select nr.age, count(*)
from Nurse nr
where nr.age>25
group by age
having count(*) > 1
order by nr.age;
/* 간호사의 나이와 몇명인지 찾는 코드*/

select pt.age , pt.gender , pt.Patient_name
from Patient pt
where gender like '여자' and pt.age > 30
order by pt.Patient_name;
/*여자 환자들의 이름 나이를 찾는것 */



select dc.medical_number , dc.doctor_name , dc.major , nr.nurse_name
from doctor dc , nurse nr
where dc.Medical_number = nr.Medical_number
order by dc.Medical_number;
/* 담당의사 찾는 코드join*/

select dc.Medical_number , dc.doctor_name , dc.major , w.wardcode
from doctor dc , ward w
where dc.Medical_number = w.doctor_responsibility
order by w.doctor_responsibility;
/* 담당병동 찾는 코드join*/



select medical_number,doctor_name , major
from doctor
where medical_number in (select medical_number from nurse where nurse_name = '심은하');
/* 심은하 담당의사 찾는 코드query*/


select registration_number , patient_name , hp 
from patient
where registration_number in (select patient_number from interview where interview_date = '2003-11-02');
/*해당 면담일자의 환자 이름 주민번호 전화번호 조회 query */

select patient_number , Medical_number 
from patient_doctor
where patient_number in (select patient_number from Inspection_Reservation where Medical_number like '2%' );
/*검사예약번호중 의사사번이 2인사람 검색 query */