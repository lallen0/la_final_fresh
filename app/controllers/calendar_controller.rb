
class CalendarController < ApplicationController

def custom_day_format(date)
  date.day.to_s
end

end 
