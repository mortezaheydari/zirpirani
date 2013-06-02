class MeemsController < ApplicationController
  include SessionsHelper

    before_filter :before_change, only: [:new, :edit, :create, :destroy, :update]


  def index
    @meems = Meem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meems }
    end
  end

  def show
    @meem = Meem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meem }
    end
  end

  def new
    @meem = Meem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meem }
    end
  end

  def edit
    @meem = Meem.find(params[:id])
  end

  def create
    @meem = Meem.new(params[:meem])

    respond_to do |format|
      if @meem.save
        format.html { redirect_to @meem, notice: 'Meem was successfully created.' }
        format.json { render json: @meem, status: :created, location: @meem }
      else
        format.html { render action: "new" }
        format.json { render json: @meem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @meem = Meem.find(params[:id])

    respond_to do |format|
      if @meem.update_attributes(params[:meem])
        format.html { redirect_to @meem, notice: 'Meem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meem = Meem.find(params[:id])
    @meem.destroy

    respond_to do |format|
      format.html { redirect_to meems_url }
      format.json { head :no_content }
    end
  end
end
