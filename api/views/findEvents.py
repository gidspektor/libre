from rest_framework.views import APIView

class FindEvents(APIView):

    def get(self, request):
        self.grab_latest_events()

    def grab_latest_events(self):
        events = 0
        return events