class PicturesController < ApplicationController
  http_basic_authenticate_with name: "heha", password: "noice", only: :destroy
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @article = Article.find(params[:article_id])
    @picture = Picture.new(picture_params)
    @picture.article_id = @article.id
    if @picture.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    if @picture.destroy
      redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
    else
      render 'articles/show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:description)
    end
end
