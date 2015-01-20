class HitController < ApplicationController
 
 def new
    @disabled = Turkee::TurkeeFormHelper::disable_form_fields?(params)
    @website = Website.new
  end

  def create
    website = Website.find_by_url(params[:website][:url])
    if website.nil?
      # Send a new HIT
      @website = Website.new(params[:website])
      if @website.save
        flash[:success] = "The data from this website will be processed. Thanks!"
        Website.send_turkee_task(host, @website)
        redirect_to website_path(@website)
      else
        flash[:error] = "Something went wrong processing your request. Please try again."
        redirect_to new_website_path
      end
    end
  end
end