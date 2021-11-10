class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def show
    movies_ids = Bookmark.where(list_id: params[:id]).pluck(:movie_id)
    @movies = Movie.where(id: movies_ids)
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
