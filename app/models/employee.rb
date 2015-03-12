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

  # def first_name
  #   return @first_name
  # end

  # def last_name
  #   return @last_name
  # end

  # def email
  #   return @email
  # end

end