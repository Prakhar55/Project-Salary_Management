
connect salary_mgmt/dbase@XE;

---DROP SEQUENCE
	DROP SEQUENCE employee_id_seq;
	DROP SEQUENCE department_id_seq;
---DROP TABLE
	DROP TABLE address_detail;
	DROP TABLE deduction_detail;
	DROP TABLE emp_annual_sal;
	DROP TABLE emp_monthly_sal;
	DROP TABLE employees;
	DROP TABLE departments;

---SEQUENCE CREATION
	CREATE SEQUENCE department_id_seq
	START WITH 10
	INCREMENT BY 10
	NOCACHE
	NOCYCLE
	MAXVALUE 100;

	CREATE SEQUENCE employee_id_seq
	START WITH 1001
	INCREMENT BY 1
	NOCACHE
	NOCYCLE
	MAXVALUE 9999;

--- TABLE CREATION

create table departments(department_id		number(10)          primary key
			,department_name	varchar2(100)
			,manager_id		number(10)
			,creation_date		date
			,created_by		varchar2(100)
			,last_updated_date	date
			,last_updated_by	varchar2(100)
			);

create table employees (employee_id		number(10)          primary key
			,first_name		varchar2(100)
			,last_name		varchar2(100)
			,date_of_birth		date
			,department_id		number(10)          CONSTRAINT department_id_fk REFERENCES departments(department_id)   --foreign key where department_id_fk is constraint name
			,email			varchar2(100)
			,job_id			varchar2(100)
			,employee_type		varchar2(50)
			,contact_no		number(11)
			,effective_start_date	date
			,effective_end_date	date
			,creation_date		date
			,created_by		varchar2(100)
			,last_updated_date	date
			,last_updated_by	varchar2(100)
			);


create table emp_annual_sal(employee_id		number(10)
			,basic			number(10)
			,hra			number(10,2)
			,conveyance		number(10,2)
			,medical		number(10,2)
			,lta			number(10,2)
			,salary_year		number(10)
			,creation_date		date
			,created_by		varchar2(100)
			,last_updated_date	date
			,last_updated_by	varchar2(100)
			);
create table emp_monthly_sal(employee_id	number(10)
			,basic			number(10)
			,hra			number(10,2)
			,conveyance		number(10,2)
			,medical		number(10,2)
			,lta			number(10,2)
			,tax_amount		number(10,2)
			,loan_amount		number(10,2)
			,proffesional_tax	number(10,2)
			,salary_month		varchar2(100)
			,creation_date		date
			,created_by		varchar2(100)
			,last_updated_date	date
			,last_updated_by	varchar2(100)
			);

create table deduction_detail (employee_id	number(10)
			,tax_ampount		number(10,2)
			,loan_amount		number(10,2)
			,leave_amount		number(10,2)
			,proffesional_tax	number(10,2)
			,creation_date		date
			,created_by		varchar2(100)
			,last_updated_date	date
			,last_updated_by	varchar2(100)
			);


create table address_detail (employee_id number(10)
			,address_1	varchar2(100)
			,address_2	varchar2(100)
			,address_3	varchar2(100)
			,city		varchar2(100)
			,pincode	number(10)
			,state		varchar2(100)
			,country	varchar2(100)
			,address_type	varchar2(100)
			,creation_date	date
			,created_by	varchar2(100)
			,last_updated_date date
			,last_updated_by varchar2(100)
			);


--INSERT--
insert into departments(department_id 
			,department_name 
			,manager_id 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values( department_id_seq.nextval
		,'a'
		,1
		,sysdate
		,user
		,sysdate
		,user);

insert into departments(department_id 
			,department_name 
			,manager_id 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values( department_id_seq.nextval
		,'b'
		,2
		,sysdate
		,user
		,sysdate
		,user);

insert into departments(department_id 
			,department_name 
			,manager_id 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values( department_id_seq.nextval
		,'c'
		,3
		,sysdate
		,user
		,sysdate
		,user);

insert into departments(department_id 
			,department_name 
			,manager_id 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values( department_id_seq.nextval
		,'d'
		,4
		,sysdate
		,user
		,sysdate
		,user);

insert into departments(department_id 
			,department_name 
			,manager_id 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values( department_id_seq.nextval
		,'e'
		,5
		,sysdate
		,user
		,sysdate
		,user);

insert into employees (employee_id 
			,first_name
			,last_name  
			,date_of_birth  
			,department_id 
			,email
			,job_id
			,employee_type
			,contact_no
			,effective_start_date
			,effective_end_date 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
		values( employee_id_seq.nextval
			,'a'
			, 'Z'
			,'2-FEB-1990'
			,10
			,'a'
			,'a'
			,'permanent'
			,51
			,sysdate-60
			,NULL
			,sysdate
			,user
			,sysdate
			,user);
insert into employees (employee_id 
			,first_name
			,last_name  
			,date_of_birth  
			,department_id 
			,email
			,job_id
			,employee_type
			,contact_no
			,effective_start_date
			,effective_end_date 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
		values( employee_id_seq.nextval
			,'b'
			, 'y'
			,'5-MAR-1990'
			,10
			,'b'
			,'b'
			,'permanent'
			,52
			,sysdate-60
			,NULL
			,sysdate
			,user
			,sysdate
			,user);

insert into employees (employee_id 
			,first_name
			,last_name  
			,date_of_birth  
			,department_id 
			,email
			,job_id
			,employee_type
			,contact_no
			,effective_start_date
			,effective_end_date 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
		values( employee_id_seq.nextval
			,'c'
			, 'x'
			,'3-MAY-1991'
			,20
			,'c'
			,'c'
			,'permanent'
			,53
			,sysdate-60
			,NULL
			,sysdate
			,user
			,sysdate
			,user);

insert into employees (employee_id 
			,first_name
			,last_name  
			,date_of_birth  
			,department_id 
			,email
			,job_id
			,employee_type
			,contact_no
			,effective_start_date
			,effective_end_date 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
		values( employee_id_seq.nextval
			,'d'
			, 'w'
			,'20-JUN-1990'
			,20
			,'d'
			,'b'
			,'permanent'
			,54
			,sysdate-60
			,NULL
			,sysdate
			,user
			,sysdate
			,user);

insert into employees (employee_id 
			,first_name
			,last_name  
			,date_of_birth  
			,department_id 
			,email
			,job_id
			,employee_type
			,contact_no
			,effective_start_date
			,effective_end_date 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
		values( employee_id_seq.nextval
			,'e'
			,'v'
			,SYSDATE-22365
			,30
			,'e'
			,'c'
			,'permanent'
			,55
			,sysdate-60
			,NULL
			,sysdate
			,user
			,sysdate
			,user);


insert into emp_annual_sal(employee_id 
			,basic	
			,hra	
			,conveyance 
			,medical
			,lta	
			,salary_year
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values          (1001
			,10000*12
			,5000*12
			,1500*12
			,1500*12
			,NULL
			,NULL
			,sysdate
			,user
			,sysdate
			,user);
insert into emp_annual_sal(employee_id 
			,basic	
			,hra	
			,conveyance 
			,medical
			,lta	
			,salary_year 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values          (1002
			,25000*12
			,12500*12
			,1500*12
			,1500*12
			,NULL
			,NULL
			,sysdate
			,user
			,sysdate
			,user);
insert into emp_annual_sal(employee_id 
			,basic	
			,hra	
			,conveyance 
			,medical
			,lta	
			,salary_year  
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values          (1003
			,35000*12
			,17500*12
			,1500*12	
			,1500*12
			,NULL
			,NULL
			,sysdate
			,user
			,sysdate
			,user);

insert into emp_annual_sal(employee_id 
			,basic	
			,hra	
			,conveyance 
			,medical
			,lta	
			,salary_year  
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values          (1004
			,60000*12
			,30000*12
			,1500*12
			,1500*12
			,NULL
			,NULL
			,sysdate
			,user
			,sysdate
			,user);
insert into emp_annual_sal(employee_id 
			,basic	
			,hra	
			,conveyance 
			,medical
			,lta	
			,salary_year  
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by )
	values          (1005
			,16000*12
			,8000*12
			,1500*12
			,1500*12
			,NULL
			,NULL
			,sysdate
			,user
			,sysdate
			,user);
