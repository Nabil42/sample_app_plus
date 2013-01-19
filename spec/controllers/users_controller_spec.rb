require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be success" do
      get 'new'
      response.should be_success
    end

    it "should have the proper title" do
      get 'new'
      response.should have_selector("title", :content => "Inscription")
    end
  end
end