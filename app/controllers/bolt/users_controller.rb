module Bolt
  class UsersController < Bolt::BoltController
    # GET /bolt/users
    # GET /bolt/users.json
    def index
      @bolt_users = Bolt::User.all
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @bolt_users }
      end
    end

    # GET /bolt/users/1
    # GET /bolt/users/1.json
    

    # GET /bolt/users/new
    # GET /bolt/users/new.json
    def new
      @bolt_user = Bolt::User.new
      
      @groups = Group.all
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @bolt_users }
      end
    end

    def show 
      @bolt_user = Bolt::User.find(params[:id])
      @u_groups = @bolt_user.groups.collect{|g| g.id}
      @groups = Group.all      
    end

    # GET /bolt/users/1/edit
    def edit
      @bolt_user = Bolt::User.find(params[:id])
      
    end

    # POST /bolt/users
    # POST /bolt/users.json
    def create
      @bolt_user = Bolt::User.new(params[:bolt_user])
      
      respond_to do |format|
        if @bolt_user.save
          format.html { redirect_to :action=>'index', :notice => 'User was successfully created.' }
          format.json { render :json => @bolt_users, :status => "created", :location => @bolt_user }
        else
          format.html { render :action => "new" }
          format.json { render :json => @bolt_user.errors, :status => :unprocessable_entity}
        end
      end
    end

    # PUT /bolt/users/1
    # PUT /bolt/users/1.json
    def update
      @bolt_user = Bolt::User.find(params[:id])

      respond_to do |format|
        if @bolt_user.update_attributes(params[:bolt_user])
          format.html { redirect_to :action=>'index', :notice => 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "show" }
          format.json { render :json => @bolt_user.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /bolt/users/1
    # DELETE /bolt/users/1.json
    def destroy
      @bolt_user = Bolt::User.find(params[:id])
      @bolt_user.destroy

      respond_to do |format|
        format.html { redirect_to bolt_users_url }
        format.json { head :no_content }
      end
    end
        
  end
end
