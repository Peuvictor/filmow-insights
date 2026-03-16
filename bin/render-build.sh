#!/usr/bin/env bash
# exit on error
set -o errexit

# Atualiza o RubyGems para evitar erro de incompatibilidade com a Nokogiri

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
