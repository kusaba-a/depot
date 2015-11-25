class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :now#, if: :whitelist
  before_action :authorize

  def now
    @time = Time.now
  end

  private

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "ログインしてください"
    end
  end


  def whitelist
    %w{store product}.include?(controller_name)
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
