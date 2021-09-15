# frozen_string_literal: true

# Main Controller
class MainController < ApplicationController
  def health
    render plain: 'OK'
  end

  def index
    render json: { users: User.all }
  end
end
