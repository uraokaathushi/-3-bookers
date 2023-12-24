class RegistrationsController < ApplicationController
  def create
      def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(resource)
  end
  end
end