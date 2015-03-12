class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    
  end

  def index
    @employees = Employee.all
  end

  def new

  end

  def create
    @employee = Unirest.post("http://localhost:3000/employees.json", :headers => {"Accept" => "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email]}).body
    redirect_to employee_path(@employee["id"])
  end
end






