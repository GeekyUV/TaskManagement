class UsersController < ApplicationController
  def logout
    sign_out(current_user)
    redirect_to root_path, notice: "Logged out successfully."
  end
end
