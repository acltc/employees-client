class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end

  def index
    # GOAL: @employees = Employee.all
    puts "ASDFADSF"
    puts "#{ENV['API_BASE_URL']}"
    employees_array = Unirest.get("#{ENV['API_BASE_URL']}/employees.json", :headers => {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body["employees"]
    @employees = []
    employees_array.each do |employee_hash|
      @employees << Employee.new(employee_hash)
    end
  end

  def new

  end

  def create
    @employee = Unirest.post("#{ENV['API_BASE_URL']}/employees.json", :headers => {"Accept" => "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email]}).body
    redirect_to employee_path(@employee["id"])
  end
end






