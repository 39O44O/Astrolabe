class TopController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  
  def home
    @lists = List.where(user: current_user).order("created_at ASC")
  end
  
  def menu
    @lists = List.where(user: current_user).order("created_at ASC")
  end
  
  def index
    @lists = List.where(user: current_user).order("created_at ASC")
  end

end
