json.array! @users do |user|
  json.(user, :id, :username, :email, :first_name, :last_name)
  json.image_url 'https://cdn-images-1.medium.com/max/1200/1*i2skbfmDsHayHhqPfwt6pA.png'
end
