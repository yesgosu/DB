select * from doctor;

select * from patient;

select * from nurse;

select * from Patient
where gender like '����';
/* ȯ���� ������ ��� ã�� �ڵ�*/
select Patient_name
from patient
group by Patient_name;
/* ȯ���̸� ã�� �ڵ�*/

select nr.age, count(*)
from Nurse nr
where nr.age>25
group by age
having count(*) > 1
order by nr.age;
/* ��ȣ���� ���̿� ������� ã�� �ڵ�*/

select pt.age , pt.gender , pt.Patient_name
from Patient pt
where gender like '����' and pt.age > 30
order by pt.Patient_name;
/*���� ȯ�ڵ��� �̸� ���̸� ã�°� */



select dc.medical_number , dc.doctor_name , dc.major , nr.nurse_name
from doctor dc , nurse nr
where dc.Medical_number = nr.Medical_number
order by dc.Medical_number;
/* ����ǻ� ã�� �ڵ�join*/

select dc.Medical_number , dc.doctor_name , dc.major , w.wardcode
from doctor dc , ward w
where dc.Medical_number = w.doctor_responsibility
order by w.doctor_responsibility;
/* ��纴�� ã�� �ڵ�join*/



select medical_number,doctor_name , major
from doctor
where medical_number in (select medical_number from nurse where nurse_name = '������');
/* ������ ����ǻ� ã�� �ڵ�query*/


select registration_number , patient_name , hp 
from patient
where registration_number in (select patient_number from interview where interview_date = '2003-11-02');
/*�ش� ��������� ȯ�� �̸� �ֹι�ȣ ��ȭ��ȣ ��ȸ query */

select patient_number , Medical_number 
from patient_doctor
where patient_number in (select patient_number from Inspection_Reservation where Medical_number like '2%' );
/*�˻翹���ȣ�� �ǻ����� 2�λ�� �˻� query */