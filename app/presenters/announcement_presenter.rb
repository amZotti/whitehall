class AnnouncementPresenter < Whitehall::Decorators::Decorator
  include EditionPresenterHelper

  delegate_instance_methods_of *Announcement.concrete_descendants

  def as_hash
    super.merge({
      field_of_operation: field_of_operation,
      publication_collections: publication_collections
    })
  end

  def field_of_operation
    if model.respond_to?(:operational_field) && model.operational_field.present?
      "Field of operation: #{context.link_to(model.operational_field.name, model.operational_field)}"
    end
  end
end
