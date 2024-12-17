from django.contrib import admin
from .models import (
    User, Event, Registration, Notification, Payment, Venue,
    Ticket, Review, Category, EventCategory
)

# User model for the backend
@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'email', 'first_name', 'last_name', 'created_at', 'updated_at')
    search_fields = ('username', 'email')
    list_filter = ('created_at', 'updated_at')

# Event model for the backend
@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'date_time', 'venue_id', 'created_by', 'created_at', 'updated_at')
    search_fields = ('title', 'location')
    list_filter = ('date_time', 'created_at', 'updated_at')

# Registration model for the backend
@admin.register(Registration)
class RegistrationAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'event', 'registration_date', 'ticket_type', 'number_of_tickets')
    search_fields = ('user__username', 'event__title')
    list_filter = ('registration_date',)

# Notification model for the backend
@admin.register(Notification)
class NotificationAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'event', 'message', 'sent_at')
    search_fields = ('user__username', 'event__title')
    list_filter = ('sent_at',)

# Payment model for the backend
@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ('id', 'registration', 'amount', 'status', 'payment_date')
    search_fields = ('registration__user__username',)
    list_filter = ('status', 'payment_date')

# Venue model for the backend
@admin.register(Venue)
class VenueAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'address', 'capacity', 'contact_info')
    search_fields = ('name', 'address')
    list_filter = ('capacity',)

# Ticket model for the backend
@admin.register(Ticket)
class TicketAdmin(admin.ModelAdmin):
    list_display = ('id', 'event', 'type', 'price', 'availability')
    search_fields = ('event__title', 'type')
    list_filter = ('availability',)

# Review model for the backend
@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('id', 'event', 'user', 'rating', 'comment', 'created_at')
    search_fields = ('event__title', 'user__username', 'comment')
    list_filter = ('rating', 'created_at')

# Category model for the backend
@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description')
    search_fields = ('name',)
    list_filter = ('name',)

# EventCategory model for the backend
@admin.register(EventCategory)
class EventCategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'event', 'category')
    search_fields = ('event__title', 'category__name')
