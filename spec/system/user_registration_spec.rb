require 'rails_helper'

RSpec.describe 'Registro de Usuário', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'permite que um novo usuário se registre' do
    visit new_user_registration_path

    fill_in 'Email', with: 'newuser@example.com'
    fill_in 'Senha', with: 'password123'
    fill_in 'Confirmação de Senha', with: 'password123'
    click_button 'Registrar'

    expect(page).to have_content('Olá, newuser@example.com')
    expect(page).to have_button('Logout')
  end
end
