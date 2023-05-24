Rails.application.routes.draw do



  # Routes for the Court resource:

  # CREATE
  post("/insert_court", { :controller => "courts", :action => "create" })
          
  # READ
  get("/courts", { :controller => "courts", :action => "index" })
  
  get("/courts/:path_id", { :controller => "courts", :action => "show" })
  
  # UPDATE
  
  post("/modify_court/:path_id", { :controller => "courts", :action => "update" })
  
  # DELETE
  get("/delete_court/:path_id", { :controller => "courts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

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


