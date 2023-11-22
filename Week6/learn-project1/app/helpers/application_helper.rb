# frozen_string_literal: true

module ApplicationHelper
  def display_error_message(model, field)
    if model.errors[field].any?
      content_tag(:div, model.errors[field].join(', '), class: 'error-message')
    end
  end
end
