class CartController < ApplicationController
	 before_action :authenticate_user!, except: [:add_to_cart, :view_order]
  def add_to_cart
  	line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity])

	  line_item.update(line_item_total: (line_item.quantity * line_item.product.price))

	  redirect_back(fallback_location: root_path)
  end

  def view_order
  	@line_items = current_order.line_items
  end

  def checkout
  	line_items = current_order.line_items

  	unless line_items.length == 0
	  	current_order.update(user_id: current_user.id, subtotal: 0)

	  	@order = current_order

	  	line_items.each do |line_item|
	  		line_item.product.update(quantity: (line_item.product.quantity - line_item.quantity))
	  		@order.order_items[line_item.product_id] = line_item.quantity
	  		@order.subtotal += line_item.line_item_total
	  	end
	  	@order.save

	  	@order.update(sales_tax: (@order.subtotal * 0.07))
	  	@order.update(grand_total:(@order.sales_tax + @order.subtotal))

	  	session[:order_id] = nil
	  end
  end
end
