from django.urls import path, re_path

from api.views import EventsSearch

urlpatterns = [
    path('latest-events/<location>/',
        EventsSearch.LatestEvents.as_view(),
        name='latest_events')
]
