json.user do
  json.call(
    @user,
    :id,
    :first_name,
    :last_name,
    :email,
    :created_at
  )
end
json.token token
