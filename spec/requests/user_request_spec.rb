# require 'rails_helper'

# RSpec.describe "Users", type: :request do
#   #index
#   describe "GET #index" do
#     subject { get(users_path)}
#     context"ユーザーが存在する時" do
#       before { create_list(:name,"佐藤")}    
#       it "リクエストが成功する" do
#         subject     
#         expect(response).to have_http_status(:ok)
#       end
    
#       it "name が表示されている" do
#         subject
#         expect(response.body).to include(user1.name, user2.name, user3.name)
#       end
#     end
#   end

#   #show
#   describe "GET #show" do
#     context "ユーザーが存在する時" do
#       it "リクエストが成功する" do
#         user = create(:user)
#         get(user_path(user.id))
#         expect(response).to have_http_status(:ok)
#       end
      
#       it "nameが表示されている" do
#       end 

#       it "ageが表示されている" do
#       end

#       it "emailが表示されている" do
#       end

#     end
#   end


#   #new
#   describe "GET #new" do
#     subject { get(new_user_path) }
#     it "リクエストが成功する" do
#       subject
#       expect(response).to have_http_status(:ok)
#     end
#   end

#   #create


#   #edit

#   #update

#   #destroy


# end