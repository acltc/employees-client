class EmployeesController < ApplicationController
  def show
    employee_hash = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
    @employee = Employee.new(employee_hash)
  end

  def index
    @employees = Unirest.get("http://localhost:3000/employees.json").body["employees"]
  end

  def new

  end

  def create
    @employee = Unirest.post("http://localhost:3000/employees.json", :headers => {"Accept" => "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email]}).body
    redirect_to employee_path(@employee["id"])
  end
end






