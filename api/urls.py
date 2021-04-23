from api.views import Events, LocationSearch, User, Messages, Comments, Posts, JasonWebTokens, UserEventsAssoc
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

  # Events
  path('events/<location>/',
    Events.EventList.as_view(),
    name='events'
  ),

  path('purchase-ticket/',
    UserEventsAssoc.UserEventsAssocDetail.as_view(),
    name='purchase_tickets'
  ),

  # Search
  path('locations/<search_string>/',
    LocationSearch.LocationListView.as_view(),
    name='locations'
  ),

  # User
  path('create-user/',
    User.UserDetail.as_view(),
    name='user_creation'
  ),

  path('user-info/',
    User.UserInfo.as_view(),
    name='user_info'
  ),

  path('user-events/',
    UserEventsAssoc.UserEventsAssocList.as_view(),
    name='user_events'
  ),

  path('user-posts/',
    Posts.UserPostsList.as_view(),
    name='user_posts'
  ),

  path('user-comments/',
    Comments.UserCommentsList.as_view(),
    name='user_comments'
  ),

  # Posts
  path('posts/<location>/',
    Posts.AllPostsList.as_view(),
    name='posts'
  ),

  path('create-post/',
    Posts.PostDetail.as_view(),
    name='create_post'
  ),

  # Comments
  path('create-comment/',
    Comments.CommentsDetail.as_view(),
    name='create_comment'
  ),

  path('get-comments/<post_id>/',
    Comments.CommentsList.as_view(),
    name='get_comments'
  )
]
