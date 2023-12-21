Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

post "/signup",to: "authentication#signup"

post "/login",to: "authentication#login"

get "/profile/:id",to: "user#profile"

put "/editprofile/:id",to: "user#editprofile"

post "/article/:id/",to: "article#createarticle"

put "/article/:id",to: "article#editarticle"

delete "/article/:id",to: "article#delete"

get "/articles",to: "article#getallarticles"

get "/authorarticles/:user_name",to: "article#getarticlesbyauthor"


get "/userarticles/:user_id",to: "article#userarticles"

get "article/:article_id",to: "article#byarticleid"

get "category/:category_name",to: "article#categoryfilter"

get "articlefilter/:title",to: "article#articletitle"

post "/like/:like/:id",to: "likecomment#like"

post "/comment/:id",to: "likecomment#comment"

put "/comment/:comment_id/:id",to: "likecomment#editcomment"

delete "/comment/:id/:comment_id",to: "likecomment#deletecomment"

get "/comments/:id",to: "article#getcomments"

get "/commentscount/:id",to: "article#countcomments"

get "/articlescommentscount",to: "article#commentsofarticles"

end
