def test_filedata
  file = File.open('spec/test.txt', 'r')

  filedata = file.read
  file.close
  filedata
end
