class AddQuarterlyIntervalUnit < ActiveRecord::Migration[5.2]
  def up
    # Add quarterly (4) to the interval_units enum
    execute <<-SQL
      ALTER TYPE solidus_subscriptions_interval_units ADD VALUE 'quarter' AFTER 'year';
    SQL
  end

  def down
    # Note: PostgreSQL doesn't support removing enum values
    # This is a one-way migration
  end
end 