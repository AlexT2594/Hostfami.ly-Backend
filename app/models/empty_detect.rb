module EmptyDetect
  def missing_attrs(model)
    !model || model.attributes.any?{ |k, v| v.nil? || v == "" }
  end
end
