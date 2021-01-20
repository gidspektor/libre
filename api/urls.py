from django.urls import path, re_path

from api.views import EventsSearch, LocationSearch

urlpatterns = [
    path('events/<country>/',
        EventsSearch.EventsListView.as_view(),
        name='events'
    ),

    path('locations/<search_string>/',
        LocationSearch.PartialSearchView.as_view(),
        name='locations'
    )
]
