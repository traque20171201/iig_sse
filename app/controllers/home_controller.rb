# frozen_string_literal: true

class HomeController < ApplicationController  
  skip_before_action :authorized, only: [:index]

  def index
  end
end
