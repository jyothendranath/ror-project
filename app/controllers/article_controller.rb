class ArticleController < ApplicationController

    def createarticle
        
        category = Category.find_by(category_name:params[:category_name])

        if category.present?
            article=Article.create(title:params[:title],text:params[:text],description:params[:description],user_id:params[:id],category_id:category.id)
            if (article).valid?
                render json: article
            else
                render json: {error:"article must have text title and description"}
            end

        else
            newcategory= Category.create(category_name:params[:category_name])
            article=Article.create(title:params[:title],text:params[:text],description:params[:description],user_id:params[:id],category_id:newcategory.id)
            if (article).valid?
                render json: article
            else
                render json: {error:"article must have text title and description" }
            end


        end


    end
    def getallarticles
        render json: Article.joins(:category).joins(:user).select(:id,:title,:description,:user_name,:category_name,:created_at )
    end
    def editarticle
        article= Article.find(params[:id])
        category = Category.find_by(category_name:params[:category_name])
        if category.present?
            render json: article.update(title:params[:title],text:params[:text],description:params[:description],category_id:category.id)

        else
            newcategory= Category.create(category_name:params[:category_name])
            render json: article.update(title:params[:title],text:params[:text],description:params[:description],category_id:newcategory.id)

        end
       
    end

    def delete
        render json: Article.destroy_by(id:params[:id])
    end

    def getarticlesbyauthor
        render json: Article.joins(:category).joins(:user).where("user_name LIKE ?","%#{params[:user_name]}%").select(:id,:title,:description,:text,:user_name,:category_name,:created_at )

    end

    def userarticles
        render json:Article.joins(:user).joins(:category).where(user_id:params[:user_id]).select(:id,:title,:text,:description,:user_name,:category_name,:created_at )
    end

    def byarticleid
        comments= Comment.find_by(article_id:params[:article_id])
        render json: Article.joins(:user).joins(:category).joins(:comments).where(id:params[:article_id]).select(:id,:title,:text,:description,:user_name,:user_id,:category_name,:created_at ,:comment)

    end

    def categoryfilter
        render json: Article.joins(:category).joins(:user).where("category_name LIKE ?","%#{params[:category_name]}%").select(:id,:title,:description,:text,:user_name,:category_name,:created_at )
    end

    def articletitle
        render json: Article.joins(:category).joins(:user).where("title LIKE ?","%#{params[:title]}%").select(:id,:title,:text,:description,:user_name,:category_name,:created_at )
    end


    def getcomments
        render json: Article.joins(:comments).where(id:params[:id]).joins(:user).select(:comment,:user_name,:comment.cou)
    end

    def commentsofarticles
        # comments= Article.joins(:comments).where(id:params[:id])

        # count= comments.all.count

        # render json: {comments: count}



        render json: Article.joins(:comments).select(:id,:title,"count(comments.id) as commentscount").group('articles.id').order('commentscount desc')
    end

end
