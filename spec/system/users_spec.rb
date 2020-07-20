require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない場合、サインページに移動する' do
    visit root_path
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、ルーとパスに遷移する' do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    expect(current_path).to eq new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on("Log in")
    expect(current_path).to eq root_path
  end


  it 'ログインに失敗し、再びサインページに戻ってくる' do
    @user = FactoryBot.create(:user)
    visit root_path
    fill_in 'user_email', with: Faker::Internet.free_email
    fill_in 'user_password', with: Faker::Internet.password(min_length: 6)
    click_on('Log in')
    expect(current_path).to eq new_user_session_path
  end
end
