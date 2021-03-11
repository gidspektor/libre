from api.views import Events, LocationSearch, User, Messages
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
    LocationSearch.PartialSearchView.as_view(),
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
    name='purchaseTickets'
  )
]
