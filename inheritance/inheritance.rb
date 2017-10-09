class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    lower_level = 0
    @employees.each do |employee|
      lower_level += employee.salary
      if employee.is_a?(Manager)
        result = employee.bonus(multiplier)
        lower_level += result/multiplier
      end
    end
    lower_level * multiplier
  end

end

ned = Manager.new('ned', 'Founder', 1_000_000, nil)
darren = Manager.new('darren', 'TA Manager', 78_000, 'ned')
shawna = Employee.new('shawna', 'TA', 12_000, 'darren')
david = Employee.new('david', 'TA', 10_000, 'darren')
darren.add_employee(shawna)
darren.add_employee(david)
ned.add_employee(darren)
