class FavoritesController < ApplicationController
  def create
    #いいねをしたユーザーidを入れる
    @favorite = current_user.favorites.build(favorite_params)
    #いいねされた投稿を入れる
    @post = @favorite.post
    #いいねが押されたレスポンスのフォーマットをJS形式のフォーマットで返す
    if @favorite.save
      respond_to :js
    end
  end
  
  def destroy
    #HTTPリクエストからidを抽出
    @favorite = Favorite.find_by(id: params[:id])
    @post = @favorite.post
    if @favorite.destroy
      respond_to :js
    end
  end
  
  private
    def favorite_params
      params.permit(:post_id)
    end
end
