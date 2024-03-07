class UsersController < ApplicationController
    before_action :redirect_if_authenticated, only: [:new]

  def new
    @user = User.new
  end

  def create
    # ...
  end

  private

  def redirect_if_authenticated
    redirect_to root_path if current_user
  end
    
    def index
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path, notice: 'Usuário criado com sucesso!'
        else
          render :new
    end
end