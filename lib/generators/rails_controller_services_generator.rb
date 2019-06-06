# frozen_string_literal: true

require 'rails_controller_services/extender'

class RailsControllerServicesGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  class_option :models, type: :array, aliases: '-m', desc: '利用するモデル'

  def generate_controller
    template template_name, file_path
  end

  def generate_interactors
    interactors.each { |interactor| generate('rails_interactor', interactor) }
  end

  def generate_model_concerns
    model_concerns.each { |model_concern| generate('rails_model_concern', model_concern) }
  end

  def generate_responders
    responders.each { |responder| generate('rails_responder', responder) }
  end

  private

  using RailsConstNormalizer

  # @return [Array<String>]
  def acts
    args.map(&:permit!)
  end

  # @return [String]
  def template_name
    'controller.rb.erb'
  end

  # @return [String]
  def klass
    name.to(:controller, :klass)
  end

  # @return [Pathname]
  def file_path
    Rails.root.join('app').join(name.to(:controller, :file_path))
  end

  using RailsControllerServices::Extender

  # @return [String]
  def interactor_klass(act)
    "#{name.to(:controller, :with_out_suffix)}##{act.permit!}".to(:interactor, :klass)
  end

  # @return [String]
  def responder_klass(act)
    "#{name.to(:controller, :with_out_suffix)}##{act.permit!}".to(:responder, :klass)
  end

  # @return [Array<String>]
  def interactors
    name.to(:controller, :with_out_suffix).with(:actions, acts).to_a
  end

  # @return [Array<String>]
  def model_concerns
    name.to(:controller, :with_out_suffix).with(:actions, acts).to_a.with(:models, options[:models].to_a)
  end

  # @return [Array<String>]
  def responders
    name.to(:controller, :with_out_suffix).with(:actions, acts).to_a
  end
end
