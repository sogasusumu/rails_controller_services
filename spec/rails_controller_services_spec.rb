require 'rails_helper'
require 'rails_controller_services/extender'

describe 'RailsControllerServices' do
  describe 'Extender' do
    using RailsControllerServices::Extender

    describe 'String#actions' do
      let(:acts) { %w(index show create update delete) }
      let(:receiver) { 'receivers' }
      let :expected do
        [
            'receivers#index',
            'receivers#show',
            'receivers#create',
            'receivers#update',
            'receivers#delete'
        ]
      end

      let(:actual) { receiver.with(:actions, acts) }

      it :should_return_expected do
        expect(actual).to eq(expected)
      end
    end

    describe 'Array#models' do
      let :controller_with_actions do
        %w(controllers#index controllers#show controllers#create controllers#update controllers#delete)
      end
      let(:models) { %w(model_one model_two) }

      let :expected do
        ['controllers#index-model_one',
         'controllers#show-model_one',
         'controllers#create-model_one',
         'controllers#update-model_one',
         'controllers#delete-model_one',
         'controllers#index-model_two',
         'controllers#show-model_two',
         'controllers#create-model_two',
         'controllers#update-model_two',
         'controllers#delete-model_two']
      end

      let(:actual) { controller_with_actions.with(:models, models) }

      it :should_return_expected do
        expect(actual).to eq expected
      end
    end
  end
end
