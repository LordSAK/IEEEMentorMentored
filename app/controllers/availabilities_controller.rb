class AvailabilitiesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
  		puts 'Hassan'
  		@blah=params[:Availability][:Monday]
  		if params[:Availability][:Monday] == "1"
  			@fromday = params[:Availability][:mondayFrom]
  			@fromAMPM = params[:Availability][:ddl_MonFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:mondayTo]
  			@ToAMPM = params[:Availability][:ddl_MonToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Monday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end

        if params[:Availability][:Tuesday] == "1"
  			@fromday = params[:Availability][:tuesdayFrom]
  			@fromAMPM = params[:Availability][:ddl_TueFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:tuesdayTo]
  			@ToAMPM = params[:Availability][:ddl_TueToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Tuesday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end

        if params[:Availability][:Wednesday] == "1"
  			@fromday = params[:Availability][:wednesdayFrom]
  			@fromAMPM = params[:Availability][:ddl_WedFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:wednesdayTo]
  			@ToAMPM = params[:Availability][:ddl_WedToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Wednesday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end
 
        if params[:Availability][:Thursday] == "1"
  			@fromday = params[:Availability][:thursdayFrom]
  			@fromAMPM = params[:Availability][:ddl_ThurFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:wednesdayTo]
  			@ToAMPM = params[:Availability][:ddl_ThurToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Thursday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end

        if params[:Availability][:Friday] == "1"
  			@fromday = params[:Availability][:fridayFrom]
  			@fromAMPM = params[:Availability][:ddl_FriFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:fridayTo]
  			@ToAMPM = params[:Availability][:ddl_FriToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Friday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end

		if params[:Availability][:Saturday] == "1"
  			@fromday = params[:Availability][:saturdayFrom]
  			@fromAMPM = params[:Availability][:ddl_SatFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:saturdayTo]
  			@ToAMPM = params[:Availability][:ddl_SatToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Saturday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end

        if params[:Availability][:Sunday] == "1"
  			@fromday = params[:Availability][:sundayFrom]
  			@fromAMPM = params[:Availability][:ddl_SunFromAMPM]
	  		@from = @fromday + @fromAMPM
  			@Today = params[:Availability][:sundayTo]
  			@ToAMPM = params[:Availability][:ddl_SunToAMPM]
	  		@To = @Today + @ToAMPM
  			@availibility=Availability.new(:UserID => current_user.id, :UserDays => 'Monday', :TimeFrom => @from, :TimeTo => @To)
  			@availibility.save
  		end

  		redirect_to '/communications'
  end

  def new
  	#@availibility=Availability.new
  end

  def destroy
  end
end
