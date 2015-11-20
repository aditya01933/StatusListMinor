class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  require 'json'
  require 'open-uri'

  # GET /members
  # GET /members.json
  def index
    # url = 'https://idfy.0x10.info/api/idfy-status?type=json&query=list_member&page=1'
    # data = JSON.load(open(url))
    # members = data['members']
    @ethnic = Member.ethnic
    # @members = []
    # members.each do |member|
    #   attributes = member.except("id")
    #   @members <<  Member.create(attributes)
    # end

  if params[:vegan].present?

    @members = Member.where(is_veg: true).order(:id).page(params[:page]) 
  elsif params[:type].present?
    @members = Member.where(ethnicity: params[:type]).order(:id).page(params[:page])
  else  
    @members = Member.order(:id).page(params[:page])

  end 
    
  end

  def search
    query, page = params[:query].try(:downcase), params[:page] || 1


    @members = Member.all.where('lower(status) like ?', "%#{query}%")
    @members = Member.all.where('lower(height) like ?', "%#{query}%")
    # @members = Member.all.where('lower(ethnicity) like ?', "%#{query}%")
                                  
    
                                                               

  end


  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:status, :ethnicity, :weight, :height,  :vegan, :is_veg, :drink, :dob, :image)
    end
end
