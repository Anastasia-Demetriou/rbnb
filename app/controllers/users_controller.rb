class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
#   def edit
#     @user.event_organiser = current_user(params[:event_organiser])
#     if @user.event_organiser == true
#     else @user.event_organiser == false
#     end
#   end
  def show
    @user = User.find(params[:id])
    authorize @user
  end


end
