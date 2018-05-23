User.create!(name:  "EikoNakanisi",
             section: "Hyogo_univ",
             email: "renshu@email.co.jp",
             password:              "admin2018",
             password_confirmation: "admin2018",
             admin: true)

50.times do |i|
     User.create(:name => "テスト #{i}",
                 :section => "所属#{i}",
                 :email => "renshu#{i}@email.co.jp",
                 :password => "password#{i}",
                 :password_confirmation => "password#{i}",
                 )
end
