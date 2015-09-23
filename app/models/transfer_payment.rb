class TransferPayment < ActiveRecord::Base
  belongs_to :organization
  belongs_to :ministry

  def self.import!
    run_import_task
  end

  private
  def run_import_task
    require 'rake'
    Rails.application.load_tasks
    Rake::Task['transfer_payments:import']
  end

end
