class TagsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  #auto_actions_for :entry,[:index,:create,:new]

end
