class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :current_user, :only => [ :show, :update, :destroy ]

  def current_user
    @user ||= User.find_by_authentication_token(params[:authentication_token])
  end

  def authenticate_user
    @current_user = User.find_by_authentication_token(params[:token])
    unless @current_user
      respond_with({:error => "Token is invalid." })
    end
  end

end
