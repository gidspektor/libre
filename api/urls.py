from api.views import Events, LocationSearch, User, Messages, Collaborate
from django.urls import path, re_path, include
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

urlpatterns = [
  # Messages
  path('host-request/',
    Messages.HostMessageRequest.as_view(),
    name='host_message_request'
  ),

  # Authorization
  path('auth/login/', obtain_jwt_token),

  path('auth/refresh_login/', refresh_jwt_token),

  # Search
  path('events/<location>/',
    Events.EventsListView.as_view(),
    name='events'
  ),

  path('locations/<search_string>/',
    LocationSearch.SearchLocationListView.as_view(),
    name='locations'
  ),

  # User actions
  path('create-user/',
    User.CreateUserView.as_view(),
    name='user_creation'
  ),

  path('user-info/',
    User.UserView.as_view(),
    name='user_info'
  ),

  # Event actions
  path('purchase-ticket/',
    Events.EventTicketPurchaseView.as_view(),
    name='purchase_tickets'
  ),

  # user posts
  path('posts/<location>/',
    Collaborate.SearchPosts.as_view(),
    name='posts'
  ),

  path('create-post/',
    Collaborate.CreatePost.as_view(),
    name='create_post'
  ),

  path('create-comment/',
    Collaborate.CreateComment.as_view(),
    name='create_comment'
  ),

  path('get-comments/<post_id>',
    Collaborate.GetComments.as_view(),
    name='get_comments'
  )
]
