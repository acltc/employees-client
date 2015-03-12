class Employee

  attr_reader :first_name, :last_name, :email

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def self.find(id)
    employee_hash = Unirest.get("http://localhost:3000/employees/#{id}.json").body
    return Employee.new(employee_hash)
  end

  def self.all
    employees = []
    employees_array = Unirest.get("http://localhost:3000/employees.json").body["employees"]
    employees_array.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    return employees
  end

end