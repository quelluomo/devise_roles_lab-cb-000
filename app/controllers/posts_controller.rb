class PostsController < ApplicationController

#user create read update delete own
#vip all user + update others
#admin all + delete posts

  def edit
  end


  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
             current_user.vip? ||
             current_user.try(:id) == @post.owner_id
    @post.update(post_params)
    end



  private

  def post_params
    params.require(:post).permit(:content)
  end

end
