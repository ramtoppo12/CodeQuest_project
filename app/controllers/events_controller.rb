class EventsController < ApplicationController
  def search
    @evnt = Event.where("title LIKE ?", "%" + params[:title] + "%")
  end

  def event
    @evnt = EventToUse.new
  end
  def create
  	@evnt =Event.new(event_params)
  	if 	@evnt.save
      flash[:notice] = 'Event Created'
  		render 'home'
  	else
  		render 'event'
  	end

  	end

  	private
   	def event_params
   		params.require(:evnt).permit(:title)
   	end

end
