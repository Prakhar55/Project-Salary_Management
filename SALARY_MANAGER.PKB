conn SALARY_MGMT/dbase @ xe;
CREATE OR REPLACE PACKAGE BODY SALARY_MANAGER
AS

procedure enter_and_maintain_address(p_employee_id number
			,p_address_1	varchar2
			,p_address_2	varchar2
			,p_address_3	varchar2
			,p_city		varchar2
			,p_pincode	number
			,p_state	varchar2
			,p_country	varchar2
			,p_address_type	varchar2
			,p_mode		varchar2)
as
			v_address_1	varchar2(100);
			v_address_2	varchar2(100);
			v_address_3	varchar2(100);
			v_city		varchar2(100);
			v_pincode	number(10);
			v_state		varchar2(100);
			v_country	varchar2(100);
			v_address_type  varchar2(100);

begin
if  LOWER(p_mode)='insert'
then
	HTP.P('inside insert mode' );
	insert into address_detail (employee_id 
				,address_1
				,address_2
				,address_3
				,city
				,pincode
				,state
				,country
				,address_type
				,creation_date 
				,created_by 
				,last_updated_date 
				,last_updated_by 
				)
	values		(p_employee_id
			,p_address_1	
			,p_address_2	
			,p_address_3	
			,p_city	
			,p_pincode
			,p_state	
			,p_country	
			,p_address_type	
			,SYSDATE
			,USER
			,SYSDATE
			,USER);
	commit;
	
	IF SQL%FOUND
	THEN HTP.P('INSERTED');
		HTP.P('<Br>');
	ELSIF SQL%NOTFOUND
	THEN HTP.P('RECORD NOT INSERTED');
		HTP.P('<Br>');
	COMMIT;
	ELSE  HTP.P('recoRd not valid');
	END IF;

elsif	LOWER(p_mode)='update'
then
	select		 address_1
			,address_2
			,address_3
			,city
			,pincode
			,state
			,country
			,address_type
	into		 v_address_1
			,v_address_2
			,v_address_3
			,v_city
			,v_pincode
			,v_state
			,v_country
			,v_address_type
	from		address_detail
	where		employee_id = p_employee_id;
	HTP.P('inside update mode' );
	update address_detail 
	set		 address_1=	nvl(p_address_1,v_address_1)
			,address_2=	nvl(p_address_2,v_address_2)
			,address_3=	nvl(p_address_3,v_address_3)
			,city     =	nvl (p_city,v_city)
			,pincode  =	nvl(p_pincode,v_pincode)
			,state    =	nvl (p_state,v_state)
			,country  =	nvl (p_country,v_country)
			,address_type = nvl(p_address_type,v_address_type)
	where		employee_id   = p_employee_id;
	
	IF SQL%FOUND
	THEN HTP.P('RECORD UPDATED');
		HTP.P('<Br>');
	ELSIF SQL%NOTFOUND
	THEN HTP.P('RECORD NOT UPDATED');
		HTP.P('<Br>');
	END IF;
	commit;
ELSE 
	HTP.P('INVALID MODE');
	HTP.P('<Br>');

END IF;
page_formatting('AFTER');

EXCEPTION WHEN NO_DATA_FOUND
	  THEN HTP.P(SQLCODE||' ' ||SQLERRM);
	  HTP.P('<Br>');
	  page_formatting('AFTER');
	  WHEN TOO_MANY_ROWS
	  THEN HTP.P(SQLCODE||' ' ||SQLERRM);
	  HTP.P('<Br>');
	  page_formatting('AFTER');
	  WHEN OTHERS
	  THEN HTP.P(SQLCODE||' ' ||SQLERRM);
		HTP.P('<Br>');
	  page_formatting('AFTER');

	commit;
end;

/*
procedure enter_and_maintain_deduction (p_employee_id number
			,p_tax_ampount		number
			,p_loan_amount		number
			,p_leave_amount		number
			,p_proffesional_tax	number
			,p_mode			varchar2
			)
as
			v_tax_ampount		number(10);
			v_loan_amount		number(10);
			v_leave_amount		number(10);
			v_proffesional_tax	number(10);
begin
if  LOWER(p_mode)='insert'
then
	HTP.P('inside insert mode' );
	insert into deduction_detail (employee_id 
			,tax_ampount	
			,loan_amount	
			,leave_amount	
			,proffesional_tax	
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
	values          (p_employee_id 
			,p_tax_ampount	
			,p_loan_amount	
			,p_leave_amount
			,p_proffesional_tax
			,SYSDATE
			,USER
			,SYSDATE
			,USER);
	commit;
elsif    LOWER(p_mode)='update'
then
	select		 tax_ampount	
			,loan_amount	
			,leave_amount	
			,proffesional_tax
	into		 v_tax_ampount	
			,v_loan_amount	
			,v_leave_amount	
			,v_proffesional_tax
	from		deduction_detail
	where employee_id=p_employee_id;
	HTP.P('inside update mode' );
	update deduction_detail 
	set		 tax_ampount	=  nvl (p_tax_ampount,v_tax_ampount)
			,loan_amount	=  nvl (p_loan_amount,v_loan_amount)
			,leave_amount	=  nvl (p_leave_amount,v_leave_amount)
			,proffesional_tax= nvl (p_proffesional_tax,v_proffesional_tax)
	where		employee_id=p_employee_id;
	commit;
end if;
end;*/

procedure enter_and_maintain_departments(p_department_id number
					,p_department_name varchar2
			                ,p_manager_id	number
					,p_mode		varchar2 )
as
					v_department_name   varchar2(100);
					v_manager_id     number(10);
begin
if  lower(p_mode)='insert'
then
	HTP.P('inside insert mode' );
	
	insert into departments(department_id 
			,department_name 
			,manager_id 
			,creation_date 
			,created_by 
			,last_updated_date 
			,last_updated_by 
			)
	values		(department_id_seq.nextval
			,p_department_name 
			,p_manager_id
			,SYSDATE
			,USER
			,SYSDATE
			,USER);
	commit;

elsif    lower(p_mode)='update'
then
	select		 department_name 
			,manager_id 
	into		 v_department_name 
			,v_manager_id 
	from		departments
	where		department_id= p_department_id;

HTP.P('inside update mode' );

	update departments 
	set		department_name    = nvl (p_department_name,v_department_name)
			,manager_id        = nvl (p_manager_id,v_manager_id)
	where		department_id      = p_department_id;
	commit;
end if;
end;

procedure enter_and_maintain_emp_sal (p_employee_id number
			,p_basic	number
			,p_hra		number
			,p_conveyance	number
			,p_medical      number
			,p_lta		number
			,p_salary_year number
			,p_mode		varchar2)
as
			v_basic		number(10,2);
			v_hra		number(10,2);
			v_conveyance	number(10,2);
			v_medical	number(10,2);
			v_lta		number(10,2);
			v_salary_year	number(10);
begin
if  LOWER(p_mode)='insert'
then
	HTP.P('inside insert mode' );
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
	values          (p_employee_id 
			,p_basic*12
			,p_hra*12
			,p_conveyance*12
			,p_medical*12
			,p_lta*12
			,p_salary_year
			,sysdate
			,user
			,sysdate
			,user);
	commit;
elsif    LOWER(p_mode)='update'
then
	select	basic	
		,hra	
		,conveyance
		,medical
		,lta
		,salary_year
	into	 v_basic	
		,v_hra
		,v_conveyance
		,v_medical
		,v_lta
		,v_salary_year
	from	emp_annual_sal
	where employee_id=p_employee_id;
	
	HTP.P('inside update mode' );

	update emp_annual_sal 
	set		 basic      = nvl (p_basic*12,v_basic*12)
			,hra        = nvl(p_hra*12,v_hra*12)
			,conveyance = nvl(p_conveyance*12,v_conveyance*12)
			,medical    = nvl(p_medical*12,v_medical*12) 
			,lta        = nvl(p_lta*12,v_lta*12)
			,salary_year = nvl(p_salary_year*12,v_salary_year*12)
	where	employee_id  = p_employee_id;
commit;
end if;
end;

procedure enter_and_maintain_employees	(p_employee_id  number
					,p_first_name varchar2
					,p_last_name  varchar2
					,p_date_of_birth  date
					,p_department_id number
					,p_email varchar2
					,p_job_id varchar2
					,p_employee_type varchar2
					,p_contact_no	number
					,p_effective_start_date date
					,p_effective_end_date date
					,p_mode   varchar2)
as
					v_first_name varchar2(100);
					v_last_name  varchar2(100);
					v_date_of_birth  date;
					v_department_id number(10);
					v_email varchar2(100);
					v_job_id varchar2(100);
					v_employee_type varchar2(100);
					v_contact_no	number(10);
					v_effective_start_date date;
					v_effective_end_date date;
begin
page_formatting('BEFORE');
if  LOWER(p_mode)='insert'
then

if	p_effective_end_date >= p_effective_start_date
and	p_effective_start_date >= (p_date_of_birth+6570)
	then
		insert into employees(employee_id
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
				,last_updated_by)
	values			(employee_id_seq.nextval
				,p_first_name 
				,p_last_name  
				,p_date_of_birth   
				,p_department_id 
				,p_email 
				,p_job_id 
				,p_employee_type 
				,p_contact_no	
				,p_effective_start_date 
				,p_effective_end_date 
				,sysdate
				,user
				,sysdate
				,user);
				commit;
				
	IF SQL%FOUND
	THEN HTP.P('INSERTED');
		HTP.P('<Br>');
	ELSIF SQL%NOTFOUND
	THEN HTP.P('RECORD NOT INSERTED');
		HTP.P('<Br>');
	END IF;
	COMMIT;
ELSE  HTP.P('recoRd not valid');
END IF;
elsif    LOWER(p_mode)='update'
then
	select first_name 
		,last_name 
		,date_of_birth
		,department_id
		,email 
		,job_id
		,employee_type
		,contact_no	
		,effective_start_date
		,effective_end_date
	into	v_first_name 
		,v_last_name 
		,v_date_of_birth
		,v_department_id
		,v_email 
		,v_job_id
		,v_employee_type
		,v_contact_no	
		,v_effective_start_date
		,v_effective_end_date
	from	employees
	where	employee_id=p_employee_id;
	
	HTP.P('inside update mode' );
    
	update employees
	set		first_name    = nvl (p_first_name,v_first_name)
			,last_name    = nvl (p_last_name,v_last_name)
			,date_of_birth= nvl(p_date_of_birth,v_date_of_birth)
			,department_id= nvl(p_department_id,v_department_id)
			,email        = nvl(p_email,v_email)
			,job_id       = nvl(p_job_id,v_job_id)
			,employee_type= nvl(p_employee_type,v_employee_type) 
			,contact_no   = nvl(p_contact_no,v_contact_no)
			,effective_start_date= nvl(p_effective_start_date,v_effective_start_date)
			,effective_end_date  = nvl(p_effective_end_date,v_effective_end_date)
	Where	 employee_id=p_employee_id;
	
	IF SQL%FOUND
	THEN HTP.P('RECORD UPDATED');
		HTP.P('<Br>');
	ELSIF SQL%NOTFOUND
	THEN HTP.P('RECORD NOT UPDATED');
		HTP.P('<Br>');
	END IF;
	commit;
ELSE 
	HTP.P('INVALID MODE');
	HTP.P('<Br>');

END IF;
page_formatting('AFTER');

EXCEPTION WHEN NO_DATA_FOUND
	  THEN HTP.P(SQLCODE||' ' ||SQLERRM);
	  HTP.P('<Br>');
	  page_formatting('AFTER');
	  WHEN TOO_MANY_ROWS
	  THEN HTP.P(SQLCODE||' ' ||SQLERRM);
	  HTP.P('<Br>');
	  page_formatting('AFTER');
	  WHEN OTHERS
	  THEN HTP.P(SQLCODE||' ' ||SQLERRM);
		HTP.P('<Br>');
	  page_formatting('AFTER');

end;


PROCEDURE salary_payslip(p_employee_id IN NUMBER
			 ,p_date  IN DATE)
AS
	v_tax      NUMBER(10,2);
	v_salary   NUMBER(10,2);
	v_age      NUMBER(10);
	v_pf       NUMBER(10);
	v_m_salary NUMBER(10,2);
BEGIN
	SELECT basic+hra   annual_salary
	INTO  v_salary 
	FROM  emp_annual_sal
	WHERE employee_id=p_employee_id;


	SELECT (sysdate-date_of_birth)/365
	INTO   v_age
	FROM   employees
	WHERE  employee_id=p_employee_id;


	IF v_age < 60
	THEN  
		IF v_salary <= 250000
		THEN v_tax :=0;
		
	ELSIF v_salary > 250000 AND  v_salary <= 500000
		THEN v_tax := (v_salary -250000)/10;
	ELSIF v_salary > 500000 AND  v_salary <= 1000000
		THEN v_tax := (v_salary -500000)/5 + 25000;
	ELSE
		 v_tax := (((v_salary -1000000)*3)/10) + 125000;
	END IF;

END IF;

IF v_age >= 60 AND  v_age < 80
		THEN
		IF v_salary <= 300000
			THEN v_tax :=0;
		ELSIF v_salary > 300000 AND  v_salary <= 500000
			THEN v_tax := (v_salary -300000)/10;
		ELSIF v_salary > 500000 AND  v_salary <= 1000000
			THEN v_tax := (v_salary -500000)/5 + 20000;
		ELSE  
			 v_tax := (((v_salary -1000000)*3)/10) + 120000;
		END IF;

END IF;


IF v_age > 80
	THEN
		IF v_salary >= 500000 
			THEN v_tax := 0;
		ELSIF v_salary >500000 AND  v_salary <= 1000000
			THEN v_tax := (v_salary -500000)/20;
		ELSE 
			v_tax := (((v_salary -500000)*3)/10) + 100000;
		END IF;
END IF;

	v_m_salary := (v_salary-v_tax)/12;
	IF v_m_salary <= 12500
		THEN v_pf := 0;
	elsIF v_m_salary > 12500 AND v_m_salary <= 15000
		THEN v_pf := 1500;
	else   v_pf :=2500;
	end if;
	


insert into deduction_detail (employee_id	
			,tax_ampount		
			,loan_amount		
			,leave_amount		
			,proffesional_tax	
			,creation_date		
			,created_by
			,last_updated_date
			,last_updated_by
			)
			values	(p_employee_id
				,v_tax
				,null
				,null
				,v_pf
				,sysdate
				,user
				,sysdate
				,user);
commit;
	end; 




PROCEDURE emp_payroll(p_date		IN	DATE
			,p_department_id  IN     NUMBER)
AS			v_employee_id   NUMBER(10,2);
			v_salary	NUMBER(10,2);
			v_m_salary	NUMBER(10,2);
			v_basic		NUMBER(10,2);
			v_hra		NUMBER(10,2);
			v_conveyance	NUMBER(10,2);
			v_medicaL	NUMBER(10,2);
			v_lta		NUMBER(10,2);
			v_tax		NUMBER(10,2);
			v_pf		NUMBER(10,2);
			v_salary_month  VARCHAR2(100);
			v_first_name	VARCHAR2(100);	
			v_last_name	VARCHAR2(100);	
			v_department_id NUMBER(10);
	
	CURSOR c_emp_detail
	IS
	SELECT	employee_id		
			,first_name		
			,last_name		
			,department_id
	FROM	employees
	WHERE department_id = p_department_id ;

BEGIN

	FOR i IN c_emp_detail
	LOOP
			v_employee_id  :=  i.employee_id;
			v_first_name   :=  i.first_name;
			v_last_name    :=  i.last_name; 
			v_department_id :=  i.department_id;
	SELECT		basic/12		
			,hra/12			
			,conveyance/12
			,medical/12
			,lta/12	
	INTO		v_basic
			,v_hra
			,v_conveyance	
			,v_medicaL
			,v_lta	
	FROM emp_annual_sal
	WHERE employee_id = v_employee_id;

	
	SELECT basic+hra   annual_salary
	INTO  v_salary 
	FROM  emp_annual_sal
	WHERE employee_id=v_employee_id;

	v_m_salary := v_salary/12;
	IF v_m_salary <= 12500
		THEN v_pf := 0;
	elsIF v_m_salary > 12500 AND v_m_salary <= 15000
		THEN v_pf := 125;
	else  
		if to_char(p_date,'mon') = 'mar'
		then 
			v_pf := 212;
		else 
			v_pf := 208;
		end if;
		end if;


	SELECT	tax_ampount		
	INTO	v_tax
	FROM deduction_detail 
	WHERE employee_id = v_employee_id
	AND   last_updated_date = (SELECT MAX(last_updated_date)
				FROM deduction_detail 
	WHERE employee_id = v_employee_id);



	v_salary_month := to_char(p_date,'mon');
	
	INSERT INTO emp_monthly_sal(employee_id	
			,basic		
			,hra		
			,conveyance	
			,medical	
			,lta		
			,tax_amount	
			,loan_amount	
			,proffesional_tax
			,salary_month		
			,creation_date		
			,created_by		
			,last_updated_date	
			,last_updated_by	
			)
	VALUES(v_employee_id 
			,v_basic	
			,v_hra     
			,v_conveyance
			,v_medicaL 
			,v_lta	 
			,v_tax	
			,null
			,v_pf
			,v_salary_month 
			,sysdate
			,user
			,sysdate
			,user);
			commit;

HTP.P(v_employee_id 
			||'  '||v_basic	
			||'  '||v_hra     
			||'  '||v_conveyance
			||'  '||v_medicaL 
			||'  '||v_lta	 
			||'  '||v_tax	
			||'  '||null
			||'  '||v_pf
			||'  '||v_salary_month 
			||'  '||sysdate
			||'  '||user
			||'  '||sysdate
			||'  '||user);
	END LOOP;
end;

end;
/

GRANT EXECUTE ON SALARY_MGMT.SALARY_MANAGER TO ANONYMOUS;
SHOW ERROR;