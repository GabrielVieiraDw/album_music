# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    level = level.to_sym
    case level
    when :notice then 'alert alert-primary'
    when :success then 'alert alert-success'
    when :errors then 'alert alert-danger'
    end
  end
end
