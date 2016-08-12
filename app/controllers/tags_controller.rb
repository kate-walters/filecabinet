class TagsController < ApplicationController

  def index
    if params[:search]
      search_params
    else
      tags = Tag.all
      render locals: { tags: tags.order[:name] }
    end
  end

  def show
    tag = Tag.find(params[:id])
    if tag
      if params[:search]
        search_params
      else
        render locals: { tag: tag }
      end
    end
  end

  def new
    if params[:search]
      search_params
    else
      render locals: { tag: Tag.new }
    end
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      redirect_to tag
    else
      render :new, locals: { tag: tag }
    end
  end

  def edit
    if params[:search]
      search_params
    else
      render locals: { tag: Tag.find(params[:id]) }
    end
  end

  def update
    tag = Tag.find(params[:id])
    if tag
      if tag.update(tag_params)
        redirect_to tag
      else
        render :edit
      end
    else
      render html: 'Tag not found', status: 404
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    if tag
      tag.destroy
      flash[:notice] = "Tag deleted"
      redirect_to tags
    else
      flash[:alert] = tag.errors
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:tagging_id, :name)
  end
end
