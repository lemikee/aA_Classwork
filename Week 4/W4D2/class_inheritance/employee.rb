# frozen_string_literal: true

class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, salary, title, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

  # def inspect
  #     "Name: #{name} Role: #{self.class} Boss: #{boss}"
  # end
end
