json.data do
  json.user do
    json.call(
      @user,
      :id,
      :first_name,
      :last_name,
      :email,
      :authentication_token
    )
  end
end
