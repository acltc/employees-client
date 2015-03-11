class EmployeesController < ApplicationController
  def show
    @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
    # @employee = { "first_name" => "Jill" }
    # @employee["first_name"]
  end
end
