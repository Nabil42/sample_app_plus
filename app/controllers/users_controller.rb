class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  def new
    @user = User.new
    @titre = "Inscription"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenue dans l'Application Exemple !"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @titre = "Édition profil"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualisé."
      redirect_to @user
    else
      @titre = "Édition profil"
      render 'edit'
    end
  end

  def index
    @titre = "Liste des utilisateurs"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé."
    redirect_to users_path
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
