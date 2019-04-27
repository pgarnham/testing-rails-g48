class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:new, :update, :create, :destroy, :show]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :last_name])
  end

  private

  def set_comment
      @comment= Comment.find(params[:id])
    end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
