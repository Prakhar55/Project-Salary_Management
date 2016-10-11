begin

salary_manager.salary_payslip(P_EMPLOYEE_ID      => 1001
			,p_date    =>    sysdate);


salary_manager.emp_payroll(p_date    =>    sysdate
			,p_department_id  => 20);

end;
/