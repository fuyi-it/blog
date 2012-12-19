class EntriesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def assign_tags
    params["entry"]["tags"] = params["entry"]["tagstring"].split(',').collect{|tag|
      '@' + Tag.find_or_create_by_name(tag.strip).id.to_s
    }  if  params["entry"]["tagstring"]
  end

  def create
    assign_tags
    hobo_create
  end

  def update
    assign_tags
    hobo_update
  end

end
