class Dot 
  $array_sum = []
  def user_input
    puts "\nPlease choose any one : "
    @choice_array = ["triangle","square","pentagone","hexagone","heptagone","octagone"]
    @initial_shape_dots = { "traingle": 3, "square": 4, "pentagone": 5, "hexagone": 6, "heptagone": 7, "octagone": 8 }
    puts @choice_array

    puts "\nEnter your choice :"
    @selected_shape = gets.chomp
    unless @choice_array.include?(@selected_shape.to_s)
      puts "\nSorry wrong option enter!!!!\nPlease enter right option"
      return user_input
    end

    puts "How many #{@selected_shape} you want please enter the number = "
    @shape_value = gets.chomp.to_i
    @shape_value_count =*(1..(@shape_value-1))
    object_dot
   
    if @shape_value == 1 || 0
      sum
    end
  end

  def object_dot 
    if @shape_value_count.empty?
      sum
    else
      i = @shape_value_count.slice!(0)
      if @shape_value_count != @shape_value
        if @selected_shape == "triangle"
          j = 3
        elsif @selected_shape == "square"
          j = 4
        elsif @selected_shape == "pentagone"
          j = 5
        elsif @selected_shape == "hexagone"
          j = 6
        elsif @selected_shape == "heptagone"
          j = 7
        else 
          j = 8
        end
        # j = @initial_shape_dots[@selected_shape]
        multiplication = j * i
        $array_sum << multiplication
        object_dot 
      end
    end
  end

  def sum
    if @shape_value == 0
      puts "For any object 0 value gives 0 answer!"
      abort
    else
      output = $array_sum.sum + 1
      puts "Your output for #{@shape_value} #{@selected_shape} is #{output}"
    end
  end
end

user = Dot.new
user.user_input