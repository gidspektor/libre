from api.views import Events, LocationSearch, User, Messages, Comments, Posts, JasonWebTokens
from django.urls import path, re_path, include
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

urlpatterns = [
  # Messages
  path('host-request/',
    Messages.HostMessageRequest.as_view(),
    name='host_message_request'
  ),

  # Google login
  path('auth/google',
    User.GoogleLoginSignUp.as_view(),
    name='google_login'
  ),

  # Authorization
  path('auth/login/',
    JasonWebTokens.ObtainJasonWebToken.as_view(),
    name='obatin_jwt'
  ),

  path('auth/refresh_login/',
    JasonWebTokens.RefreshJasonWebToken.as_view(),
    name='refresh_token'
  ),

  # Search
  path('events/<location>/',
    Events.EventsListView.as_view(),
    name='events'
  ),

  path('locations/<search_string>/',
    LocationSearch.LocationListView.as_view(),
    name='locations'
  ),

  # User actions
  path('create-user/',
    User.NewUserView.as_view(),
    name='user_creation'
  ),

  path('user-info/',
    User.UserInfoDetailView.as_view(),
    name='user_info'
  ),

  path('user-event-info/',
    User.UserEventsView.as_view(),
    name='user_events'
  ),

  # Event actions
  path('purchase-ticket/',
    Events.EventTicketPurchaseView.as_view(),
    name='purchase_tickets'
  ),

  # User posts
  path('posts/<location>/',
    Posts.PostsListView.as_view(),
    name='posts'
  ),

  path('create-post/',
    Posts.CreatePost.as_view(),
    name='create_post'
  ),

  path('user-posts/',
    Posts.UserPostsListView.as_view(),
    name='user_posts'
  ),

  path('user-commented-posts/',
    Posts.UserCommentedOnPostsListView.as_view(),
    name='user_commented_on_posts'
  ),

  # User comments
  path('create-comment/',
    Comments.CreateComment.as_view(),
    name='create_comment'
  ),

  path('get-comments/<post_id>/',
    Comments.CommentsListView.as_view(),
    name='get_comments'
  )
]
