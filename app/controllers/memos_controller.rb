class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]
# Create
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to @memo
    else
      render :new
    end
  end
  
# Read
  def show
    @comment = Comment.new
    @comments = @memo.comments
  end

  def index
    # binding.pry
    @memos = Memo.order(created_at: :DESC).page(params[:page]).per(10)
  end
  
# Update
  def edit
    unless current_user == @memo.user
      redirect_to @memo
    end
  end
  
  def update
    if @memo.update(memo_params)
      redirect_to @memo
    else
      render :edit
    end
  end
  
# Destroy
  def destroy
    @memo.destroy!
    redirect_to root_path
  end
  
  private
  def set_memo
    @memo = Memo.find(params[:id])
  end
  
  def memo_params
    params.require(:memo).permit(:title, :content, :user_id)
  end
  
  def is_owner?
    redirect_to root_path unless current_user == @memo.user
  end
end