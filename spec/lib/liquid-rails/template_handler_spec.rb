require 'spec_helper'

describe 'Request', type: :feature do
  context 'render without layout' do
    it 'renders with liquid template' do
      visit '/'

      expect(page.body).to eq 'Liquid on Rails'
    end

    it 'sets content_type as html by default' do
      visit '/'

      expect(page.response_headers['Content-Type']).to eq('text/html; charset=utf-8')
    end
  end

  context 'render with layout' do
    it 'renders with layout' do
      visit '/index_with_layout'

      expect(page.body).to eq "Application Layout\nLiquid on Rails"
    end
  end

  context 'render with partial' do
    it 'no full path for the current controller' do
      visit '/index_partial'

      expect(page.body).to eq "Application Layout\nLiquid on Rails\n\nHome Partial\nShared Partial"
    end

    it 'full path' do
      visit '/index_partial_with_full_path'

      expect(page.body).to eq "Application Layout\nLiquid on Rails\n\nHome Partial\nShared Partial"
    end
  end
end