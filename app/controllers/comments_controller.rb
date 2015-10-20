class CommentsController < ApplicationController
  def new
  end

  def create
    @count = 0
    Post.all.sort_by(&:date).reverse.each do |z|
      if (z.date.past? || z.date.today?) && (@count < 1)
        @last = z
        @count += 1
      end
    end 

    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.post_id == nil
      @comment.post_id = @last.id
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: "You Just Commented" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
