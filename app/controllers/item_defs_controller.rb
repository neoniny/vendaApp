class ItemDefsController < ApplicationController
  before_action :set_item_def, only: [:show, :edit, :update, :destroy]

  # GET /item_defs
  # GET /item_defs.json
  def index
    @item_defs = ItemDef.all
  end

  # GET /item_defs/1
  # GET /item_defs/1.json
  def show
  end

  # GET /item_defs/new
  def new
    @item_def = ItemDef.new
  end

  # GET /item_defs/1/edit
  def edit
  end

  # POST /item_defs
  # POST /item_defs.json
  def create
    @item_def = ItemDef.new(item_def_params)

    respond_to do |format|
      if @item_def.save
        format.html { redirect_to @item_def, notice: 'Item def was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_def }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_def.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_defs/1
  # PATCH/PUT /item_defs/1.json
  def update
    respond_to do |format|
      if @item_def.update(item_def_params)
        format.html { redirect_to @item_def, notice: 'Item def was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_def.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_defs/1
  # DELETE /item_defs/1.json
  def destroy
    @item_def.destroy
    respond_to do |format|
      format.html { redirect_to item_defs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_def
      @item_def = ItemDef.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_def_params
      params.require(:item_def).permit(:requirement_id, :request_type, :api_version, :batch, :transport_type, :notification, :encryption, :job_frequency)
    end
end
