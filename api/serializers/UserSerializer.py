from rest_framework import serializers
from api.models import UserSocialLogin
from django.contrib.auth.models import User


class UserSerializer(serializers.ModelSerializer):
  class Meta:
    model = User
    fields = '__all__'
    extra_kwargs = {
      'first_name': {'required': True},
      'last_name': {'required': True},
      'password': {'required': True},
      'username': {'required': True},
      'email': {'required': True}
    }

  def create(self, validated_data):
    print(validated_data)
    user = User.objects.create_user(
      first_name=validated_data['first_name'],
      last_name=validated_data['last_name'],
      username=validated_data['username'],
      email=validated_data['email']
    )

    user.set_password(validated_data['password'])
    user.save()

    if self.context.get('social_signup', ''):
      UserSocialLogin.objects.create(user=user)

    return user

  def validate_password(self, value):
    if len(value) < 8:
      raise serializers.ValidationError('Make sure your password is at least 8 character.')

    return value
  
  def validate_username(self, value):
    user_already_exists = User.objects.filter(username=value).first()

    if user_already_exists:
      raise serializers.ValidationError('User already exists with that email.')
    
    return value
