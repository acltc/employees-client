class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end

  def index
    # GOAL: @employees = Employee.all
    employees_array = Unirest.get("#{ENV['API_BASE_URL']}/employees.json", :headers => {"X-User-Email" => "test@test.com", "Authorization" => "Token token=#{ENV['API_KEY']}"}).body["employees"]
    @employees = []
    employees_array.each do |employee_hash|
      @employees << Employee.new(employee_hash)
    end
  end

  def new

  end

  def create
    @employee = Unirest.post("http://localhost:3000/employees.json", :headers => {"Accept" => "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email]}).body
    redirect_to employee_path(@employee["id"])
  end
end






