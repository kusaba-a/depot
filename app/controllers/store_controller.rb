class StoreController < ApplicationController
  # before_action :now

  def index
    @products = Product.order(:title)

    #デバッグ用
    puts"----------------"
    puts session[:counter]
    puts"----------------"

    #1からカウント

    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @counter = session[:counter]
    @cart = current_cart

    #5からカウント

  end
end