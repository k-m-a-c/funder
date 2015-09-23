namespace :transfer_payments do
  desc "Create transfer payments from a given spreadsheet file"
    task :import => :environment do

      require 'roo'

      puts "Starting task runner..."
      file = "./transfer_payments.xlsx"
      import(file)
      puts "Import complete."

      def import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|

          # transform the spreadsheet row into a Ruby hash
          row = Hash[[header, spreadsheet.row(i)].transpose]

          # create the TransferPayments and insert them into the DB
          ministry = Ministry.find_by(name: row["Ministry"])
          organization = Organization.find_by(name: row["Organization"])
          transfer_payment = TransferPayment.new(amount: row["Amount"])

          transfer_payment.ministry = ministry
          transfer_payment.organization = organization
          transfer_payment.save!
        end
      end

      def open_spreadsheet(file)
        case File.extname(File.basename(file))
        when ".xlsx" then Roo::Excelx.new(file)
        else raise "Unknown file type"
        end
      end
    end
end