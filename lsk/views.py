from django.shortcuts import render
from django.views import View


class ClassView(View):
    template_name = 'lsk/index.html'

    def get(self, request):
        return render(request, self.template_name)
