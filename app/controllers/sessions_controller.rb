class SessionsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      user = User.find_by(email: user_params[:email])
  
      if user && user.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Login bem-sucedido!'
      else
        flash.now.alert = 'Email ou senha inválidos'
        @user = User.new
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to new_sessions_path, notice: 'Logout bem-sucedido!'
    end

    def user_params
      params.require(:user)
    end
  end
  