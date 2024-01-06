from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name = 'home'),
    path('dashboard/', views.dashboard, name = 'dashboard'),
    path('logout/', views.user_logout, name = 'logout'),
    path('order/', views.order_page, name = 'order'),
    path('order/<str:order_column>/<str:keyword>', views.order_page_search, name = 'order_search'),
    path('order/<str:pk>', views.order_record, name = 'order_record'),
    path('issue/', views.issue_page, name = 'issue'),
    path('issue/<str:pk>', views.issue_record, name = 'issue_record'),
    path('issue/<str:issue_column>/<str:keyword>', views.issue_page_search, name = 'issue_search'),
    path('membership/', views.membership, name = 'membership'),
    path('membership/<str:pk>', views.membership_record, name = 'membership_record'),
    path('membership/<str:member_column>/<str:keyword>', views.membership_search, name = 'membership_search'),
    path('incoming_call/', views.incoming_call, name = 'incoming_call'),
    path('incoming_call/<str:call_pk>', views.receive_call, name = 'rec_call'),
    path('hang_up/<str:pk>', views.hang_up, name = 'hang_up'),
    path('add_order/', views.add_order, name = 'add_order'),
    path('add_order/<str:call_pk>', views.add_order_page, name = 'add_order_page'),
    path('add_issue/', views.add_issue, name = 'add_issue'),
    path('add_issue/<str:call_pk>', views.add_issue_page, name = 'add_issue_page'),
    path('add_member/', views.add_member, name = 'add_member'),
    path('add_member/<str:call_pk>', views.add_member_page, name ='add_member_page'),
    path('report/', views.report, name = 'report'),
]