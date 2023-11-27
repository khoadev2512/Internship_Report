# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'bootstrap', to: 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js', preload: true
pin 'popper.js', to: 'https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js', preload: true
pin 'jquery', to: 'https://code.jquery.com/jquery-3.6.0.min.js', preload: true
pin 'cocoon', to: 'cocoon.js', preload: true
pin 'trix', preload: true
pin '@rails/actiontext', to: 'actiontext.js'
# pin "rails-ujs", to: "rails-ujs.js"
