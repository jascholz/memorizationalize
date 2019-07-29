module Shared::DoesEntriesController
  as_trait do |name, domain: :category|
    class_name = name.to_s.camelize
    domain_class = domain.to_s.camelize.constantize
    instance_variable = "@#{name}"
    domain_variable = "@#{domain}"

    define_method "show" do
      send("load_#{name}")
    end

    define_method 'new' do
      send("build_#{name}")
    end

    define_method 'edit' do
      send("load_#{name}")
    end

    define_method 'create' do
      send("build_#{name}")
      if !send("save_#{name}")
        render partial: "#{name}s/form"
      end
    end

    define_method 'update' do
      send("load_#{name}")
      send("build_#{name}")
      send("save_#{name}")
    end

    private

    define_method "load_#{name}" do
      instance_variable_set(instance_variable, class_name.constantize.find(params[:id]))
    end

    define_method "build_#{name}" do
      instance_variable_set(instance_variable, instance_variable_get(instance_variable) || class_name.constantize.new(creator: current_user))
      instance_variable_get(instance_variable).attributes = send("#{name}_params")
      if instance_variable_get(instance_variable).send("#{domain}_id")
        instance_variable_get(instance_variable).send("#{domain}=", domain_class.find(instance_variable_get(instance_variable).send("#{domain}_id")))
      end
    end

    define_method "save_#{name}" do
      if instance_variable_get(instance_variable).save
        if domain == :category
          category = instance_variable_get(instance_variable).category
        elsif respond_to?(:category)
          category = instance_variable_get(instance_variable).send(domain).category
        end
        if category && current_user.categories.exclude?(category)
          current_user.categories << category
        end
        redirect_to root_path
      end
    end

    define_method "#{name}_params" do
      instance_params = params[name]
      instance_params ? instance_params.permit(permitted_params) : {}
    end

    define_method "load_#{name}s" do
      instance_variable_set("@#{name}", class_name.constantize)
    end

  end
end
