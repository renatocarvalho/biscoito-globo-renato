# encoding: utf-8
class Admin::NewsController < ApplicationController
  # GET /admin/news
  # GET /admin/news.json
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end


  # GET /admin/news/1
  # GET /admin/news/1.json
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news }
    end
  end


  # GET /admin/news/new
  # GET /admin/news/new.json
  def new
    @news = News.new
    @url = admin_news_index_path
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end


  # GET /admin/news/1/edit
  def edit
    @news = News.find(params[:id])
    @url = admin_news_path(@news)
  end


  # POST /admin/news
  # POST /admin/news.json
  def create
    @news = News.new(params[:news])
    @url = admin_news_index_path
    respond_to do |format|
      if @news.save
        format.html { redirect_to admin_news_path(@news), notice: 'Notícia salva com sucesso.' }
        format.json { render json: admin_news_path(@news), status: :created, location: admin_news_path(@news) }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /admin/news/1
  # PUT /admin/news/1.json
  def update
    @news = News.find(params[:id])
    @url = admin_news_path(@news)
    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to admin_news_path(@news), notice: 'Notícia atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/news/1
  # DELETE /admin/news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to admin_news_index_path }
      format.json { head :no_content }
    end
  end
end