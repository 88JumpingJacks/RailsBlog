class ArticlesController < ApplicationController
	 http_basic_authenticate_with name: "heha", password: "noice", except: [:index, :show]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@comment = Comment.new(comment_params)
		@comment.article_id = @article.id

		if @comment.save
			redirect_to article_path(@article)
		else
			render 'articles/show'
		end
	end

	def show
		@article = Article.find(params[:id])
		
		# Implement picture uploading later
		#@pictures = @article.pictures
		#@picture = Picture.new

		@comments = @article.comments
		@comment = Comment.new
	end

	def index
		@articles = Article.all
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
	  @article = Article.find(params[:id])
 
  	if @article.update(article_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end