task :default => :tu

desc "Pruebas unitarias de la clase Fraccionario"
task :tu do
  sh "ruby -I. test/tc_fraccionario.rb"
end

desc "Pruebas simples de la clase Fraccionarios"
task :simple do
  sh "ruby -I. test/tc_fraccionario.rb -n /simple/"
end

desc "Pruebas de tipo de la clase Fraccionarios"
task :type do
  sh "ruby -I. test/tc_fraccionario.rb -n /type_check/"
end