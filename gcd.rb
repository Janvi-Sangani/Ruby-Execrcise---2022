class GretestCommanFactor
  $ans_hash = {}
  def user_input
    puts "Please enter the value of the total elements = "
    @total_count = gets.chomp.to_i
    if @total_count <= 0 
      puts "Sorry invalid number"
      return user_input
    end
  end

  def array_creating
    @new_array = Array.new(@total_count)
    for a in 0..(@total_count-1) do
      puts "Please enter element "
      user_value = gets.chomp.to_i
        if user_value <= 0 
          puts "Sorry invalid number"
          abort
        end
      @new_array[a] = user_value
    end
    puts "Your array is #{@new_array}"
  end

  def recursive_element
    @array_hash = {}
    @ans_array = []
      if @new_array.empty?
        return true
      else 
        answer = @new_array.pop
        puts "elements of #{answer}"
        for i in 1..answer do
          div = answer % i 
          if div == 0
            @ans_array << i 
          end
        end
        puts @ans_array.inspect
        $ans_hash[answer] = @ans_array
      end
    # puts "Your total values are #{$ans_hash}"
    return recursive_element
  end
  
  def fetch_common_values
    puts $ans_hash
    hash_arrays = $ans_hash.values
    comman_array = hash_arrays.inject(&:&)
    puts "\nComman elements are = " + comman_array.inspect
    max_number = comman_array.max
    puts "Your GCD is #{max_number}"
  end
end

comman_factor = GretestCommanFactor.new
comman_factor.user_input
comman_factor.array_creating
comman_factor.recursive_element
comman_factor.fetch_common_values