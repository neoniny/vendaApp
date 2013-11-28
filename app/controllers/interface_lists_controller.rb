class InterfaceListsController < ApplicationController
  before_action :set_interface_list, only: [:show, :edit, :update, :destroy]

  # GET /interface_lists
  # GET /interface_lists.json
  def index
    @interface_lists = InterfaceList.all
  end

  # GET /interface_lists/1
  # GET /interface_lists/1.json
  def show
  end

  # GET /interface_lists/new
  def new
    @interface_list = InterfaceList.new
  end

  # GET /interface_lists/1/edit
  def edit
  end

  # POST /interface_lists
  # POST /interface_lists.json
  def create
    @interface_list = InterfaceList.new(interface_list_params)

    respond_to do |format|
      if @interface_list.save
        format.html { redirect_to @interface_list, notice: 'Interface list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @interface_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @interface_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interface_lists/1
  # PATCH/PUT /interface_lists/1.json
  def update
    respond_to do |format|
      if @interface_list.update(interface_list_params)
        format.html { redirect_to @interface_list, notice: 'Interface list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @interface_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interface_lists/1
  # DELETE /interface_lists/1.json
  def destroy
    @interface_list.destroy
    respond_to do |format|
      format.html { redirect_to interface_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interface_list
      @interface_list = InterfaceList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interface_list_params
      params.require(:interface_list).permit(:ref, :name, :interface_type, :definition)
    end
end
