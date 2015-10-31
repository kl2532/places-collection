class PublicListsController < ApplicationController
  before_action :set_public_list, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_user, :only => [:show]

  # GET /public_lists
  # GET /public_lists.json
  def index
    @public_lists = PublicList.all
  end

  # GET /public_lists/1
  # GET /public_lists/1.json
  def show
  end

  # GET /public_lists/new
  def new
    @public_list = PublicList.new
  end

  # GET /public_lists/1/edit
  def edit
  end

  # POST /public_lists
  # POST /public_lists.json
  def create
    @public_list = PublicList.new(public_list_params)
    @public_list.user = current_user

    respond_to do |format|
      if @public_list.save
        format.html { redirect_to @public_list, notice: 'Public list was successfully created.' }
        format.json { render :show, status: :created, location: @public_list }
      else
        format.html { render :new }
        format.json { render json: @public_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_lists/1
  # PATCH/PUT /public_lists/1.json
  def update
    respond_to do |format|
      if @public_list.update(public_list_params)
        format.html { redirect_to @public_list, notice: 'Public list was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_list }
      else
        format.html { render :edit }
        format.json { render json: @public_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_lists/1
  # DELETE /public_lists/1.json
  def destroy
    @public_list.destroy
    respond_to do |format|
      format.html { redirect_to public_lists_url, notice: 'Public list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_list
      @public_list = PublicList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_list_params
      params.require(:public_list).permit(:name, :description)
    end
end
