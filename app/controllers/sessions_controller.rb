class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Login bem-sucedido!'
      else
        flash.now.alert = 'Email ou senha inválidos'
        render :new
      end
    end
  
    def destroy
      reset_session
      redirect_to root_path, notice: 'Logout realizado com sucesso!'
    end
  end
  