require 'sinatra'
require 'dinosaurus'

Dinosaurus.configure do |config|
  config.api_key = '7bd51e75ee28a1a3a51a0c976c4d9b0e'
end

get '/lorem' do
  redirect 'lorem.html'
end


post '/process' do
  @topic = params['word']
  #@word = params['sentence']
  @nsentences = params['nsentences']
  @nparagraph = params['nparagraphs']
  #here's where I need to pass the topic variable to some thesaurus agent
  #assemble all your paragraphs etc
  #end up with some array like @content = [[First paragraph],[second paragraph],[third paragraph . . . ]]

  results = []
  results = Dinosaurus.lookup(@topic)

  results2 = []
  results2 = Dinosaurus.lookup(results['noun']['syn'].sample)

  #x = @words.to_i
  y = @nsentences.to_i
  z = @nparagraph.to_i

  @nwords = []
  @sentences = []
  @content = []

  results['noun']['syn'].each do |word|
    @nwords << word
  end

  results2['noun']['syn'].each do |word|
    @nwords << word
  end

  z.times do
    @sentences = (1..y).map{(1..15).map{@nwords.sample}.join(" ")}.join(". ").to_s + "."
    @content << @sentences

  end

=begin
  y.times do
    a_sentence = []

    15.times do
      a_sentence << @nwords.sample
    end

    @sentences << a_sentence #.to_s + "." #.join('. ') #.to_s + "."

  end
=end




  #@contentclean = @content.join(' ')
#  if @sentences >= 1
#    @contentclean.split('.')
#  end

  # z.times do
  #   @content << @nsentences
  #
  #   y.times do
  #     @nsentences << @nwords
  #
  #     x.times do
  #       @nwords << results[0]['noun']['syn'].sample
  #     end
  #   end
  # end



  erb :some_file

end
