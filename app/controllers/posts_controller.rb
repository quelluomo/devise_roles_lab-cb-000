class PostsController < ApplicationController

#user create read update delete own
#vip all user + update others
#admin all + delete posts

  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id

    Post.create(
      content: params[:post][:content],
      user_id: user_id
    )

    redirect_to user_path(id: user_id)
  end


  def destroy
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
     return head(:forbidden) unless current_user == @post.user || current_user.vip? || current_user.admin?
     @post.update(posts_params)
   end
 end

  #def update
  #    if !current_user.admin? && !current_user.vip?
  #    redirect_to :back, :alert => "Access denied."
  #  else
  #    @post = Post.find_by(params[:id])
  #    @post.update!(content: params[:post][:content])
  #    redirect_to post_path
  #  end
  #end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
