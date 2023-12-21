class LikecommentController < ApplicationController

    def like
        l= params[:like]
        num=l.to_i
        num=num+1
        article =Article.find_by(id:params[:id])
        render json: Like.create(like:num,article_id:article.id,user_id:article.user_id)

    end


    def comment
        article =Article.find_by(id:params[:id])
        t= article.comment_count.to_i
        t=t+1
        article.update(comment_count:t)
        render json: Comment.create(comment:params[:comment],user_id:article.user_id,article_id:params[:id])
    end

    def editcomment
        user=User.find(params[:id])
        comment= Comment.find(params[:comment_id])
        if user.id ==comment.user_id
            render json: Comment.update(comment:params[:comment])
        else
            render json: {error: "You can not edit"}
        end
    end

    def deletecomment
        user =User.find(params[:id])
        comment= Comment.find(params[:comment_id])
        if user.id ==comment.user_id
             render json: comment.destroy
        else
            render json: {error:"you cant delete"}
        end
    end
end
