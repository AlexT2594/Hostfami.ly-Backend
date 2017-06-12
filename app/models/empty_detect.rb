module EmptyDetect
  def missing_attrs(model)
    !model || model.attributes.any?{ |a| a.nil? || a == "" }
  end
end
