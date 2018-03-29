# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Observation.create(category: 'バイタル', ob_name: '収縮期血圧', n_1d: '90', j_1d: '122', s_2d: '120', n_2d: '130', j_2d: '118', s_3d: '126', n_3d: '128', j_3d: '116', s_4d: '114', pt_no: '1')
Observation.create(category: 'バイタル', ob_name: '拡張期血圧', n_1d: '56', j_1d: '60', s_2d: '62', n_2d: '66', j_2d: '70', s_3d: '64', n_3d: '60', j_3d: '68', s_4d: '70', pt_no: '1')
Observation.create(category: 'バイタル', ob_name: '体温', n_1d: '37.5', j_1d: '36.5', s_2d: '36.8', n_2d: '36.3', j_2d: '36.4', s_3d: '36.6', n_3d: '36.5', j_3d: '36.1', s_4d: '36.5', pt_no: '1')
Observation.create(category: 'バイタル', ob_name: '呼吸', n_1d: '18', j_1d: '16', s_2d: '15', n_2d: '14', j_2d: '14', s_3d: '12', n_3d: '14', j_3d: '16', s_4d: '14', pt_no: '1')
Observation.create(category: '酸素', ob_name: 'SPO2', n_1d: '92', j_1d: '97', s_2d: '96', n_2d: '98', j_2d: '97', s_3d: '96', n_3d: '98', j_3d: '96', s_4d: '97', pt_no: '1')

