bundle:
	bundle install --path vendor/bundle

link:
	cd spec/dummy && ln -s ../../spec

rspec_i:
	spec/dummy/bin/rails generate rspec:install

rm_dummy_spec:
	rm spec/dummy/spec

init:
	bundle
	link
	rspec_i
	rm_dummy_spec

lint:
	bundle exec rubocop ./lib -c .rubocop.yml -R -a

test:
	bundle exec rspec

g:
	spec/dummy/bin/rails g rails_controller_services controller_name index show create update delete -m model_one model_two

d:
	spec/dummy/bin/rails d rails_controller_services controller_name

pre_commit:
	lint
	test

console:
	spec/dummy/bin/rails c
