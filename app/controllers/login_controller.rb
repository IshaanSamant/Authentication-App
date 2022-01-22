class LoginController < ApplicationController
  def index
  end

  def validate
  	user = User.find_by(username: params[:username])
		if user.present? 
			if user[:password]==params[:password]
				# login[:user_id] = user.id  
				@user = user[:id]
				redirect_to user_path(@user)
			else
				flash[:message] = "Wrong Password"
				render :index,status: :unprocessable_entity
			end
		
		else
			# flash.alert="Please check user credentials"
			flash[:message] = "Invalid Username"
			render :index,status: :unprocessable_entity
			# flash[:message] = "Invalid Details"
		end
  end
end




