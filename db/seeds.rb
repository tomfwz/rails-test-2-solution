[
  'Is Ruby better than Python?',
  'Should abortion be legal?',
  'Should gay marriage be legal?',
  'Are fat people lazy?',
  'Is SASS better than LESS?',
  'Is ReactJS better than AngularJS?'
].each do |content|
  ap Topic.where(content: content).first_or_create!
end