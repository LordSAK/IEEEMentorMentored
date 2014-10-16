class InsightsController < ApplicationController
  def new
  end

  def insights
    @userall = User.count
    @last = User.last.id
    @deleteuser = @last - @userall
    @per_current_user = (@userall.to_f/@last.to_f)*100.to_f
    #@per_current_user = (@userall/@last)
    @per_delete_user = (@deleteuser.to_f/@last.to_f)*100.to_f
    
    @date_start = DateTime.now
    @date_end = @date_start - 1.hour
    @twentyfourhours = User.where(:created_at => @date_end..@date_start).count
    puts @twentyfourhours

    @lastsevendays = User.where(
    'created_at >= :seven_days_ago',
    :seven_days_ago => 7.days.ago,
    ).count

    #@date_start = Date.today
    @date_start = DateTime.now
    @date_end = @date_start - 1.month
    @onemonth = User.where(:created_at => @date_end..@date_start).count

    @date_start = DateTime.now
    @date_end = @date_start - 6.month
    @sixmonth = User.where(:created_at => @date_end..@date_start).count

    @date_start = DateTime.now
    @date_end = @date_start - 1.year
    @oneyear = User.where(:created_at => @date_end..@date_start).count
  end
end
