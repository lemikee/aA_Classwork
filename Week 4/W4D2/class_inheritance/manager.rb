# frozen_string_literal: true

require_relative 'employee'
require 'byebug'
require 'pp'

class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss = nil)
    super
    @employees = []
  end

  def hire_employee(employee)
    @employees << employee
    employee.boss = self
  end

  def bonus(multiplier)
    agg_salary *  multiplier
  end

  protected

  def agg_salary
    total_salary = 0
    employees.each do |employee|
      total_salary += employee.agg_salary if employee.is_a?(Manager)
      # debugger
      total_salary += employee.salary
    end
    total_salary
  end
end

ned = Manager.new('Ned', 1_000_000, 'Founder')
darren = Manager.new('Darren', 78_000, 'TA Manager')
shawna = Employee.new('Shawna', 12_000, 'TA')
david = Employee.new('David', 10_000, 'TA')

darren.hire_employee(shawna)
darren.hire_employee(david)
ned.hire_employee(darren)

pp ned.employees
pp shawna.boss
pp darren.boss
pp darren.employees

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
