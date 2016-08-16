class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :edit, :flop, :update, :destroy]

  REQUEST_PER_PAGE = 7

  def new

    @request = Request.new

  end

  def create

    @request        = Request.new request_params

    if @request.save
      redirect_to request_path(@request), notice: "Request created successfully"
    else
      render :new
    end
  end

  def show
  end

  def index

    @search = Request.search(params[:query])
    @requests = @search.order(status: :asc, id: :desc).
                          page(params[:page]).
                          per(REQUEST_PER_PAGE)
  end

  def flop
    @request = Request.find(params[:id])
    @request.status = !@request.status
    @request.save!
    redirect_to requests_path
  end

  def edit
  end

  def update
    if @request.update request_params
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

  private
  def find_request
    @request = Request.find params[:id]
  end

  def request_params
    params.require(:request).permit([:name, :email, :department, :message])
  end

  # def self.search(keyword)
  #   where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  # end


end
