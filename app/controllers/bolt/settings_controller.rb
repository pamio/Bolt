module Bolt
  class SettingsController < Bolt::BoltController
  
    ## optional filters for defining usage according to Bolt::Users access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      redirect_to bolt_setting_path(1)
      @bolt_page_title = 'Settings'
  		@settings = Setting.paginate :page => params[:page]
    end
  
    def show
      @bolt_page_title = 'View setting'
      @site_images =MediaImage.where(:medium_id => 1)
      @setting = Setting.find params[:id]
    end
 
    # def new
      # @bolt_page_title = 'Add a new setting'
    	# @setting = Setting.new
    # end

    def create
      @setting = Setting.new params[:setting]
    
      if @setting.save
        flash[:notice] = 'Setting created'
        redirect_to bolt_settings_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new setting'
        render :action => :new
      end
    end
  
    def update
      @bolt_page_title = 'Update setting'
      
      @setting = Setting.find params[:id]
    
      if @setting.update_attributes params[:bolt_setting]
        flash[:notice] = 'Setting has been updated'
        redirect_to bolt_settings_path
      else
        flash.now[:warning] = 'There were problems when trying to update this setting'
        render :action => :show
      end
    end
 
    def destroy
      @setting = Setting.find params[:id]
      @setting.destroy
      flash[:notice] = 'Setting has been deleted'
      redirect_to bolt_settings_path
    end
  
  end
end
