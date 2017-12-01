namespace :db do
  desc 'Create all endpoint and user indices'
  task create: :environment do
    Webservices::Application.model_classes.each do |model_class|
      model_class.create_index unless model_class.index_exists?
    end
    UrlMapper.create_index unless UrlMapper.index_exists?
    User.create_index!
  end

  desc 'Delete all indices relating to this project and environment'
  task drop: :environment do
    ES.client.indices.delete(index: [ES::INDEX_PREFIX, '*'].join(':'))
  end
  desc "it does a thing"
  task :work, [:option, :foo, :bar] => [:environment] do |t, args|
    puts "work", args
  end

  task :drop_index, [:model, :index] => :environment do |task, args|
    if args[:index]
      ES.client.indices.delete(index: [args[:index]])
    else args[:model]
      model_class = args[:model].constantize
      ES.client.indices.delete(index: [model_class.index_name]) if model_class.try(:index_exists?)
    end
  end

end
