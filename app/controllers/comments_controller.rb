class CommentsController < ApplicationController
	 http_basic_authenticate_with name: "heha", password: "noice", only: :destroy

	def create
		@article = Article.find(params[:article_id])
		@comment = Comment.new(comment_params)
		@comment.article_id = @article.id
		if @comment.save
			redirect_to article_path(@article)
		else
			render 'articles/show'
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
