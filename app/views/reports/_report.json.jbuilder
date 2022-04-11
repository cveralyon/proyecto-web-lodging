json.extract! report, :id, :subject, :text, :file, :created_at, :updated_at
json.url report_url(report, format: :json)
