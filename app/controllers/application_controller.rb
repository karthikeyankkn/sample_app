class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def test
  	render html: "sample app welcomes you"
  end

  def user
  	render html: "welcome user...  :)"
  end
end
