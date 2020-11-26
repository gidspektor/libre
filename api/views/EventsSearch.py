from rest_framework.views import APIView
from rest_framework_api_key.permissions import HasAPIKey
import datetime

class EventsListView(APIView):
    permission_classes = (HasAPIKey,)
    date_range = ''
    create_event = False

    def get(self, request):
        date_range = request.GET.get('dates', datetime.datetime.now())


class LatestEvents(EventsListView):
    date_range = datetime.datetime.now()


class SearchCreateEvents(EventsListView):
    create_event = True
