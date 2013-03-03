class PagesController < ApplicationController
  def home
    @titre = "Accueil"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
    @users = User.find(:all)

    if !params[:sel_user_id].nil?
      user = User.find(params[:sel_user_id]) rescue user

      @microposts = user.microposts unless user.nil?

      if request.xml_http_request?
        render "pages/_microposts_list"
      end


      #respond_to do |format|

      #  format.js

      #end

    end
  end

  def contact
    @titre = "Contact"
  end

  def about
    @titre = "a Propos"
  end

  def help
    @titre = 'Aide'
  end

end
