class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
    # @tasks = current_user.category.order(:id)
    # @tasks = Task.all
    # @categorys = current_user.category.order(:id)
  end

end
