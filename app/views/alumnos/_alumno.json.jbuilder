json.extract! alumno, :id, :user_id, :course_id, :created_at, :updated_at
json.url alumno_url(alumno, format: :json)
