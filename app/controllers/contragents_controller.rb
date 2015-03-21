class ContragentsController < ApplicationController
  before_action :set_contragent, only: [:show, :edit, :update, :destroy]

  # GET /contragents
  # GET /contragents.json
  def index
    @contragents = Contragent.all
  end

  # GET /contragents/1
  # GET /contragents/1.json
  def show
  end

  # GET /contragents/new
  def new
    @contragent = Contragent.new
  end

  # GET /contragents/1/edit
  def edit
  end

  # POST /contragents
  # POST /contragents.json
  def create
    @contragent = Contragent.new(contragent_params)

    respond_to do |format|
      if @contragent.save
        format.html { redirect_to @contragent, notice: 'Contragent was successfully created.' }
        format.json { render :show, status: :created, location: @contragent }
      else
        format.html { render :new }
        format.json { render json: @contragent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contragents/1
  # PATCH/PUT /contragents/1.json
  def update
    respond_to do |format|
      if @contragent.update(contragent_params)
        format.html { redirect_to @contragent, notice: 'Contragent was successfully updated.' }
        format.json { render :show, status: :ok, location: @contragent }
      else
        format.html { render :edit }
        format.json { render json: @contragent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contragents/1
  # DELETE /contragents/1.json
  def destroy
    @contragent.destroy
    respond_to do |format|
      format.html { redirect_to contragents_url, notice: 'Contragent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contragent
      @contragent = Contragent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contragent_params
      params.require(:contragent).permit(:name, :service, :contact, :phone, :rating, :comment)
    end
end
