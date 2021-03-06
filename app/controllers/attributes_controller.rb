class AttributesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /attributes
  # GET /attributes.json
  def index
    @attributes = Attribute.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attributes }
    end
  end

  # GET /attributes/1
  # GET /attributes/1.json
  def show
    @attribute = Attribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attribute }
    end
  end

  # GET /attributes/new
  # GET /attributes/new.json
  def new
    @attribute = Attribute.new
    @attribute_layers = []

    palettes = Palette.where(user_id: current_user.id)
    palettes.each do |palette|
      palette.attribute_layers.each do |layer|
        @attribute_layers << layer
      end
    end
  end

  # GET /attributes/1/edit
  def edit
    @attribute = Attribute.find(params[:id])
  end

  # POST /attributes
  # POST /attributes.json
  def create
    # @attribute = Attribute.new(params[:attribute])

    # respond_to do |format|
    #   if @attribute.save
    #     format.html { redirect_to @attribute, notice: 'Attribute was successfully created.' }
    #     format.json { render json: @attribute, status: :created, location: @attribute }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @attribute.errors, status: :unprocessable_entity }
    #   end
    # end
    @attribute = Attribute.create(params[:attribute])
  end

  # PUT /attributes/1
  # PUT /attributes/1.json
  def update
    @attribute = Attribute.find(params[:id])

    respond_to do |format|
      if @attribute.update_attributes(params[:attribute])
        format.html { redirect_to @attribute, notice: 'Attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attributes/1
  # DELETE /attributes/1.json
  def destroy
    @attribute = Attribute.find(params[:id])
    @attribute.destroy

    respond_to do |format|
      format.html { redirect_to attributes_url }
      format.json { head :no_content }
    end
  end
end
