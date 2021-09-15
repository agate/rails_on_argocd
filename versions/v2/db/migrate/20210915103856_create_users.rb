# frozen_string_literal: true

# Migration Body
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end

    User.create(username: 'sam')
    User.create(username: 'dean')

    # pretend this is a long migration
    # so that we can keep our eyes on argocd ui
    sleep 120
  end
end
