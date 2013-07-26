includes = ['C_Application/SC_OAM/BBC_BasebandBusConfiguration/src', 'C_Application/SC_OAM/DM_ALMAG/src', 'C_Application/SC_OAM/DM_FSM/src', 'C_Application/SC_OAM/FoundationModel/src', 'C_Application/SC_OAM/InternalInterfaces/src', 'C_Application/SC_OAM/include', 'I_Interface', 'C_Test/SC_OAM/MT_COMMONS', 'C_Application/SC_OAM/InternalInterfaces/include']
ctagsFileName = "ctags_includes"
File.open(ctagsFileName, 'w') do |ff|
    includes.each do |include|
        ff.puts Dir.pwd.gsub(/C_Test.*/,'') + include
    end
end
