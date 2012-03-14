module Bolt
  class AccessesController < Bolt::BoltController
  
    ## optional filters for defining usage according to Bolt::Users access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @bolt_page_title = 'Accesses'
  		@accesses = Access.paginate :page => params[:page]
    end
  
    def show
      @bolt_page_title = 'View access'
      @access = Access.find params[:id]
    end
 
    def new
      @bolt_page_title = 'Add a new access'
    	@access = Access.new
    end

    def create
      @access = Access.new params[:access]
    
      if @access.save
        flash[:notice] = 'Access created'
        redirect_to bolt_accesses_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new access'
        render :action => :new
      end
    end
  
    def update
      @bolt_page_title = 'Update access'
      
      @access = Access.find params[:id]
    
      if @access.update_attributes params[:access]
        flash[:notice] = 'Access has been updated'
        redirect_to bolt_accesses_path
      else
        flash.now[:warning] = 'There were problems when trying to update this access'
        render :action => :show
      end
    end
 
    def destroy
      @access = Access.find params[:id]

      @access.destroy
      flash[:notice] = 'Access has been deleted'
      redirect_to bolt_accesses_path
    end
  
  end
end
