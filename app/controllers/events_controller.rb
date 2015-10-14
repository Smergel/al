class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @email = ""
    User.all.each do |x|
      @email << x.email + ","
    end
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        UserSignup.signup(@email).deliver
        format.html { redirect_to "/calendar", notice: "Event Created" }
      else
        format.html { render :new }
      end
    end
  end

  private
  def event_params
    params.require(:event).permit(:event_body, :date, :link)
  end
end
