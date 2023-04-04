class Admin::GenresController < ApplicationController

 def index
   @genres = Genre.all
   @genre = Genre.new
 end

 def create
   @genre = genre.new(genre_params)
   if @genre.save
     flash[:notice] = "ジャンルを登録しました"
     redirect_to admin_genres_path
   else
     @genre = Genre.all
     render 'index'
   end
 end

 def edit
     @genre = Genre.find(params[:id])
 end

 def update
     @genre = Genre.find(params[:id])
  if @genre.update(genre_params)
      flash[:notice] = "編集が成功しました"
      redirect_to admin_genres_path
  else
      @genre = Genre.find(params[:id])
      render "edit"
  end
 end

 private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
