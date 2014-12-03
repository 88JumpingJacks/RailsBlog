class CommentsController < ApplicationController
	 http_basic_authenticate_with name: "heha", password: "noice", only: :destroy

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		#@comment = Comment.new(comment_params)
		#@comment.article_id = @article.id


		if @comment.save
			redirect_to article_path(@article)
		else
			# FIX THIS: if you create a comment that violates 
			# comment validations, errors are shown but comment 
			# is still created!!!
			render 'articles/show'
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		#@comments.article_id = @article.id
		@comment = @article.comments.find(params[:id])
		if @comment.destroy
			redirect_to article_path(@article)
		else
			render 'articles/show'
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end