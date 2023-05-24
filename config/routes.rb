Rails.application.routes.draw do



  # Routes for the Timeslot resource:

  # CREATE
  post("/insert_timeslot", { :controller => "timeslots", :action => "create" })
          
  # READ
  get("/timeslots", { :controller => "timeslots", :action => "index" })
  
  get("/timeslots/:path_id", { :controller => "timeslots", :action => "show" })
  
  # UPDATE
  
  post("/modify_timeslot/:path_id", { :controller => "timeslots", :action => "update" })
  
  # DELETE
  get("/delete_timeslot/:path_id", { :controller => "timeslots", :action => "destroy" })

  #------------------------------

end


