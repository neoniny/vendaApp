class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    if current_user
      @requirements = Requirement.all
    else
      redirect_to log_in_path, :notice => "Please log in first!"
    end
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    #@requirement = Requirement.new
    if current_user

      session[:requirement_params] ||= {}
      @requirement = Requirement.new(session[:requirement_params])
      if session[:requirement_params]["creater"] == current_user
        session[:requirement_step] ||= 'client'
      else
        session[:requirement_step] = 'client'
      end
      @requirement.current_step = session[:requirement_step]
      @api = Interface.all 
      api_hash = Hash.new 
      item_hash = Hash.new 
      @standard_list = []
      session[:api_param_hash] ||= api_hash
      session[:item_param] = item_hash

      @standard = Interface.where("api_type='standard'")
      @standard.each do |s| 
          @standard_list.push s.id
      end
      session[:standard_all]=@standard_list
    else
      redirect_to log_in_path, :notice => "Please log in first!"
    end
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    session[:requirement_params].deep_merge!(params[:requirement]) if params[:requirement]
    #@requirement = Requirement.new(requirement_params)
    @requirement = Requirement.new(session[:requirement_params])
    @requirement.current_step = session[:requirement_step]
    session[:entprs_name] = @requirement.entprs_name

    api_version = session[:version_param]
    api_hash = session[:api_param_hash]

    #step: client -> batch -> standard -> item -> confirm
    if @requirement.valid?
      if params[:back_button]
        @requirement.previous_step
      elsif params[:cancel_button]
        @requirement.current_step = "client"
      elsif @requirement.last_step?
        @requirement.save
      else
        @requirement.next_step
        #get batch API parameter from check box
        #hash 0-no 1-checked
        #if @requirement.current_step == 'standard' || @requirement.current_step == 'itemdef'
        if @requirement.current_step == 'batch'
          @client=Client.where("entprs_name='"+@requirement.entprs_name+"'").first
          session[:client_name] = @client.client_name
        end
          #after 'batch' click next -> 'standard'
          if @requirement.current_step == 'standard' 
            session[:version_param] = params[:api_version]
            api_hash = session[:api_param_hash]
            #api_hash["versionselect"] = api_version
            #edit here! for session!!!!
            @api_batch = Interface.where("api_type='batch' and api_version='"+session[:version_param]+"'")
            @api_batch.each do |arr|
              if params["#{arr.id}"]
                api_hash["#{arr.id}"] = 1 
              else
                api_hash["#{arr.id}"] = 0
              end
            end
          end #end batch
          #after 'standard' click next -> 'itemdef'
          if @requirement.current_step == 'itemdef' 
            session[:standard_select] = params[:standard_button]
            

            @api_batch = Interface.where("api_type='standard'")
            @api_batch.each do |arr|
              if params["#{arr.id}"]
                api_hash["#{arr.id}"] = 1
              else
                api_hash["#{arr.id}"] = 0
              end
            end
          end #end itemdef
          #confirm set other value
          if @requirement.current_step == 'confirm'
            count = 0;
            for item_def in @requirement.item_defs
              if item_def.job_frequency == 'other'
                current = "job_frequency_"+count.to_s
                item_def.job_frequency = params["#{current}"]
              end
              count += 1
            end
          end #end set other
          #save session of itemdef
          session[:api_param_hash] = api_hash
        #end #end get batch api
      end
      session[:requirement_step] = @requirement.current_step
    end

    if @requirement.new_record?
      render 'new' 
    else
      session[:client_name] = session[:test] = session[:api_param_hash] =nil
      session[:api_param] = nil
      session[:requirement_step] = session[:requirement_params] = nil
      session[:item_param] = nil
      flash[:notice] = "Requirement saved"
      redirect_to @requirement
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url }
      format.json { head :no_content }
    end
  end

     def link_to_remove_fields(name, f)
      f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_params
      params.require(:requirement).permit(:client_name)
    end

    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to requirements_path
      end
    end

end
