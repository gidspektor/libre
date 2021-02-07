from django.urls import path, re_path, include
from api.views import EventsSearch, LocationSearch, User

urlpatterns = [
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
    User.UserInfoView.as_view(),
    name='user_info'
  )
]
