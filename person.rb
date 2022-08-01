require 'date'

class Person
  attr_accessor :name, :dob, :email_id, :age 
  def initialize (*args)
  	name, dob, email_id, age = args
  end

  def user_input
    puts "How many person detail you want to add"
    @response_number = gets.chomp.to_i
    if @response_number <= 0 
      puts "invalid number"
      user_input
    end
  end 

  def user_detail
    $user_detail = {}
    @selected_count = 0
    loop do 
      if @selected_count != @response_number
        puts "\nPlease Fillup below details"
        puts "Name : "
        name = gets.chomp 
        name_split = name.split("")
        numbers = (0..9).map{|a| a.to_s}
        answer = numbers.any? {|e| name_split.include? (e)}
        if answer == true 
          puts "please enter alphabet"
        else 
          puts "Date_of_birth : (dd-mm-yyyy) : "  
          input_dob = gets.chomp
          if match = input_dob.match(/\d{2}-\d{2}-\d{4}/)
            dob = Date.parse(input_dob)
            today_date = DateTime.parse(DateTime.now.strftime("%d/%m/%Y"))
          
            years = today_date.mjd - dob.mjd
            age = years / 365
            if age <= 0 
              puts "Please enter a correct date"
            else
              puts age.to_i
              email_id = recursive_email_id

              $user_detail[@selected_count +1] = { name: name, dob: input_dob, email_id: email_id, age: age }
              @selected_count += 1
            end
          else
            puts "Sorry..please enter in right format!"
          end
        end
      else 
        break
      end
    end
  end

  def recursive_email_id
    puts "Email-id : "
    email_id = gets.chomp
    repeted_email_id = $user_detail.values.map {|b| b[:email_id]}
    match = repeted_email_id.any?(email_id)
    if match == true
      puts "Please enter Unique email id"
      recursive_email_id
    else
      return email_id
    end
  end

  def count_max_age
    max_age_number = $user_detail.values.map {|a| a[:age]}.max
    puts "\nThe maximum number of age is #{max_age_number}"
    $user_detail.each do |k, v|
      if v[:age] == max_age_number
        puts v
      end
    end
  end
end

oldest_age = Person.new
oldest_age.user_input
oldest_age.user_detail
oldest_age.count_max_age