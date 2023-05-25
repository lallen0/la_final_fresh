class TimeslotsController < ApplicationController
  def index
    matching_timeslots = Timeslot.all

    @list_of_timeslots = matching_timeslots.order({ :created_at => :desc })
    @meetings = matching_timeslots.order({ :created_at => :desc })

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
    the_timeslot.available = params.fetch("query_available", true)
    the_timeslot.date = params.fetch("query_date")
    the_timeslot.time = params.fetch("query_time")
    date = Date.parse(params.fetch("query_date"))
    time = Time.parse(params.fetch("query_time"))
    the_timeslot.start_time = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
    the_timeslot.end_time = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone) + 1.hour
    # the_timeslot.reserver_id = params.fetch("query_reserver_id")
    # the_timeslot.reserved_at = params.fetch("query_reserved_at")

    # the_timeslot.reserver_id = NULL
    the_timeslot.reserved_at = Time.now

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
      redirect_to("/timeslots/#{the_timeslot.id}", { :notice => "Timeslot updated successfully." })
    else
      redirect_to("/timeslots/#{the_timeslot.id}", { :alert => the_timeslot.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_timeslot = Timeslot.where({ :id => the_id }).at(0)

    the_timeslot.destroy

    redirect_to("/timeslots", { :notice => "Timeslot deleted successfully." })
  end

  def reserve
    the_id = params.fetch("path_id")
    the_timeslot = Timeslot.where({ :id => the_id }).at(0)

    the_timeslot.available = false
    the_timeslot.reserver_id = session[:user_id]
    the_timeslot.reserved_at = Time.now

    if URI.parse(request.referer).path == "/timeslots"
      if the_timeslot.valid?
        the_timeslot.save
        redirect_to("/timeslots", { :notice => "Timeslot reserved successfully." })
      else
        redirect_to("/timeslots", { :alert => the_timeslot.errors.full_messages.to_sentence })
      end
    elsif the_timeslot.valid?
      the_timeslot.save
      redirect_to("/courts/#{the_timeslot.court_id}", { :notice => "Timeslot reserved successfully." })
    else
      redirect_to("/courts/#{the_timeslot.court_id}", { :alert => the_timeslot.errors.full_messages.to_sentence })
    end
  end

  def release
    the_id = params.fetch("path_id")
    the_timeslot = Timeslot.where({ :id => the_id }).at(0)
    user_id = session[:user_id]

    the_timeslot.available = true
    the_timeslot.reserver_id = nil
    the_timeslot.reserved_at = Time.now

    if URI.parse(request.referer).path == "/timeslots"
      if the_timeslot.valid?
        the_timeslot.save
        redirect_to("/timeslots", { :notice => "Timeslot released successfully." })
      else
        redirect_to("/timeslots", { :alert => the_timeslot.errors.full_messages.to_sentence })
      end
    elsif URI.parse(request.referer).path == "/users/#{user_id}"
      if the_timeslot.valid?
        the_timeslot.save
        redirect_to("/users/#{user_id}", { :notice => "Timeslot released successfully." })
      else
        redirect_to("/users#{user_id}", { :alert => the_timeslot.errors.full_messages.to_sentence })
      end
    elsif URI.parse(request.referer).path == "/courts/#{the_timeslot.court_id}"
      if the_timeslot.valid?
        the_timeslot.save
        redirect_to("/courts/#{the_timeslot.court_id}", { :notice => "Timeslot released successfully." })
      else
        redirect_to("/courts#{the_timeslot.court_id}", { :alert => the_timeslot.errors.full_messages.to_sentence })
      end
    end
  end

end
