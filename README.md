# RailsControllerServices
Controller及び、以下のサービスを生成します。
 - interactor
 - model_concern
 - responder


## Usage
    rails g controller_with_services controller_name index show create update delete destroy invalid_action -m model_one model_two model_three

    This will create:
        app/controllers/controller_names_controller.rb

        app/interactor/controller_names/index_interactor.rb
        app/interactor/controller_names/show_interactor.rb
        app/interactor/controller_names/create_interactor.rb
        app/interactor/controller_names/update_interactor.rb
        app/interactor/controller_names/destroy_interactor.rb

        app/repository/controller_names/index/model_one_repository.rb
        app/repository/controller_names/show/model_one_repository.rb
        app/repository/controller_names/create/model_one_repository.rb
        app/repository/controller_names/update/model_one_repository.rb
        app/repository/controller_names/destroy/model_one_repository.rb
        app/repository/controller_names/index/model_two_repository.rb
        app/repository/controller_names/show/model_two_repository.rb
        app/repository/controller_names/create/model_two_repository.rb
        app/repository/controller_names/update/model_two_repository.rb
        app/repository/controller_names/destroy/model_two_repository.rb
        app/repository/controller_names/index/model_three_repository.rb
        app/repository/controller_names/show/model_three_repository.rb
        app/repository/controller_names/create/model_three_repository.rb
        app/repository/controller_names/update/model_three_repository.rb
        app/repository/controller_names/destroy/model_three_repository.rb

        app/responder/controller_names/index_responder.rb
        app/responder/controller_names/show_responder.rb
        app/responder/controller_names/create_responder.rb
        app/responder/controller_names/update_responder.rb
        app/responder/controller_names/destroy_responder.rb

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_controller_services'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_controller_services, git: 'https://github.com/sogasusumu/rails_controller_services.git'
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
