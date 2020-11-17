class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  def show

  end
  def new
    @blog = Blog.new
  end
  def edit

  end
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: 'ブログを作成しました'
      else
        render :new
      end
    end
  end
  def update
      unless @blog.update(blog_params) then
        redirect_to blogs_path, notice: '編集が失敗しました。'
      else
        flash.now[:notice] = 'ブログを編集しました。'
        render :show
      end
  end
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
  end
  end
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'ブログを削除しました。' }
      format.json { head :no_content }
    end
  end
  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end
end
