module Shared::DoesEntriesController
  as_trait do |name, domain: :drawer|
    class_name = name.to_s.camelize
    domain_class = domain.to_s.camelize.constantize
    collection_variable = "@#{name}s"
    instance_variable = "@#{name}"
    domain_variable = "@#{domain}"

    define_method "index" do
      send("load_#{name}s")
      render layout: 'modal'
    end

    define_method "show" do
      send("load_#{name}")
      render layout: 'modal'
    end

    define_method 'new' do
      send("build_#{name}")
      render layout: 'modal'
    end

    define_method 'edit' do
      send("load_#{name}")
      render layout: 'modal'
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

    define_method "load_#{name}s" do
      instance_variable_set(collection_variable, send("#{name}_scope").all)
    end

    define_method "load_#{name}" do
      instance_variable_set(instance_variable, send("#{name}_scope").find(params[:id]))
    end

    define_method "build_#{name}" do
      instance_variable_set(instance_variable, instance_variable_get(instance_variable) || send("#{name}_scope").new(creator: current_user))
      instance_variable_get(instance_variable).attributes = send("#{name}_params")
      if instance_variable_get(instance_variable).send("#{domain}_id")
        instance_variable_get(instance_variable).send("#{domain}=", current_power.send("updatable_#{domain.to_s.pluralize}").find(instance_variable_get(instance_variable).send("#{domain}_id")))
      end
    end

    define_method "save_#{name}" do
      if instance_variable_get(instance_variable).save
        if domain == :drawer
          drawer = instance_variable_get(instance_variable).drawer
          current_user.drawer_mappings.find_by(drawer_id: drawer.id).touch
        else
          domain_object = instance_variable_get(instance_variable).send(domain)
          domain_object.touch
          domain_object.drawer.touch
        end
        redirect_to root_path
      end
    end

    define_method "#{name}_params" do
      instance_params = params[name]
      instance_params ? instance_params.permit(permitted_params) : {}
    end

  end
end
