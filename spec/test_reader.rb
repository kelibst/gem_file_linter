def test_filedata
  file = File.open('test.txt', 'r')

  filedata = file.read
  file.close
  filedata
end
