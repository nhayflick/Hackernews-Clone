class UsersController < ApplicationController
  def new
		@user = User.new
		3.times { @user.emails.build }
  end

  def create
		@user = User.new(params[:user])
		if @user.save
      sign_in(@user)
			redirect_to @user
		else
      (3 - @user.emails.size).times { @user.emails.build }
			render :new
		end
  end

  def show
		@user = User.find(params[:id])
  end
end
