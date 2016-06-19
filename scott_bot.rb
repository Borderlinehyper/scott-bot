class ScottBot

  ::RBNACL_LIBSODIUM_GEM_LIB_PATH = '/var/www/scottBot/libsodium.dll'
  require 'discordrb'

  bot = Discordrb::Commands::CommandBot.new token: 'MTg0NDM3NTE4ODY1NzkzMDI0.CiUaUw.ONJh2Ue-WzuPT-w1rbyoYw4Wzr4', application_id: 184437272823726080, prefix: '!'

  puts "This bot's invite URL is #{bot.invite_url}."
  puts 'Click on it to invite it to your server.'

  bot.run :async

  bot.bucket :voices_long, limit: 4, time_span: 60,  delay:15
  bot.bucket :voices_short, limit: 10, time_span: 60, delay: 7

  sassyquotes = ['/var/www/scottBot/Sassy1.mp3', '/var/www/scottBot/Sassy2.mp3', '/var/www/scottBot/Sassy3.mp3',
                 '/var/www/scottBot/Sassy4.mp3', '/var/www/scottBot/Sassy5.mp3', '/var/www/scottBot/Sassy6.mp3',
                 '/var/www/scottBot/Sassy7.mp3']

  clarencequotes = ['/var/www/scottBot/Clarence1.mp3', '/var/www/scottBot/Clarence2.mp3', '/var/www/scottBot/Clarence3.mp3']

  partysongs = ['/var/www/scottBot/PartyInTheUSA.mp3']

  fucktracks = ['/var/www/scottBot/fuck.mp3', '/var/www/scottBot/fuckmytomatoes.mp3']

  voice = bot.find_channel('General')
  details = voice.inspect
  puts details

  rate_message = 'Leave it yeah, you cunt, there\'s %time% seconds before it can be used again'

  bot.command(:r) do |event|
    event.voice.destroy
    nil
  end

  bot.command(:no, bucket: :voices_long, rate_limit_message:(rate_message)) do |event|
    id = event.user.id
    inspect = id.inspect
    puts inspect
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/no.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:cunt, bucket: :voices_short, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/cunt.wav')
    event.voice.destroy
    nil
  end

  bot.command(:johncena, bucket: :voices_long, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/johncena.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:ainsley, bucket: :voices_short, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/ainslyharriot.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:jamesbond, bucket: :voices_long, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/JamesBond.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:stormz, bucket: :voices_short, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/bodiedbystormz.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:foxflute, bucket: :voices_long, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/foxflute.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:sassy, bucket: :voices_short, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    sasquote = sassyquotes.sample
    event.voice.play_file(sasquote)
    event.voice.destroy
    nil
  end

  bot.command(:partysong, bucket: :voices_short, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    psongs = partysongs.sample
    event.voice.play_file(psongs)
    event.voice.destroy
    nil
  end

  bot.command(:clarence, bucket: :voices_long, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    claquote = clarencequotes.sample
    event.voice.play_file(claquote)
    event.voice.destroy
    nil
  end

  bot.command(:pureskill, bucket: :voices_short, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    event.voice.play_file('/var/www/scottBot/opsxtactics.mp3')
    event.voice.destroy
    nil
  end

  bot.command(:FUCK, bucket: :voices_long, rate_limit_message:(rate_message)) do |event|
    bot.voice_connect(180763507594100737)
    fquotes = fucktracks.sample
    event.voice.play_file(fquotes)
    event.voice.destroy
    nil
  end

  bot.sync

end
