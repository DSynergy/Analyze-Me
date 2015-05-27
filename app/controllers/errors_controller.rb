class ErrorsController < ApplicationController

  def show
    @exception = ENV['action_dispatch.exception']
    render request.path[1..-1]
  end

end
