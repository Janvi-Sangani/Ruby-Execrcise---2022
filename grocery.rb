class GroceryShop
  attr_accessor :name, :code, :price, :quantity 
  def initialize (*args)
  	 @name, @code, @price, @quantity = args
  end
end

class User
  def user_input
	 	puts "\nHow many products you wanted = "
    @product = gets.chomp.to_i
		if @product.positive? && @product != 0
		else 
			puts "Sorry! please enter valid number"
			return_user = User.new
			return_user.user_input
			return_user.product_detail
			return_user.oredr_confirm
			abort
		end
	end
		
	def product_detail
		$product_hash = Hash.new
		@selected_count = 0
		loop	do 
			puts "\n\nWhat do you want to buy??"
			puts "please enter the code of the product = "
			@code_enter = gets.chomp.to_i
			@selected_product = $details.find {|a| a.code.to_i == @code_enter}
		
			if !@selected_product.nil?
				puts "YES code was matched!!"
				puts "\nPlease enter the quantity of the product = "
				@product_quantity = gets.chomp.to_i

				if @product_quantity.positive? && @product_quantity != 0
					if @selected_product.quantity.to_i >= @product_quantity
					$product_hash[@selected_count +1] = { name: @selected_product.name, code: @selected_product.code, quantity: @product_quantity, price: @selected_product.price.to_i * @product_quantity, }

					puts "Added to the cart!"
					@selected_count += 1
					else puts "SORRY item was out of stock!" 
					end
				else 
					puts "Please Enter valid number"
				end
			else
				puts "SORRY code was not matched!"	
			end
			@total_amount = 0
				if @selected_count == @product
					puts "\nYour order details:"
					format = "%-14s %-12s %-12s %-10s %-10s" 
					puts format% ["ProductNumber","ProductName","ProductCode","Quantity", "Amount"]
					$product_hash.each do |key, product_data|
						puts format% [ key, product_data[:name], product_data[:code], product_data[:quantity], product_data[:price].to_i * @product_quantity ]
						@total_amount += product_data[:price].to_i * @product_quantity
					end
					break
				end
			end
		puts "Your Order total is:"
		puts @total_amount
	end

	def oredr_confirm
		puts "\nFor order Confirm press enter "
		@orderconfirm = gets
		if 
			@orderconfirm == "\n"
			puts "Ordered Sucessfully!!!!!!!"	
			puts "\nDo you want to continue for more oreders?"
			puts "Yes for continue... & No for exit!"
			@user_reply = gets.chomp
			if 
				@user_reply == "Yes" || @user_reply == "yes"
				repeate = User.new
				repeate.user_input
				repeate.product_detail
				repeate.oredr_confirm
			end
			if @user_reply == "No" || @user_reply == "no"
				puts "Thank you!! for shopping"
				abort
			end
		else 
			puts "Sorry Oredr was not confirm please press enter again!"
		end
	end
end

$details = []
$details << GroceryShop.new( 'Milk',       '200',  '20',   '50' )
$details << GroceryShop.new( 'ColdDrinks', '255',  '20',   '60' )
$details << GroceryShop.new( 'Suji',       '401',  '15',   '20' )
$details << GroceryShop.new( 'Besan',      '500',  '20',   '40' )
$details << GroceryShop.new( 'wefars',     '289',  '20',   '50' )
$details << GroceryShop.new( 'soap',       '191',  '40',   '60' )
$details << GroceryShop.new( 'shampoo',    '311',  '80',   '80' )
$details << GroceryShop.new( 'oil',        '611',  '200',  '20' )
$details << GroceryShop.new( 'biscuit',    '901',  '20',   '50' )
$details << GroceryShop.new( 'buttermilk', '818',  '20',   '50' )

format = "%-15s %-10s %4s %10s %12s" 
puts format % ["ProductNumber","ProductName","ProductCode","ProductPrice", "AvailableQuantity"]
	$details.each_with_index do |details, i|
    puts format % [ i+1, details.name, details.code, details.price, details.quantity ]
	end

gr_shop = User.new
gr_shop.user_input
gr_shop.product_detail
gr_shop.oredr_confirm