class TimeslotsController < ApplicationController
  def index
    matching_timeslots = Timeslot.all

    @list_of_timeslots = matching_timeslots.order({ :created_at => :desc })

    render({ :template => "timeslots/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_timeslots = Timeslot.where({ :id => the_id })

    @the_timeslot = matching_timeslots.at(0)

    render({ :template => "timeslots/show.html.erb" })
  end

  def create
    the_timeslot = Timeslot.new
    the_timeslot.court_id = params.fetch("query_court_id")
    the_timeslot.available = params.fetch("query_available", false)
    the_timeslot.date = params.fetch("query_date")
    the_timeslot.time = params.fetch("query_time")
    the_timeslot.reserver_id = params.fetch("query_reserver_id")
    the_timeslot.reserved_at = params.fetch("query_reserved_at")

    if the_timeslot.valid?
      the_timeslot.save
      redirect_to("/timeslots", { :notice => "Timeslot created successfully." })
    else
      redirect_to("/timeslots", { :alert => the_timeslot.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_timeslot = Timeslot.where({ :id => the_id }).at(0)

    the_timeslot.court_id = params.fetch("query_court_id")
    the_timeslot.available = params.fetch("query_available", false)
    the_timeslot.date = params.fetch("query_date")
    the_timeslot.time = params.fetch("query_time")
    the_timeslot.reserver_id = params.fetch("query_reserver_id")
    the_timeslot.reserved_at = params.fetch("query_reserved_at")

    if the_timeslot.valid?
      the_timeslot.save
      redirect_to("/timeslots/#{the_timeslot.id}", { :notice => "Timeslot updated successfully."} )
    else
      redirect_to("/timeslots/#{the_timeslot.id}", { :alert => the_timeslot.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_timeslot = Timeslot.where({ :id => the_id }).at(0)

    the_timeslot.destroy

    redirect_to("/timeslots", { :notice => "Timeslot deleted successfully."} )
  end
end
