class ArticlesController<ApplicationController
    
    def show 
        @article=Article.find(params[:id])
    end

    def index
        @articles=Article.all
    end

    def edit
        @article=Article.find(params[:id])
    end

    def new
        @article=Article.new
    end

    def create
        @article =Article.new(params.require(:article).permit(:Title, :Description))
        if @article.save
            flash[:notice]= "Article was created successfully."
            redirect_to article_path(@article) # redirecting to show action
        else 
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:Title, :Description))
            flash[:notice]= "Article was updated successfully"
            redirect_to @article
        else 
            render 'edit'
        end

    end
end