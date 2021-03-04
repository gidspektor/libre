from api.views import EventsSearch, LocationSearch, User
from django.urls import path, re_path, include
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

urlpatterns = [
  path('auth/login/', obtain_jwt_token),

  path('auth/refresh_login/', refresh_jwt_token),

  path('events/<location>/',
    EventsSearch.EventsListView.as_view(),
    name='events'
  ),

  path('locations/<search_string>/',
    LocationSearch.PartialSearchView.as_view(),
    name='locations'
  ),

  path('create/',
    User.CreateUserView.as_view(),
    name='user_creation'
  ),

  path('user-info/',
    User.UserView.as_view(),
    name='user_info'
  )
]
