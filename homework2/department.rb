require './employee.rb'

class Department
  def initialize(name:)
    @name = name
    @employees = []
  end

  def name
    @name
  end

  def employees
    @employees
  end

  def add_employee(e)
    @employees << e
  end

  def department_employees_names
    @employees.map {|employee| employee.name}
  end

  def department_salary
    salaries = @employees.map {|employee| employee.salary}
    salaries.inject(:+)
  end

  def satisfactory_employee_count
    employees.count {|employee| employee.satisfactory == TRUE}
  end

  def satisfactory_employees
    employees.select {|employee| employee.satisfactory == TRUE}
  end

  def department_raise(amount)
    satisfactory_employees().map {|employee| employee.raise((amount.to_f/satisfactory_employees().length).round(2), 'dollar')}
  end
end
