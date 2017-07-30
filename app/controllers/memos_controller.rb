class MemosController < ApplicationController
  
  #Create
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new
    @memo.title = params[:memo][:title]
    @memo.content = params[:memo][:content]
    @memo.user_id = params[:memo][:user_id]
    @memo.save
    redirect_to @memo
  end
  
  #Read
  def show
    @memo = Memo.find(params[:id])
  end

  def index
    @memos = Memo.order(created_at: :DESC).page(params[:page]).per(10)
  end

  #Update
  def edit
    @memo = Memo.find(params[:id])
  end
  
  def update
    @memo = Memo.new
    @memo.title = params[:memo][:title]
    @memo.content = params[:memo][:content]
    @memo.user_id = params[:memo][:user_id]
    @memo.save
    redirect_to @memo
  end
  #Destroy
  def destroy 
  end
end
