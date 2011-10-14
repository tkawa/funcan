class HomeController < ApplicationController
  def index
    #@disp = Rails.application.config.middleware.middlewares.last.instance_variable_get(:@block) #instance_eval{|m| m.instance_variables.map{|s| [s, m.instance_variable_get(s)] } }
  end
end
