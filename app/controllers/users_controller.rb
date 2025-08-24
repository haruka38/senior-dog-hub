class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @dogs = @user.dogs
  end
end
