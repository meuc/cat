curl -X POST -u 1c801b4b-997c-441f-a527-dae8eb92d99c:bevNaQsdjtUN \
	--header "Content-Type: application/json" \
	--header "Accept: audio/wav" \
	--data "{\"text\":\"hello world\"}" \
	--output hello_world.wav \
	"https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize"