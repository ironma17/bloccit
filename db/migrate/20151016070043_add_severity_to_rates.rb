class AddSeverityToRates < ActiveRecord::Migration
  def change
    add_column :rates, :severity, :integer
  end
end
