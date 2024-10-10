class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    home_path  # Redireciona para a página inicial após o login
  end
end
