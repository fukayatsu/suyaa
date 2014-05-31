class HooksController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :basic_auth

  def jawbone
    params.tapp
    head(:ok)
  end
end
