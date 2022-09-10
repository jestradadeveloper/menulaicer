# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "tw-elements" # @1.0.0
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
