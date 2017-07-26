require 'rails_helper'

  RSpec.describe "/application/hello.html.erb", :type => :view do
  before do
    controller.singleton_class.class_eval do
      protected
        def name
          session[:name]
        end
        helper_method :name
    end
  end

  it "shows greeting to logged in user" do
    session[:name] = "ben"
    render
    expect(rendered).to include 'Hi, ben'
  end

  it "shows login form to not logged in user" do
  	session.delete :name
  	render
  	expect(rendered).to match '<a href="/login">'
  end

end
