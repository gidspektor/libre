from django.urls import path, re_path

from api.views import EventsSearch

urlpatterns = [
    path('latest-events/<country>/',
        EventsSearch.LatestEvents.as_view(),
        name='latest_events')
]
