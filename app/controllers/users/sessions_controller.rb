# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  
  # POST /resource/sign_in
  # def create
  #    super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def destroy
    cart_products = CartProduct.where(cart_id: current_user.cart.id).map(&:product_id)
    super
    session[:product_id] = cart_products.map(&:to_s)
  end
    

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
