require './department.rb'

def pretty_satisfactory(boolean)
  if boolean == true
    "Satisfactory"
  else
    "Unsatisfactory"
  end
end

hr = Department.new(name: 'HR')

billy = Employee.new(name: 'Billy Bob', email: 'billy@automatedinsights.com', phone: '1234567890', salary: 50000)

hr.add_employee(billy)

puts "Employee name: #{billy.name}"
puts "Employee salary: #{billy.salary}"
puts "Department name: #{hr.name}"

jack = Employee.new(name: 'Jack Black', email: 'jack@automatedinsights.com', phone: '1234567890', salary: 50000)
jill = Employee.new(name: 'Jill Green', email: 'jill@automatedinsights.com', phone: '1234567890', salary: 50000)

hr.add_employee(jack)
hr.add_employee(jill)

puts "Fast forward a few weeks..."
puts "The #{hr.name} Department is now comprised of #{hr.department_employees_names}"
puts "#{hr.name} Department total salary: #{hr.department_salary}"

billy.add_review("Billy has done a phenominal job. He is a great worker and very nice.

I would recommend him for a promotion.")

puts "Billy's review: #{billy.review}"
puts "Billy received a $2,000 raise"

billy.raise(2000, 'dollar')

puts "Billy's new salary: #{billy.salary}"

puts "There is $3,000 to be distributed to satisfactory members of the #{hr.name} Department"

billy.satisfactory_performance?(true)
jack.satisfactory_performance?(false)
jill.satisfactory_performance?(true)

puts "BEFORE"

puts "Billy made #{billy.salary} and was #{pretty_satisfactory(billy.satisfactory)}"
puts "Jack made #{jack.salary} and was #{pretty_satisfactory(jack.satisfactory)}"
puts "Jill made #{jill.salary} and was #{pretty_satisfactory(jill.satisfactory)}"

hr.department_raise(3000)

puts "AFTER"

puts "Billy now makes #{billy.salary}"
puts "Jack now makes #{jack.salary}"
puts "Jill now makes #{jill.salary}"
