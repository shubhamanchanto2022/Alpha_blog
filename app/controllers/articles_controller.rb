class ArticlesController<ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    def show 
    end

    def index
        @articles=Article.all
    end

    def edit
    end

    def new
        @article=Article.new
    end

    def create
        @article =Article.new(article_params)
        if @article.save
            flash[:notice]= "Article was created successfully."
            redirect_to article_path(@article) # redirecting to show action
        else 
            # new way to write render
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice]= "Article was updated successfully"
            redirect_to @article
        else 
            # new way to write render
            render :edit, status: :unprocessable_entity
        end

    end

    def destroy
        @article.destroy
        redirect_to articles_path
      end

    private

    def set_article
        @article=Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:Title, :Description)

    end
end