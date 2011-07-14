# encoding: UTF-8
class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.paginate :page => params[:page], :order => 'id DESC'
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to({:action => 'index'}, {:notice => 'Post добавлен'})
    else
      render :action, '"new"'
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Изменения внесены')
    else
      render :action, '"edit"'
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to (posts_url)
  end
end
