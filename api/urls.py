from django.urls import path, re_path

from . import views

urlpatterns = [
    path('latest-events/', 
        views.findEvents.FindEvents.as_view(),
        name='latest_events')
]
