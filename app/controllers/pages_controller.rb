class PagesController < ApplicationController
  def home
    @titre = "Accueil"
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
