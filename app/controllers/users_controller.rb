class UsersController < ApplicationController 
  before_action :set_users, only: %i[ show edit update destroy ]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

def new
  @user= User.new
end

def edit

end

def index
    @users=User.all.paginate(page: params[:page], per_page: 4)
end

def update
   
    if @user.update(user_params)
      flash[:notice] = "successfully updated"
      redirect_to @user
    else
      render 'edit'

    end
  end
def show
  @articles = @user.articles.paginate(page: params[:page], per_page: 4)
end



def create
  @user = User.new(user_params)
  if @user.save
     session[:user_id]  = @user.id
    flash[:notice] = "Welcome to the Alpha Blog #{@user.username} , you are successfully signed_up"
    redirect_to articles_path
  else
    render 'new'
  end
end

def destroy
 @user.destroy
 session[:user_id] = nil if @user == current_user
 flash[:notice] = "Account and all associated articles successfully deleted"
 redirect_to articles_path

end

 private
  def user_params
     params.require(:user).permit( :username, :email, :password)
  end

  def set_users
      @user =User.find(params[:id]) 

  end

  def require_same_user
  if current_user != @user  && !current_user.admin?
    flash[:alert] = "you can only edit or delete your own profile"
    redirect_to users_path
  end
end

end