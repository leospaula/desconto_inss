require 'rails_helper'

RSpec.describe 'Autenticação de Usuário', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { User.create!(email: 'user@example.com', password: 'password123') }

  it 'permite que o usuário faça login com credenciais válidas' do
    visit new_user_session_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Senha', with: 'password123'
    click_button 'Login'

    expect(page).to have_content('Olá, user@example.com')
    expect(page).to have_button('Logout')
  end

  it 'não permite que o usuário faça login com credenciais inválidas' do
    visit new_user_session_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Senha', with: 'senha_errada'
    click_button 'Login'

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'permite que o usuário faça logout' do
    visit new_user_session_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Senha', with: 'password123'
    click_button 'Login'

    click_button 'Logout'
    expect(page).to have_content('Login')
  end
end
