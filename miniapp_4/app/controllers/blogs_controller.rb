class BlogsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    if params[:id] == nil then
      @blogs = Blog.includes(:user).all.order("created_at DESC").page(params[:page]).per(5)
    else
      @blogs = current_user.blogs.page(params[:page]).per(5).order("created_at DESC")
    end
  end

  def new

  end

  def create
    Blog.create(comment: blog_params[:comment], user_id: current_user.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
      blog = Blog.find(params[:id])
      blog.update(blog_params) if blog.user_id == current_user.id
  end

  def destroy
      blog = Blog.find(params[:id])
      blog.destroy if blog.user_id == current_user.id
  end

  private
  def blog_params
    params.require(:blog).permit(:comment)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
