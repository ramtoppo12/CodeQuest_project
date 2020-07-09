class EvntsController < ApplicationController
  def search
  end

  def event
    @event = Evnt.new
  end
  def create
    @event =Evnt.new(cart_params)
    if @event.save
      redirect_to '#home'
    else
      render 'event'
    end
    end
    def cart_params
      params.require(:event).permit(:title)
    end
end
