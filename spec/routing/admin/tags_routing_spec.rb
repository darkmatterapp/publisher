require 'rails_helper'
RSpec.describe Admin::TagsController, type: :routing do
 describe 'routing' do
        it 'routes to #index' do
     expect(get: '/admin/tags').to route_to('admin/tags#index')
        end

        it 'routes to #new' do
     expect(get: '/admin/tags/new').to route_to('admin/tags#new')
        end

        it 'routes to #show' do
     expect(get: '/admin/tags/1').to route_to('admin/tags#show', id: '1')
        end

        it 'routes to #edit' do
     expect(get: '/admin/tags/1/edit').to route_to('admin/tags#edit', id: '1')
        end

        it 'routes to #create' do
     expect(post: '/admin/tags').to route_to('admin/tags#create')
        end

        it 'routes to #update via PUT' do
     expect(put: '/admin/tags/1').to route_to('admin/tags#update', id: '1')
        end

        it 'routes to #update via PATCH' do
     expect(patch: '/admin/tags/1').to route_to('admin/tags#update', id: '1')
        end

        it 'routes to #destroy' do
     expect(delete: '/admin/tags/1').to route_to('admin/tags#destroy', id: '1')
        end
 end
end
